#!/bin/bash -eu

# OS detection
case "$(uname -s)" in
Darwin)
  export TOOL_OS="darwin"
  ;;
Linux)
  export TOOL_OS="linux"
  ;;
esac

# Utility functions
err() { echo "$0:" "$@" 1>&2 ; }
die() { err "$@" ; exit 1 ; }

# Utility function for a usage message
usage() {
  die "$0:" "usage is as follows" "

  $0 ACCT TENANT [PROJECT]

  Where, ACCT must be 'dev' or 'prod', and PROJECT (if given) must be the name of a Terraform project
"
}

# Utility function to log a command before running it.
logged() {
  echo "$0:" "$@" 1>&2
  "$@"
}

# check to see how duplo_token will be loaded here, _util is loaded before _env in the TF action scripts
## if non interactive, die if duplo_token is not set
## if interactive, if duplo_token is set, proceed
## if interactive, if duplo_token is not set, if duplo-jit installed, proceed

# check if STDIN is a terminal, if it is assume we are being run by a user interactively
if [ -t 0 ]
then
  if [ -z "${duplo_token:-}" ]; then
    if ! command -v duplo-jit &> /dev/null
    then
        die "duplo-jit command not found and duplo_token not set"
    else
      duplo_token="$(duplo-jit duplo --host "$duplo_host" --interactive | jq -r '.DuploToken')"
    fi
  fi
else
  if [ -z "${duplo_token:-}" ]; then
    die "error: duplo_token: environment variable missing or empty"
  fi
fi

# Utility function to make a duplo API call with curl, and output JSON.
duplo_api() {
    local path="${1:-}"
    [ $# -eq 0 ] || shift

    [ -z "${path:-}" ] && die "internal error: no API path was given"
    [ -z "${duplo_host:-}" ] && die "internal error: duplo_host environment variable must be set"
    [ -z "${duplo_token:-}" ] && die "internal error: duplo_token environment variable must be set"

    curl -Ssf -H 'Content-type: application/json' -H "Authorization: Bearer $duplo_token" "$@" "${duplo_host}/${path}"
}

# Utility function to set up AWS credentials before running a command.
with_aws() {
  local duplo_tenant_id="${DUPLO_TENANT_ID:-}"
  [ -z "$duplo_tenant_id" ] && duplo_tenant_id="${duplo_default_tenant_id:-}"

  # Run the command in the configured way.
  case "${AWS_RUNNER:-duplo-admin}" in
  env)
    [ -z "${profile:-}" ] && die "internal error: no AWS profile selected"
    env AWS_PROFILE="$profile" AWS_SDK_LOAD_CONFIG=1 "$@"
    ;;
  duplo-admin)
    # Get just-in-time AWS credentials from Duplo and use them to execute the command.
    # shellcheck disable=SC2046     # NOTE: we want word splitting
    env -u AWS_PROFILE AWS_SDK_LOAD_CONFIG=1 $( duplo_api adminproxy/GetJITAwsConsoleAccessUrl |
            jq -r '{AWS_ACCESS_KEY_ID: .AccessKeyId, AWS_SECRET_ACCESS_KEY: .SecretAccessKey, AWS_REGION: .Region, AWS_DEFAULT_REGION: .Region, AWS_SESSION_TOKEN: .SessionToken} | to_entries | map("\(.key)=\(.value)") | .[]'
        ) "$@"
    ;;
  duplo)
    # Get just-in-time AWS credentials from Duplo and use them to execute the command.
    # shellcheck disable=SC2046     # NOTE: we want word splitting
    env -u AWS_PROFILE AWS_SDK_LOAD_CONFIG=1 $( duplo_api "subscriptions/${duplo_tenant_id}/GetAwsConsoleTokenUrl" |
            jq -r '{AWS_ACCESS_KEY_ID: .AccessKeyId, AWS_SECRET_ACCESS_KEY: .SecretAccessKey, AWS_REGION: .Region, AWS_DEFAULT_REGION: .Region, AWS_SESSION_TOKEN: .SessionToken} | to_entries | map("\(.key)=\(.value)") | .[]'
        ) "$@"
    ;;
  esac
}

# Utility function to run Terraform with AWS credentials.
# Also logs the command.
tf() {
  export TF_VAR_tenant_name="$tenant"
  export TF_VAR_infrastructure_name="$tenant"
  logged with_aws terraform "$@"
}

# Utility function to run "terraform init" with proper arguments, and clean state.
tf_init() {
  rm -f .terraform/environment .terraform/terraform.tfstate
  tf init "$@"
}
