
resource "aws_security_group" "default" {
  vpc_id = aws_vpc.startup_vpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "webserver_sg" {
  vpc_id = aws_vpc.startup_vpc.id

  ingress {
    protocol  = "tcp"
    self      = true
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "lbsg" {
  name        = "lbsg-${terraform.workspace}"
  description = "controls access to the LB"
  vpc_id      = aws_vpc.startup_vpc.id
  tags = merge(
    {
      "Name" : "lbsg-${terraform.workspace}"
    }, 
  )
}


resource "aws_security_group_rule" "web_to_lb" {
  security_group_id = aws_security_group.lbsg.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "web_to_lb_secure" {
  security_group_id = aws_security_group.lbsg.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "lb_egress" {
  security_group_id = aws_security_group.lbsg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}