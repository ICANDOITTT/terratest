resource "aws_eip" "jisoo_eip_ng" {
    vpc = true
}

resource "aws_nat_gateway" "jisoo_ng" {
    allocation_id = aws_eip.jisoo_eip_ng.id
    subnet_id = aws_subnet.jisoo_puba.id
    tags = {
        "Name" = "jisoo-ng"
    }
    depends_on = [
        aws_internet_gateway.jisoo_ig
    ]
}