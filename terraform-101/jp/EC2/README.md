## EC2

> Pre-requirement

> complete all configurations refer to XXXXXXXXX(初期設定のページリンク)


---
1. Open XXXXX.tf on Visual Studio Code.

2. Edit XXXXX.tf as follows.

```
provider "aws" {
    profile = "" // your aws cli profile name
    region = "ap-southeast-2" //do not change
  
}

variable "datadog_api_key" {}

resource "aws_instance" "test01" {    // any name
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
```

3. Open the terminal from Terminal >> new Terminal (Not necessary if already open)

6. Change current directory `% cd Datadog/EC2`

7. Run command `% terraform init` to initialize

8. Take a look `Terraform has been successfully initialized!` is appeared.

9. If you have an error, need to edit tf file then exec `% terraform plan` until without error.

10. Run command `% terraform apply` to create ec2.

11. Enter a value `yes`
```
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

```

12. Make sure your EC2 has been created.

13. connect to your ec2 via SSH then confirm your datadog agent is active.

14. Open the Datadog Application on your browser, and you can see your ec2 in the infrastructure list.

### *Hands-on EC2 is completed. The next is Create Monitor.*
