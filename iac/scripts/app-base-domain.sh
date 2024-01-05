#!/bin/bash -eu

# shellcheck disable=SC1091   # VS code can't follow the below file
source "$(dirname "${BASH_SOURCE[0]}")/_util.sh"

eval "$(jq -r '@sh "INFRA_NAME=\(.infra_name)"')"

APP_BASE_DOMAIN=$(duplo_api /v3/admin/plans/$INFRA_NAME/dnsConfig | jq -r '.ExternalDnsSuffix')

jq -n --arg app_base_domain "$APP_BASE_DOMAIN" '{"app_base_domain":$app_base_domain}'
