#####################################################################
##
##      Created 12.11.18 by admin. for VMTest1-project
##
#####################################################################

variable "user" {
  type = "string"
  description = "Generated"
}

variable "password" {
  type = "string"
  description = "Generated"
}

variable "vsphere_server" {
  type = "string"
  description = "Generated"
}

variable "allow_unverified_ssl" {
  type = "string"
  description = "Generated"
}

variable "VMwareTestBox1_name" {
  type = "string"
  description = "Virtual machine name for VMwareTestBox1"
}

variable "VMwareTestBox1_number_of_vcpu" {
  type = "string"
  description = "Number of virtual cpu's."
}

variable "VMwareTestBox1_memory" {
  type = "string"
  description = "Memory allocation."
}

variable "VMwareTestBox1_disk_name" {
  type = "string"
  description = "The name of the disk. Forces a new disk if changed. This should only be a longer path if attaching an external disk."
}

variable "VMwareTestBox1_disk_size" {
  type = "string"
  description = "The size of the disk, in GiB."
}

variable "VMwareTestBox1_template_name" {
  type = "string"
  description = "Generated"
}

variable "VMwareTestBox1_datacenter_name" {
  type = "string"
  description = "Generated"
}

variable "VMwareTestBox1_datastore_name" {
  type = "string"
  description = "Generated"
}

variable "VMwareTestBox1_resource_pool" {
  type = "string"
  description = "Resource pool."
}

variable "network1_network_name" {
  type = "string"
  description = "Generated"
}

