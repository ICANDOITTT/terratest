resource "aws_eip" "jisoo_eip_ng" {
    vpc = true
}

resource "aws_nat_gateway" "jisoo_ng" {
    allocation_id = aws_eip.jisoo_eip_ng.id
    subnet_id = aws_subnet.jisoo_pub[0].id
    tags = {
        "Name" = "${var.name}-ng"
    }
    depends_on = [
        aws_internet_gateway.jisoo_ig
    ]
}

resource "aws_route_table" "jisoo_ngrt" {
    vpc_id =aws_vpc.jisoo_vpc.id
    
    route {
        cidr_block = var.cidr_route
        gateway_id = aws_nat_gateway.jisoo_ng.id
    }

    tags = {
        "Name" = "${var.name}-ngrt"
    }
}

resource "aws_route_table_association" "jisoo_ngass" {
    count = length(var.cidr_private) #2
    subnet_id = aws_subnet.jisoo_pri[count.index].id
    route_table_id = aws_route_table.jisoo_ngrt.id
}

