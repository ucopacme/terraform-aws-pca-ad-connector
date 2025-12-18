output "directory_id" {
  value       = aws_directory_service_directory.this.id
  description = "Directory Service ID"
}

output "directory_name" {
  value = aws_directory_service_directory.this.name
}



# output "pca_connector_id" {
#   description = "PCA Connector for AD ID"
#   value       = try(awscc_pcaconnectorad_connector.this[0].id, null)
# }

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
