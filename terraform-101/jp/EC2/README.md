## EC2

> Pre-requirement

> complete all configurations refer to XXXXXXXXX(初期設定のページリンク)


---
1. Open XXXXX.tf on Visual Studio Code.

2. Edit XXXXX.tf as follows then save the file.

```
provider "aws" {
    profile = "" // your aws cli profile name
    region = "ap-southeast-2" //do not change
  
}

variable "datadog_api_key" {}

resource "aws_instance" "resouce-name" {    // any name
  #comment
  ami = "ami-0954a49a9348487cc". // do not change
  instance_type = "t2.micro"  // do not change
  vpc_security_group_ids = ["sg-0774fd50ef028439a"]  // do not change
  key_name = "terraform-workshop-kawazu"  //your key pair name

  tags = {
    Name = "Terraform-workshop-test-kawazu-5". //Any name is acceptable, but please make sure it is recognizable as yours!
  }

  user_data = <<EOF
#!/bin/bash
DD_AGENT_MAJOR_VERSION=7 DD_API_KEY="${var.datadog_api_key}" DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"
EOF
 
}
output "ec2_instance_id" {
 value = aws_instance.resource-name.id // resource-name is the one you set resouce block. 
}

output "public_ip" {
  value       = aws_instance.test01.public_ip // resource-name is the one you set resouce block.
}
```

3. Open the terminal from Terminal >> new Terminal (Not necessary if already open)

6. Change current directory `% cd Datadog/EC2`

7. Run command `% terraform init` to initialize

8. Take a look `Terraform has been successfully initialized!` is appeared.

```
nobuyuki.kawazu@COMP-C02G43ELML87 AWS % terraform init 
Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v4.20.0

Terraform has been successfully initialized!
```

9. If you have an error, need to edit tf file then exec `% terraform plan` until without error.

	When you have edited the file, save it and run the ```% terraform Plan``` command.


10. Run command `% terraform apply` to create ec2.

	you can see the execution plan.

```
nobuyuki.kawazu@COMP-C02G43ELML87 AWS % terraform plan 
aws_instance.test01: Refreshing state... [id=i-03af36e2fb6fc90c5]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following
symbols:
  + create
  - destroy
  # aws_instance.test02 will be created
  + resource "aws_instance" "test02" {
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
      + key_name                             = "terraform-workshop-kawazu"
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
          + "Name" = "Terraform-workshop-test-kawazu-6"
        }
      + tags_all                             = {
          + "Name" = "Terraform-workshop-test-kawazu-6"
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

11. Enter a value `yes`
```
message:
  Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

```

12. Make sure your EC2 has been created.

	*Please note instance_id and public_ip!*
```
aws_instance.test02: Creating...
aws_instance.test02: Still creating... [10s elapsed]
aws_instance.test02: Creation complete after 17s [id=i-0fcf16927ac8669c6]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

ec2_instance_id = "i-03af36e2fb6fxxxxx"
public_ip = "3.25.124.xxx"
```


13. connect to your ec2 via SSH then confirm your datadog agent is active.

14. Open the Datadog Application on your browser, and you can see your ec2-host in the infrastructure list.

### *Hands-on EC2 is completed. The next is Create Monitor.*
