# Set the variable value in *terraform.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {
  sensitive = true
  type = string
}

variable "ssh_public_key_file" {
  default = "id_rsa.pub"
  type = string
}

variable "ssh_private_key_file" {
  default = "id_rsa"
  type = string
}
