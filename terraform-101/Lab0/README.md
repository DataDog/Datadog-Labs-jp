# Lab0 - Set up your environment

---
### AWS
---

#### 1. Create Named profile for AWS CLI

Run aws command on your terminal.

Access key and secret key will be posted on Slack!

```
$ aws configure --profile terraform

AWS Access Key ID [None]: <AWS ACCESS KEY>
AWS Secret Access Key [None]: <AWS SECRET KEY>
Default region name [None]: ap-southeast-2
Default output format [None]: json
```
#### 2. Create your key pair

Replace `YOUR-KEY-NAME` with your name, and run aws command on your terminal.

```
$ aws ec2 create-key-pair --key-name YOUR-KEY-NAME --query 'KeyMaterial' --output text > YOUR-KEY-NAME.pem --profile terraform
```

*Please note your key name!!*

Run the following command to set the permissions.

```
$ chmod 600 ~/.ssh/<YOUR-KEY-NAME>.pem
```

---
### Terraform

---

####  1. Clone Repogitory

```
$ git clone git@github.com:DataDog/Datadog-Labs-jp.git
$ cd Datadog-Labs-jp/terraform-101
```

Open VS Code

```
$ code .
```

####  2. Set environment variable
There are several ways to set environment variables in Terraform, we will make a `.tfvars` file.

1. Open `terraform.tfvars`
2. Enter your datadog api key and application key for your sandbox account.

```
datadog_api_key = "API KEY"
datadog_app_key = "APP KEY"
```

---
---
### Good job! Let's Go to [Lab1](./../Lab1-EC2/README.md)