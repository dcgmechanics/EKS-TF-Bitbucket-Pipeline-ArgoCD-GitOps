variable "env" {
  type        = string
  default     = "dev"
  description = "Dev Env"
}

variable "k8s-ver" {
  default     = "1.27"
  description = "K8s Version"
}

variable "region" {
  type        = string
  default     = "ap-southeast-1"
  description = "Dev Region"
}