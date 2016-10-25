# Sample Wordpress deployment with AWS and Terraform

This script builds out aws infrastructure to deploy a wordpress site.

## Usage

* Create the wordpress keypair.

```ssh-keygen -t rsa -C "wordpress" -P '' -f ~/.ssh/wordpress```

* Obtain a key set for your AWS account. Create a terraform.tfvars file in your
wordpress directory.

```
access_key = "<your_access_key>"
secret_key = "<your_secret_key>"
```

* Install [terraform](https://www.terraform.io/downloads.html) and add it to your path.

* Install the files on your computer in any directory and run the demo.

```
git clone https://github.com/robertdeheer/wordpress
cd wordpress
terraform apply
```

## Credits

This demo is based on [Greg Osuri's Terraform demo](https://www.airpair.com/aws/posts/ntiered-aws-docker-terraform-guide).
