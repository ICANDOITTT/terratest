# 10.0.0.0/16 vpc 전용 Internet Gateway
resource "aws_internet_gateway" "jisoo_ig" {
  vpc_id = aws_vpc.jisoo_vpc.id

  tags = {
    "Name" = "jisoo_ig"
  }
}