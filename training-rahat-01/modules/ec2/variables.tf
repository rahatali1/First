# variable "most_recent" {

#     type = bool
#     default = true
  
# }

variable "instance_type" {

    type = string  
}

# variable "key_name" {
#     type = string
# }
variable "subnet_id" {
    type = string
  
}
variable "volume_size_root" {

    type= string
}
variable "volume_size_ebs" {

type= string 
}