# ## 初期設定

---
### AWS
---

#### 1. Create Named profile for AWS CLI

run aws cli command on your terminal.

```
nobuyuki.kawazu@COMP-C02G43ELML87 ~ % aws configure --profile terraform
AWS Access Key ID [None]: your access key
AWS Secret Access Key [None]: your secret key
Default region name [None]: ap-southeast-1
Default output format [None]: json
```
#### 2. Create your key pair

run aws cli command on your terminal.

Note: Please make sure ```--profile terraform``` option.

```aws ec2 create-key-pair --key-name your-key-name --query 'KeyMaterial' --output text > your0-key-name.pem```

*Please note your key name!!*

---
### Terraform

---

####  1. Clone Repogitory

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
