
variable "region" {
  description = "Which AWS Region will the DuploCloud Infrastructure be created in"
  type        = string
  default     = "us-east-1"
}

variable "cidr_bit" {
  description = "This will control the 2rd octet of the AWS VPC created by the DuploCloud Infrastructure"
  type        = string
  default     = "1"
}
