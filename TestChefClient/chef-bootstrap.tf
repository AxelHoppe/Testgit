## Start of variables ###
variable "name" {
	description = "Name of the Virtual Machine"
}

variable "cms_chef_server_url" {
	description = "CMS Chef Server URL"
}


variable "ssh_user" {
	description = "Connect to the vm as user "
}
variable "ssh_user_password" {
	description = "Password to connect to the vm"
}
variable "ipv4_address" {
	description = "IPv4 Address"
}


resource "null_resource" "vm1" {

connection {
  	type = "ssh"
    user        = "${var.ssh_user}"
    password    = "${var.ssh_user_password}" 
    host       =  "${var.ipv4_address}"
    
  }   

provisioner "chef" {

 server_url      = "${var.cms_chef_server_url}"
  user_name       = "chef-admin"
  user_key        = "${file("/home/terraform/chef-admin.pem")}"
  node_name       = "${var.name}.fyre.ibm.com"
  client_options = ["verify_api_cert     false"]
  ssl_verify_mode = ":verify_none"
  run_list = ["recipe[elasticsearch]"]
  skip_install    = "false"
  recreate_client = "true"
  log_to_file = "true"
  
 }
 
}