# data "aws_ami" "ami" {
#   most_recent = true
#   name_regex  = "RHEL-9-DevOps-Practice"
#   owners = ["973714476881"]
#
# }

# The Above code is commented becoz im not gonna use any in-built ami (RHEL-9-DevOps-Practice) for my project,
# Instead i created my own ami, refer packer-ami and that image is called "golden_image_ami"


data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "golden_image_ami"
  owners = ["self"]

}

data "vault_generic_secret" "ssh" {
  path = "infra-secrets/ssh"
}