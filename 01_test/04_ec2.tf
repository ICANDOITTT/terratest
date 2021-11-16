resource "aws_security_group" "jisoo_sg" {
    name = "Allow Basic"
    description = "Allow HTTP,SSH,SQL,ICMP"
    vpc_id = aws_vpc.jisoo_vpc.id

    ingress = [
        {
            description      = "Allow HTTP"
            from_port       = var.port_http
            to_port         = var.port_http
            protocol        = var.proto_tcp
            cidr_blocks     = [var.cidr_route]
            ipv6_cidr_blocks = [var.cidr_ipv6]
            prefix_list_ids = null
            security_groups = null
            self            = null
        },
        {
            description      = "Allow SSH"
            from_port       = var.port_ssh
            to_port         = var.port_ssh
            protocol        = var.proto_tcp
            cidr_blocks     = [var.cidr_route]
            ipv6_cidr_blocks = [var.cidr_ipv6]
            prefix_list_ids = null
            security_groups = null
            self            = null
        },
        {
            description      = "Allow SQL"
            from_port       = var.port_mysql
            to_port         = var.port_mysql
            protocol        = var.proto_tcp
            cidr_blocks     = [var.cidr_route]
            ipv6_cidr_blocks = [var.cidr_ipv6]
            prefix_list_ids = null
            security_groups = null
            self            = null
        },
        {
            description      = "Allow ICMP"
            from_port       = 0
            to_port         = 0
            protocol        = "icmp"
            cidr_blocks     = [var.cidr_route]
            ipv6_cidr_blocks = [var.cidr_ipv6]
            prefix_list_ids = null
            security_groups = null
            self            = null
        }
    ]
    egress  =   [
        {
            description      = "ALL"
            from_port       = 0
            to_port         = 0
            protocol        = -1
            cidr_blocks     = [var.cidr_route]
            ipv6_cidr_blocks = [var.cidr_ipv6]
            prefix_list_ids = null
            security_groups = null
            self            = null
        }
    ]
    tags = {
        "Name" = "${var.name}-sg"
    }
}

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
    key_name = var.key
    availability_zone = "${var.region}a"
    private_ip = "10.0.0.11"
    subnet_id = aws_subnet.jisoo_pub[0].id    #public_subnet a의 ID
    vpc_security_group_ids = [aws_security_group.jisoo_sg.id] 
    user_data = file("../01_test/install.sh")
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