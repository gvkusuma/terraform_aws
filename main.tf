resource "aws_instance" "my_ec2"{
ami = ami-02371361af091464a
instance_type = "t2.micro"
}