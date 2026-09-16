# -------------------------------
# Variable configuration
# -------------------------------
# This tells Terraform:
# - Variable declaration
# - Variable type
# - Variable value

variable "instance_type" {
  type = string
  description = "EC2 Instance Type"
  default = "t3.micro"
}

variable "instance_name" {
  type = string
  description = "EC2 Instance Name"
  default = "default"
}

variable "enable_monitoring" {
  type = bool
  description = "EC2 Instance Monitoring"
  default = false
}

variable "ami_id" {
  type = string
  description = "AMI ID for EC2 Instance"
  # default = "ami-0b5358cc8c5df0b02"
}

variable "environment" {
  type = string
  description = "Environment for EC2 Instance"
  # default = "demo"
}

variable "iam_user_name" {
  type = string
  description = "IAM User Name"
  # default = "terraform-demo-user"
}

variable "iam_purpose" {
  type = string
  description = "IAM user purpose"
  # default = "terraform-demo"
}

variable "bucket_name" {
  type = string
  description = "S3 Bucket Name"
  # default = "nihir-terraform-demo-bucket-1"
}

variable "bucket_purpose" {
  type = string
  description = "S3 Bucket Purpose"
  # default = "terraform-demo"
}

variable "enable_versioning" {
  type = bool
  description = "Enable S3 Bucket Versioning"
  default = false
}