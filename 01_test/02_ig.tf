# 10.0.0.0/16 vpc 전용 Internet Gateway
resource "aws_internet_gateway" "jisoo_ig" {
  vpc_id = aws_vpc.jisoo_vpc.id

  tags = {
    "Name" = "${var.name}_ig"
  }
}

resource "aws_route_table" "jisoo_rf" {
  vpc_id = aws_vpc.jisoo_vpc.id

  route {
      cidr_block = var.cidr_route
      gateway_id = aws_internet_gateway.jisoo_ig.id
  }
  tags = {
    "Name" = "${var.name}-rt"
  }
}

resource "aws_route_table_association" "jisoo_rtass" { 
    count = length(var.cidr_public)
    subnet_id = aws_subnet.jisoo_pub[count.index].id
    route_table_id = aws_route_table.jisoo_rf.id
}