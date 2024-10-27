resource "aws_instance" "inst" {
  ami=data.aws_ami.ami.id
  instance_type=var.instance_type
  subnet_id = "subnet-01fc753649b9dec43"
  vpc_security_group_ids=[aws_security_group.sg.id]
  associate_public_ip_address = true
  tags={
    Name="${var.component_name}-${var.environment}"
  }
}




resource "aws_security_group" "sg" {
  name        = "${var.component_name}-${var.environment}-sg"
  description = "Inbound allow for ${var.component_name}"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
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
    cidr_blocks      = ["0.0.0.0/0"]
  }
}