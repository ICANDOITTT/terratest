resource "aws_placement_group" "jisoo_place" {
    name = "jisoo-place"
    strategy = "cluster"

}