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

output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value = aws_instance.demo_ec2.id
}

output "ec2_private_ip" {
  description = "Private IP of the EC2 instance"
  value = aws_instance.demo_ec2.private_ip
}

output "ec2_instance_arn" {
  description = "ARN of the EC2 instance"
  value = aws_instance.demo_ec2.arn
}

output "s3_bucket_name" {
  description = "Name of the S3 Bucket"
  value = aws_s3_bucket.terraform-demo-bucket.bucket_namespace
}

output "s3_bucket_arn" {
  description = "ARN of the S3 Bucket"
  value = aws_s3_bucket.terraform-demo-bucket.arn
}

output "iam_user_name" {
  description = "Name of the IAM User"
  value = aws_iam_user.demo_user.name
}

output "iam_user_arn" {
  description = "ARN of the IAM User"
  value = aws_iam_user.demo_user.arn
}