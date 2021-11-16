resource "aws_lb" "jisoo_alb" {
    name = "${var.name}-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.jisoo_sg.id]
    subnets = [aws_subnet.jisoo_pub[0].id,aws_subnet.jisoo_pub[1].id] # loadbalancer가 사용할 public zone

    tags = {
        "Name" = "${var.name}-alb"
    }

}

resource "aws_lb_target_group" "jisoo_albtg" {
    name = "${var.name}-albtg"
    port = var.port_http
    protocol = var.proto_HTTP
    vpc_id = aws_vpc.jisoo_vpc.id

    health_check {
        enabled = true
        healthy_threshold = 3
        interval = 5
        matcher = "200"
        path = "/health.html"
        port = "traffic-port"
        protocol = var.proto_HTTP
        timeout = 2
        unhealthy_threshold = 2
    }
}

resource "aws_lb_listener" "jisoo_albli" {
    load_balancer_arn = aws_lb.jisoo_alb.arn
    port = "80"
    protocol = var.proto_HTTP

    default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.jisoo_albtg.arn
    }
}

resource "aws_lb_target_group_attachment" "jisoo_tgatt" {
    target_group_arn = aws_lb_target_group.jisoo_albtg.arn
    target_id = aws_instance.jisoo_weba.id
    port = var.port_http
}