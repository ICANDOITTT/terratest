resource "aws_lb_listener" "jisoo_albli" {
    load_balancer_arn = aws_lb.jisoo_alb.arn
    port = "80"
    protocol = "HTTP"

    default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.jisoo_albtg.arn
    }
}