# Try IaC: Terraform

This code is in reference to Chapter 2: Terraform from  Try IaC Vol 2.

To try out this code, use the directions below

## Using this Repo
This Repo was designed to be used in conjection with the Try IaC Vol 2 book. To learn about how all the code in this repo works, Chapter 2 covers everything in detail.

Be advised that if you run this repo, charges to your account may accure. 

### Clone Project
```
mkdir -p ~/dev
cd ~/dev
git clone https://github.com/jmitchel3/try-iac-terraform
cd try-iac-terraform
```

### Create Terraform External Variables

Create the file `terraform.tfvars` in the root of your `try-iac-terraform` folder with the following:

```
linode_api_token="<your-api-token>"
web_servers_count=1
```

Replace `<your-api-token>` with an Linode [API Token](https://cloud.linode.com/profile/tokens) with access to your account (read the book for exact permissions). 

The `terraform.tfvars` file is automatically in `.gitignore` so be sure to _never_ commit this file.


### Create storage backend (Optional)


Ceate the file `config.object_storage.tfbackend` in the root of your `try-iac-terraform` folder with the following:
```
skip_credentials_validation = true
skip_region_validation = true
skip_requesting_account_id = true
skip_metadata_api_check = true
skip_s3_checksum = true
bucket="<your-bucket>"
key="try-iac-terraform.tfstate"
region="<your-bucket-region>"
endpoints = {
    s3="https://<your-bucket-region>.linodeobjects.com"
}
access_key="<your-object-storage-access-key>"
secret_key="<your-object-storage-secret-key>"
```

On [linode.com](https://linode.com/cfe), open up Object Storage, create a bucket, and secret keys then replace the following:
- `<your-bucket>`
- `<your-bucket-region>`
- `<your-object-storage-access-key>`
- `<your-object-storage-secret-key>`

The `config.object_storage.tfbackend` file is automatically in `.gitignore` so be sure to _never_ commit this file.


### Initialize Project

```
terraform init -backend-config=config.object_storage.tfbackend
```

### Review the Project's Plan

```
terraform Plan
```


### Apply the Project

```
terraform apply
```

### Delete the Project

```
terraform destroy
```