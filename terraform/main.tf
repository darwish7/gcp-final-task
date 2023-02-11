provider "google" {
  project     = "zoz-project-375711"
  region      = "asia-east1"  
}

module "network_module" {
  source = "./vpc"
  vpc_name = "gcp-vpc"
  management-subnet_name = "management-subnet"
  restricted-subnet_name = "restricted-subnet"
}

module "vm"{
    source = "./vm"
    vm_name = "private-management-vm"
    machine_type = "f1-micro"
    zone = "asia-east1-a"
    image = "ubuntu-os-cloud/ubuntu-2204-lts"
    subnet_id = module.network_module.management_id
   
    #nat_ip = module.network_module.nat_address
}


module "gke-cluster" {
  source = "./gke-cluster"
  network_vpc_name= module.network_module.vpc_name
  sub_network_name= module.network_module.restricted_name
}