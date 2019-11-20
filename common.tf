variable "region"{
  default = "ap-southeast-3"
}

variable "access_key"{
}

variable "secret_key"{
}

variable "domain_name"{
}

# Configure the HuaweiCloud Provider
provider "huaweicloud" {
  access_key = var.access_key
  secret_key = var.secret_key 
  domain_name = var.domain_name
  tenant_name =  var.region
  region      =  var.region
  auth_url    = "https://iam.myhwclouds.com:443/v3"
}

variable "vpc_name" {
  default = "bss_vpc"
}

variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "subnet_name"{
  default = "bss_subnet"
}

variable "ami_id" {
  default = "cbe0df31-1150-488a-a9b2-612c745e1be0"
}
