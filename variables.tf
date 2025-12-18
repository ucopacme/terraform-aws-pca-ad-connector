
variable "pca_connectors" {
  description = "Map of PCA connectors keyed by connector name"
  type = map(object({
    certificate_authority_arn = string
    security_group_ids        = list(string)
    enable                    = bool
    tags                      = map(string)
  }))
  default = {}
}


############################
# AD Directory object
############################
variable "directory" {
  description = "Configuration for the AD directory"
  type = object({
    domain       = string
    password   = string
    size       = string
    dns_ips    = list(string)
    username   = string
    subnet_ids = list(string)
    vpc_id     = string
    tags       = map(string)
  })
}

