variable "rds-password" {
    description = "rds password"
    type = string
    default = "Pavan5763"
  
}
variable "rds-username" {
    description = "rds username"
    type = string
    default = "admin"
  
}
variable "ami" {
    description = "ami"
    type = string
    default = "ami-05b10e08d247fb927"
  
}
variable "instance-type" {
    description = "instance-type"
    type = string
    default = "t2.micro"
  
}
variable "key-name" {
    description = "keyname"
    type = string
    default = "Project-key"
  
}
variable "backupr-retention" {
    type = number
    default = "7"
  
}