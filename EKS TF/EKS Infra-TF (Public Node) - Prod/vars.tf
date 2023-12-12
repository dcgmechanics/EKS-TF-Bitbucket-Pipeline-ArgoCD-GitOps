variable "env" {
  type        = string
  default     = "prod"
  description = "Production Environment"
}

variable "k8s-ver" {
  default     = "1.28"
  description = "K8s Version"
}

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "Prod Region Ohio"
}