# Cloud Terraforming Template

Spin up a readily configured Docker server in the Hetzner cloud. This repository is meant to be adapted 
to meet own requirements.

## Requirements

* Terraform installed
* an SSH key pair with an unencrypted private key (e.g., create one using `ssh-keygen`)
* a Hetzner Cloud account with a project and a corresponding API key with `read and write` permissions

## Getting Started

```shell
cd src
cp terraform.tfvars.tmpl terraform.tfvars
# set the config parameters in the terraform.tfvars file - do NOT commit your API token
terraform init
terraform plan
terraform apply
# enter 'yes'
```

## Getting Stopped

Don't forget to shut down all the spawned instances, otherwise it can become quite expensive over time.

```shell
cd src
terraform destroy
```
