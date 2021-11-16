resource "aws_launch_configuration" "jisoo_aslg" {
    name_prefix = "jisoo-web-"
    image_id = aws_ami_from_instance.jisoo_ami.id
    instance_type = "t2.micro"
    iam_instance_profile = "admin_role"
    security_groups = [aws_security_group.jisoo_sg.id]
    key_name = "jisoo2-key"
#    user_data = file("./install.sh")

    lifecycle {
        create_before_destroy = true
    }
}