variable "pca_connectors" {
  description = "Map of PCA connectors keyed by connector name"
  type = map(object({
    certificate_authority_arn = string
    security_group_ids       = list(string)
    enable                   = bool
    tags                     = map(string)
  }))
  default = {}
}

variable "create_directory" {
  description = "Whether to create a new AD Connector directory service. Set to false to use an existing directory."
  type        = bool
  default     = true
}

variable "existing_directory_id" {
  description = "Existing Directory Service ID to use when create_directory is false."
  type        = string
  default     = ""
}

############################
# AD Directory object
############################
variable "directory" {
  description = "Configuration for the AD directory. Required when create_directory is true."
  type = object({
    domain     = string
    password   = string
    size       = string
    dns_ips    = list(string)
    username   = string
    subnet_ids = list(string)
    vpc_id     = string
    tags       = map(string)
  })
  default = null
}
