resource "aws_instance" "front" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    # subnet_id = aws_subnet.pub1.id
    # vpc_security_group_ids = [aws_security_group.frontend-server-sg.id]
    user_data = templatefile("./frontend.sh", {})
    tags = {
        Name = "frontend-pub-server"
    }
  
}