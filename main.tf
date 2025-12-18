############################
# AD Connector
############################
resource "aws_directory_service_directory" "this" {
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
# This resource MUST exist before the connector can be created
# Only one registration for the directory
resource "awscc_pcaconnectorad_directory_registration" "this" {
  directory_id = aws_directory_service_directory.this.id
}


############################
# PCA Connector for AD
############################
resource "awscc_pcaconnectorad_connector" "this" {
  for_each = { for idx, conn in var.pca_connectors : idx => conn if conn.enable }

  certificate_authority_arn = each.value.certificate_authority_arn
  directory_id              = aws_directory_service_directory.this.id

  vpc_information = {
    security_group_ids = each.value.security_group_ids
  }

  # Correct depends_on for for_each
  depends_on = [awscc_pcaconnectorad_directory_registration.this]

  tags = each.value.tags
}

