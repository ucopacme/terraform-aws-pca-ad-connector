output "directory_id" {
  value       = local.directory_id
  description = "Directory Service ID"
}

output "directory_name" {
  value       = var.create_directory ? aws_directory_service_directory.this[0].name : ""
  description = "Domain Name"
}

output "pca_connector_ids" {
  description = "Map of PCA Connector for AD IDs"
  value = {
    for k, v in awscc_pcaconnectorad_connector.this :
    k => v.id
  }
}

output "pca_certificate_authorities" {
  description = "Certificate Authorities attached to PCA connectors"
  value = {
    for k, v in awscc_pcaconnectorad_connector.this :
    k => v.certificate_authority_arn
  }
}
