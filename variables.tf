variable "access_key" {
    default=""
}

variable "secret_key" {
    default=""
}

variable "region" {
  description = "AWS region to host your network"
  default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default = "10.128.0.0/16"
}

variable "public_1a_subnet_cidr" {
  description = "CIDR for public subnet"
  default = "10.128.0.0/24"
}

variable "public_1b_subnet_cidr" {
  description = "CIDR for public subnet"
  default = "10.128.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  default = "10.128.2.0/24"
}

variable "ami_id" {
  description = "ami id for wordpress instances"
  default = "ami-8cdfaa9b"
}
