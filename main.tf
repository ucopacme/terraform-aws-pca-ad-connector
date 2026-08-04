locals {
  directory_id = var.create_directory ? aws_directory_service_directory.this[0].id : var.existing_directory_id
}

############################
# AD Connector
############################
resource "aws_directory_service_directory" "this" {
  count = var.create_directory ? 1 : 0

  name     = var.directory.domain
  password = var.directory.password
  size     = var.directory.size
  type     = "ADConnector"

  connect_settings {
    customer_dns_ips  = var.directory.dns_ips
    customer_username = var.directory.username
    subnet_ids        = var.directory.subnet_ids
    vpc_id            = var.directory.vpc_id
  }

  tags = var.directory.tags
}


############################
# Directory Registration
############################
resource "awscc_pcaconnectorad_directory_registration" "this" {
  count = var.create_directory ? 1 : 0

  directory_id = local.directory_id
}


############################
# PCA Connector for AD
############################
resource "awscc_pcaconnectorad_connector" "this" {
  for_each = { for idx, conn in var.pca_connectors : idx => conn if conn.enable }

  certificate_authority_arn = each.value.certificate_authority_arn
  directory_id             = local.directory_id

  vpc_information = {
    security_group_ids = each.value.security_group_ids
  }

  depends_on = [awscc_pcaconnectorad_directory_registration.this]

  tags = each.value.tags
}
