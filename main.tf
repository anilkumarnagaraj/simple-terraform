data "ibm_resource_group" "group" {
  name = "${var.resource_group_name}"
}

resource "ibm_is_vpc" "vpc" {
  name           = "${var.vpc_name}"
  resource_group = "${data.ibm_resource_group.group.id}"
  //default_security_group_name = "unseated-spoilage-surpass-prompt"
  tags = ["tag1","tag2"]
}

resource "ibm_resource_group" "grp" {
  name           = "mygrp1"
}

locals {
email_stss = ["tanya.shanker@ibm.com"]
}

# STSS
resource "ibm_iam_user_invite" "stss" {
  users         = local.email_stss
  access_groups = [ibm_iam_access_group.stss.id]
  lifecycle {ignore_changes = [invited_users]}
}

resource "ibm_iam_access_group" "stss" {
  name                               = "RN-STSS-1"
  description                        = "STSS"
}

data "ibm_iam_access_group" "accgroup" {
  access_group_name = "RN-STSS"
}

/*resource "null_resource" "test" {
   provisioner "local-exec" {
    command = "echo hello"
     }
  
  }*/
