resource "aws_security_group" "sg" {
  name        = "${var.component_name}-${var.environment}-sg"
  description = "Inbound allow for ${var.component_name}"
  vpc_id = var.vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    # cidr_blocks      = ["0.0.0.0/0"]
    cidr_blocks      = var.bastion_nodes
  }


  ingress {
    from_port        = var.app_port
    to_port          = var.app_port
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    # cidr_blocks      = ["0.0.0.0/0"]
    cidr_blocks      = var.allow_cidr
  }
}

resource "aws_instance" "inst" {
  ami=data.aws_ami.ami.id
  instance_type=var.instance_type
  # subnet_id = "subnet-03ad7ee1155f25700"
  subnet_id   = var.subnet_id
  vpc_security_group_ids=[aws_security_group.sg.id]
  # associate_public_ip_address = true
  tags={
    Name="${var.component_name}-${var.environment}"
  }
  root_block_device {  # This is give the volume size of the machine like 20GB/40GB
    volume_size = var.volume_size
  }
  lifecycle {
    ignore_changes = [
      ami,
    ]
  }
  # The lifecycle block with ignore_changes is used to tell Terraform to ignore specific changes to resource attributes, such as the ami in your case. This is helpful when you want to prevent Terraform from recreating a resource unnecessarily, even if some of its attributes change.
}

# Above we created an ec2 instance and a security group for them, now to to deploy project in that newly created ec2 instance.
# We learnt that Ansible do all the software installations and deploy the code
# So how to bring the Ansible into Terraform is shown below

# we use the below command to install softwares and deploy dev code.
# ansible-playbook -i $(app_name)-$(env).waferhassan.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 -e env=$(env) -e app_name=$(app_name) roboshop.yml
# so "anisible-playbook"" command will 'push' the code/install software to the $(app_name)-$(env).waferhassan.online instance
# To use anisble push, i need to use Local-exec provisioner , by doing so we dont know when the new instance will be up
# So its better to go with ansible-pull, by doing so we can use remote-exec and connect to the new instance created and then pull the code from github and run the ansible commands

resource "null_resource" "ansible-pull" {

  triggers = {
    instance_id= aws_instance.inst.id
  }
  # this triggers block is used to recreate/update the resource whenever
  #       new instance id is created

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      # user     = "ec2-user"
      # password = "DevOps321"
      user     = data.vault_generic_secret.ssh.data["username"]
      password = data.vault_generic_secret.ssh.data["password"]
      host     = aws_instance.inst.private_ip
    }

    inline = [
      # "sudo labauto ansible", # this is Raghu's code to install ansible
      # commenting out labauto ansible becoz im using my own image which has ansible already installed
      "ansible-pull -i localhost, -U https://github.com/hasifasi/roboshop-ansible roboshop.yml -e env=${var.environment} -e app_name=${var.component_name} -e vault_token=${var.vault_token}"
    ]
  }
}

resource "aws_route53_record" "record" {
  zone_id = var.zone_id
  name    = "${var.component_name}-${var.environment}.${var.domain_name}"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.inst.private_ip]
}

