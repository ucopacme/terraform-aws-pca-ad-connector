## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_awscc"></a> [awscc](#provider\_awscc) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_directory_service_directory.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/directory_service_directory) | resource |
| [awscc_pcaconnectorad_connector.this](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/pcaconnectorad_connector) | resource |
| [awscc_pcaconnectorad_directory_registration.this](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/pcaconnectorad_directory_registration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_directory"></a> [directory](#input\_directory) | Configuration for the AD directory | <pre>object({<br/>    domain       = string<br/>    password   = string<br/>    size       = string<br/>    dns_ips    = list(string)<br/>    username   = string<br/>    subnet_ids = list(string)<br/>    vpc_id     = string<br/>    tags       = map(string)<br/>  })</pre> | n/a | yes |
| <a name="input_pca_connectors"></a> [pca\_connectors](#input\_pca\_connectors) | Map of PCA connectors keyed by connector name | <pre>map(object({<br/>    certificate_authority_arn = string<br/>    security_group_ids        = list(string)<br/>    enable                    = bool<br/>    tags                      = map(string)<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_directory_id"></a> [directory\_id](#output\_directory\_id) | Directory Service ID |
| <a name="output_directory_name"></a> [directory\_name](#output\_directory\_name) | n/a |
| <a name="output_pca_certificate_authorities"></a> [pca\_certificate\_authorities](#output\_pca\_certificate\_authorities) | Certificate Authorities attached to PCA connectors |
| <a name="output_pca_connector_ids"></a> [pca\_connector\_ids](#output\_pca\_connector\_ids) | Map of PCA Connector for AD IDs |
