# -------------------------------
# Terraform block
# -------------------------------
# This block tells Terraform:
# 1. Which providers are required
# 2. Where to download them from
# 3. Which version to use

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.64.0"
    }
  }
}


# -------------------------------
# Provider configuration
# -------------------------------
# This tells Terraform:
# - Which cloud to talk to (AWS)
# - Which region to create resources in

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

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

# -------------------------------
# Resource block (EC2 instance)
# -------------------------------
# This block defines an AWS EC2 instance

resource "aws_instance" "demo_ec2" {
    ami = "ami-0b5358cc8c5df0b02"
    # instance_type = "t3.micro"
    instance_type = var.instance_type
    monitoring = var.enable_monitoring

    tags = {
        Name = var.instance_name
    }
}

# --------------------------------
# Output section
# --------------------------------
# This block defines an output
# It helps to get the values of the resources created

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value = aws_instance.demo_ec2.public_ip
  # sensitive = true
}

output "ec2_id" {
  description = "ID of the EC2 instance"
  value = aws_instance.demo_ec2.id
}

# -------------------------------
# Resource block (IAM user)
# -------------------------------
# This block defines an AWS IAM user

# resource "aws_iam_user" "demo_user" {
#   name = "terraform-demo-user"

#   tags = {
#     Purpose = "terraform-demo"
#   }
# }

# -------------------------------
# Resource block (S3 bucket)
# -------------------------------
# This block defines an AWS S3 bucket

# resource "aws_s3_bucket" "terraform-demo-bucket" {
#   bucket = "nihir-terraform-demo-bucket"

#   tags = {
#     Purpose     = "terraform-demo"
#     Environment = "demo"
#   }
# }

# -------------------------------
# Resource block (S3 bucket versioning)
# -------------------------------
# This block defines an AWS S3 bucket versioning

# resource "aws_s3_bucket_versioning" "terraform-demo-bucket-versioning" {
#   bucket = aws_s3_bucket.terraform-demo-bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }