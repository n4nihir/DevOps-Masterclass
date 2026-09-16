resource "aws_instance" "demo_ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    monitoring = var.enable_monitoring

    tags = {
        Name = var.instance_name
        Environment = var.environment
        Owner = "Terraform"
    }
}

resource "aws_iam_user" "demo_user" {
  name = var.iam_user_name

  tags = {
    Purpose = var.iam_purpose
  }
}

resource "aws_s3_bucket" "terraform-demo-bucket" {
  bucket = var.bucket_name

  tags = {
    Purpose = var.bucket_purpose
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "terraform-demo-bucket-versioning" {
  count = var.enable_versioning ? 1 : 0
  bucket = aws_s3_bucket.terraform-demo-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}