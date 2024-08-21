/*provider "ibm" {
  ibmcloud_api_key = "${var.ibmcloud_api_key}"
  generation = 2
  region = "us-south"
}*/

  

terraform {
  required_version = "< 1.7"
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.43.0"
    }
  }
}

provider "ibm" {
  # Configuration option
  visiblity="private"
}

