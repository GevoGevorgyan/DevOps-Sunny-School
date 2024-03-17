data "aws_ssm_parameter" "my_amzn_linux_ami" {  
   name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

data "template_file" "user_data" {
  template = file(var.user_data_file)
}

resource "aws_security_group" "gg_sg" {
  name        = "gg-sg"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.gg_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.gg_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


resource "aws_launch_template" "gglaunchtemplate" {
  image_id      = data.aws_ssm_parameter.my_amzn_linux_ami.insecure_value
  instance_type = "t2.micro"
  security_group_names = [
      aws_security_group.gg_sg.name
      
    ]

  user_data = "${base64encode(data.template_file.user_data.rendered)}"
}

resource "aws_instance" "web" {
  count = 3
  instance_type   = "t2.micro"
   tags = {
    "Name" = "MyInstance-${format("%04d", count.index + 1)}"
  }
  launch_template {
    id      = aws_launch_template.gglaunchtemplate.id
  }
}