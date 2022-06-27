# ## 初期設定

---
### AWS
---

#### 1. Create your key pair

run aws cli command on your terminal.

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
