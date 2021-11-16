resource "aws_security_group" "jisoo_sg" {
    name = "Allow Basic"
    description = "Allow HTTP,SSH,SQL,ICMP"
    vpc_id = aws_vpc.jisoo_vpc.id

    ingress = [
        {
            description      = "Allow HTTP"
            from_port       = 80
            to_port         = 80
            protocol        = "tcp"
            cidr_blocks     = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
            prefix_list_ids = null
            security_groups = null
            self            = null
        },
        {
            description      = "Allow SSH"
            from_port       = 22
            to_port         = 22
            protocol        = "tcp"
            cidr_blocks     = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
            prefix_list_ids = null
            security_groups = null
            self            = null
        },
        {
            description      = "Allow SQL"
            from_port       = 3306
            to_port         = 3306
            protocol        = "tcp"
            cidr_blocks     = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
            prefix_list_ids = null
            security_groups = null
            self            = null
        },
        {
            description      = "Allow ICMP"
            from_port       = 0
            to_port         = 0
            protocol        = "icmp"
            cidr_blocks     = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
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
            cidr_blocks     = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
            prefix_list_ids = null
            security_groups = null
            self            = null
        }
    ]
    tags = {
        "Name" = "jisoo-sg"
    }
}