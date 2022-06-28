# Lab0 - Set up your environment

---
### AWS
---

#### 1. Create Named profile for AWS CLI

Run aws command on your terminal.

```
$ aws configure --profile terraform

AWS Access Key ID [None]: <ACCESS KEYy>
AWS Secret Access Key [None]: <SECRET KEY>
Default region name [None]: ap-southeast-2
Default output format [None]: json
```
#### 2. Create your key pair

Run aws command on your terminal.

**Note**: Please make sure ```--profile terraform``` option.

```
$ aws ec2 create-key-pair --key-name your-key-name --query 'KeyMaterial' --output text > your-key-name.pem
```

*Please note your key name!!*

---
### Terraform

---

####  1. Clone Repogitory

```
$ git clone git@github.com:DataDog/Datadog-Labs-jp.git
```

The directory structure can be freely determined, but in this case we will assume the following

```
TERRAFORM
|--Datadog
   |--ec2
   |--Monitor
   |--Dashboard
   |--Synthetic
```

####  2. Environment Variable
There are some ways to configure environment variables, but in this case we will make a file.

- make ```terraform.tfvars``` under Datadog directory.
- Edit terraform.tfvars as follows.

```
datadog_api_key = "your own api key"
datadog_app_key = "your own app key"

```
