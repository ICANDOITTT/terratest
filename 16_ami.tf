resource "aws_ami_from_instance" "jisoo_ami" {
    name = "jisoo-aws_ami"
    source_instance_id = aws_instance.jisoo_weba.id

    depends_on = [
        aws_instance.jisoo_weba
    ]
}