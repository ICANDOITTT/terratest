resource "aws_route_table" "jisoo_rf" {
  vpc_id = aws_vpc.jisoo_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.jisoo_ig.id
  }
  tags = {
    "Name" = "jisoo-rt"
  }
}