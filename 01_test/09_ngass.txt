resource "aws_route_table_association" "jisoo_ngass_a" {
    subnet_id = aws_subnet.jisoo_pria.id
    route_table_id = aws_route_table.jisoo_ngrt.id
}

resource "aws_route_table_association" "jisoo_ngass_c" {
    subnet_id = aws_subnet.jisoo_pric.id
    route_table_id = aws_route_table.jisoo_ngrt.id
}