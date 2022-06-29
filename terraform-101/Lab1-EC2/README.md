## Lab1 - create EC2

In this Lab, you will create a EC2 using Terraform.

## Create .tf file
1. Open `ec2.tf` on Visual Studio Code.

2. Edit `ec2.tf` as follows then save the file.

```
provider "aws" {
    profile = "terraform"
    region = "ap-southeast-2"
}

variable "datadog_api_key" {}

resource "aws_instance" "ec2" {
  ami = "ami-0954a49a9348487cc"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0774fd50ef028439a"]
  key_name = "<YOUR KEY PAIR from Lab0>"

  tags = {
    Name = "Terraform-workshop-name". //Any name is ok, but please make sure it is recognizable as yours!
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
```

## Running terraform

1. Open the terminal in VS Code from `Terminal` >> `new Terminal` (Or you can use terminal/iTerm2 on your Mac!)

2. Change current directory 
```
$ cd Lab1-EC2
```

3. initialize terraform

```
$ terraform init 
Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v4.20.0

Terraform has been successfully initialized!
```

Take a look `Terraform has been successfully initialized!` is appeared.

4. Run Terraform to create ec2.

```
$ terraform apply -var-file ../terraform.tfvars
```

you can see the execution plan.

```
aws_instance.ec2: Refreshing state... [id=i-03af36e2fb6fc90c5]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create
  - destroy
  # aws_instance.ec2 will be created
  + resource "aws_instance" "ec2" {
      + ami                                  = "ami-0954a49a9348487cc"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "terraform-workshop-name"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "Terraform-workshop-name"
        }
      + tags_all                             = {
          + "Name" = "Terraform-workshop-name"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "7a44f652a1f57f3a36e15bf60bc94a53a384d39f"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = [
          + "sg-0774fd50ef028439a",
        ]

      + capacity_reservation_specification {
          + capacity_reservation_preference = (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id                 = (known after apply)
              + capacity_reservation_resource_group_arn = (known after apply)
            }
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + maintenance_options {
          + auto_recovery = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_card_index    = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + private_dns_name_options {
          + enable_resource_name_dns_a_record    = (known after apply)
          + enable_resource_name_dns_aaaa_record = (known after apply)
          + hostname_type                        = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  ~ ec2_instance_id = (known after apply)
  ~ public_ip       = (known after apply)

```

5.  Enter `yes`
```
message:
  Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

```

6. Make sure your EC2 has been created.

	*Please note `instance_id` and `public_ip`!*
```
aws_instance.ec2: Creating...
aws_instance.ec2: Still creating... [10s elapsed]
aws_instance.ec2: Creation complete after 17s [id=i-0fcf16927ac8669c6]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

ec2_instance_id = "i-03af36e2fb6fxxxxx"
public_ip = "3.25.124.xxx"
```

[AWS Console link](https://ap-southeast-2.console.aws.amazon.com/ec2/v2/home?region=ap-southeast-2#Instances:instanceState=running)

7. connect to your ec2 via SSH then confirm your datadog agent is active.
  
```
$ ssh -i "YOUR-SSH-KEY.pem" root@ec2-35-xx-xxx-xxx.ap-southeast-2.compute.amazonaws.com
```

8. Open the Datadog on your browser, and you can see your EC2 host in the [Infrastructure List](https://app.datadoghq.com/infrastructure).

### *Hands-on EC2 is completed. The next is Create Monitor. → [Lab2](./../Lab2-Monitor/README.md)*
