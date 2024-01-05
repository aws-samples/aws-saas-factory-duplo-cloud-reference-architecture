
variable "instance_type" {
  description = "Intance type for EKS worker nodes"
  type        = string
  default     = "t3a.medium"
}

variable "instance_count" {
  description = "Number of EKS worker nodes"
  type        = number
  default     = 2
}

variable "database_type" {
  description = "Which type of database the application will use.  Allowed values are: rds or in-memory"
  type        = string
  default     = "in-memory"
  validation {
    condition     = can(regex("^(rds|in-memory)$", var.database_type))
    error_message = "Allowed values are: 'rds' or 'in-memory'"
  }
}

variable "database_engine_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0.32"
}

variable "database_size" {
  description = "Storage capacity of the MySQL RDS"
  type        = string
  default     = "db.t3.medium"
}

variable "database_username" {
  description = "Administrative username for the MySQL RDS"
  type        = string
  default     = "administrator"
}

variable "congito_user_default_password" {
  description = "Default password for the dummy congito users"
  type        = string
  sensitive = true
  default     = "pS/Ffmzx1/sCDjDhcAqG"
}
