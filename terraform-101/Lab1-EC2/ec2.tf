provider "aws" {
  profile = "terraform"
  region  = "ap-southeast-2"
}

variable "datadog_api_key" {}

resource "aws_instance" "ec2" {
  ami                    = "ami-0954a49a9348487cc"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0774fd50ef028439a"]
  key_name               = "<YOUR KEY PAIR from Lab0>" # Replace to your key pair!

  tags = {
    Name = "Terraform-workshop-<NAME>" # Any name is ok, but please make sure it is recognizable as yours!
  }

  user_data = <<EOF
#!/bin/bash
DD_AGENT_MAJOR_VERSION=7 DD_API_KEY="${var.datadog_api_key}" DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"
EOF

}
output "ec2_instance_id" {
  value = aws_instance.ec2.id
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}