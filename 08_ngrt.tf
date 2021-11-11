resource "aws_route_table" "jisoo_ngrt" {
    vpc_id =aws_vpc.jisoo_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.jisoo_ng.id
    }

    tags = {
        "Name" = "jisoo-ngrt"
    }
}