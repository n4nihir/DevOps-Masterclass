# terraform.tfvars automatically gets picked by terraform apply command, for the rest terraform apply -var-file="<name>.tfvars" command works

instance_type = "t3.small"
enable_monitoring = true
instance_name = "tfvars-name"