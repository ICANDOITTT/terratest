/*
data "aws_ami" "amzn" {
    most_recent =

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }

    filter {
        name = "virtualization-type"
        value = ["hvm"]
    }

    owners = ["amazon"]
}
*/

resource "aws_instance" "jisoo_weba" {
    ami = "ami-04e8dfc09b22389ad"   #data.aws_ami.amzn.id
    instance_type = "t2.micro"
    key_name = "jisoo2-key"
    availability_zone = "ap-northeast-2a"
    private_ip = "10.0.0.11"
    subnet_id = aws_subnet.jisoo_puba.id    #public_subnet a의 ID
    vpc_security_group_ids = [aws_security_group.jisoo_sg.id] 
    user_data = file("./install.sh")
}

resource "aws_eip" "jisoo_weba_ip" {
    vpc = true
    instance = aws_instance.jisoo_weba.id
    associate_with_private_ip ="10.0.0.11"
    depends_on = [
        aws_internet_gateway.jisoo_ig
    ]

}

output "public_ip" {
    value = aws_instance.jisoo_weba.public_ip
}