resource "aws_security_group" "bastion-host" {
  name        = "bastion-host-SG"
  description = "Allow inbound SSH access"
  vpc_id      = aws_vpc.three-tier.id

  ingress {
    description = "Allow SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-host-SG"
  }
}

resource "aws_security_group" "alb-frontend-sg" {
  name        = "alb-frontend-sg"
  description = "Allow inbound traffic to ALB"
  vpc_id      = aws_vpc.three-tier.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-frontend-sg"
  }
}

resource "aws_security_group" "frontend-server-sg" {
  name        = "frontend-server-sg"
  description = "Allow inbound traffic to frontend servers"
  vpc_id      = aws_vpc.three-tier.id

  ingress {
    description = "Allow HTTP from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb-frontend-sg.id]
  }
  ingress {
    description = "Allow SSH from bastion host"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion-host.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "frontend-server-sg"
  }
}

resource "aws_security_group" "alb-backend-sg" {
  name        = "alb-backend-sg"
  description = "Allow inbound traffic to backend ALB"
  vpc_id      = aws_vpc.three-tier.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-backend-sg"
  }
}

resource "aws_security_group" "backend-server-sg" {
  name        = "backend-server-sg"
  description = "Allow inbound traffic to backend servers"
  vpc_id      = aws_vpc.three-tier.id

  ingress {
    description = "Allow HTTP from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb-backend-sg.id]
  }
  ingress {
    description = "Allow SSH from bastion host"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion-host.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "backend-server-sg"
  }
}

resource "aws_security_group" "book-rds-sg" {
  name        = "book-rds-sg"
  description = "Allow inbound MySQL/Aurora traffic"
  vpc_id      = aws_vpc.three-tier.id

  ingress {
    description = "Allow MySQL/Aurora from backend servers"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.backend-server-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "book-rds-sg"
  }
}
