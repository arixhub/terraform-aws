# --- s3/variables ---

##################################################################################
# GENERAL - VARIABLES
##################################################################################

variable "aws_region" {
  description = "AWS Region."
  type        = string
}

variable "aws_profile" {
  description = "Name of the profile."
  type        = string
}

variable "project_name" {
  description = "Name of the project."
  type        = string

  validation {
    condition     = length(var.project_name) <= 16 && length(regexall("[^a-zA-Z0-9-]", var.project_name)) == 0
    error_message = "The project tag must be no more than 8 characters, and only contain letters, numbers, and hyphens."
  }

}

variable "application_name" {
  description = "Name of the application."
  type        = string

  validation {
    condition     = length(var.application_name) <= 16 && length(regexall("[^a-zA-Z0-9-]", var.application_name)) == 0
    error_message = "The project tag must be no more than 8 characters, and only contain letters, numbers, and hyphens."
  }

}

variable "aws_ignore_tags" {
  type    = list(string)
  default = ["BILLINGCODE", "BILLINGCONTACT", "COUNTRY", "ENVIRONMENT", "FUNCTION", "MEMBERFIRM", "PRIMARYCONTACT", "SECONDARYCONTACT", "NETWORK"]
}

##################################################################################
# S3 Bucket - VARIABLES
##################################################################################

variable "s3_bucket_name" {
  type        = set(string)
  description = "Name of the Buckets to be created"
}

variable "force_destroy" {
  description = "Sets variable for Force Destroy of Terraform"
  type        = bool
  default     = null
}

