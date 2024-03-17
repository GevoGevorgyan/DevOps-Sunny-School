variable "user_data_file" {
  default = "user_data.sh"
}

variable "vpc_id" {
  type = string
  default = "vpc-0b39de2109d507d42"
}

variable "vpc_cidr" {
  type = string
  default = "172.31.0.0/16"
}
