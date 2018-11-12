#####################################################################
##
##      Created 12.11.18 by admin. for VMTest1-project
##
#####################################################################

## REFERENCE {"vsphere_network":{"type": "vsphere_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "vsphere" {
  user           = "${var.user}"
  password       = "${var.password}"
  vsphere_server = "${var.vsphere_server}"

  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  version = "~> 1.2"
}


data "vsphere_virtual_machine" "VMwareTestBox1_template" {
  name          = "${var.VMwareTestBox1_template_name}"
  datacenter_id = "${data.vsphere_datacenter.VMwareTestBox1_datacenter.id}"
}

data "vsphere_datacenter" "VMwareTestBox1_datacenter" {
  name = "${var.VMwareTestBox1_datacenter_name}"
}

data "vsphere_datastore" "VMwareTestBox1_datastore" {
  name          = "${var.VMwareTestBox1_datastore_name}"
  datacenter_id = "${data.vsphere_datacenter.VMwareTestBox1_datacenter.id}"
}

data "vsphere_network" "network1" {
  name          = "${var.network1_network_name}"
  datacenter_id = "${data.vsphere_datacenter.VMwareTestBox1_datacenter.id}"
}

resource "vsphere_virtual_machine" "VMwareTestBox1" {
  name          = "${var.VMwareTestBox1_name}"
  datastore_id  = "${data.vsphere_datastore.VMwareTestBox1_datastore.id}"
  num_cpus      = "${var.VMwareTestBox1_number_of_vcpu}"
  memory        = "${var.VMwareTestBox1_memory}"
  guest_id = "${data.vsphere_virtual_machine.VMwareTestBox1_template.guest_id}"
  resource_pool_id = "${var.VMwareTestBox1_resource_pool}"
  network_interface {
    network_id = "${data.vsphere_network.network1.id}"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.VMwareTestBox1_template.id}"
  }
  disk {
    name = "${var.VMwareTestBox1_disk_name}"
    size = "${var.VMwareTestBox1_disk_size}"
  }
}