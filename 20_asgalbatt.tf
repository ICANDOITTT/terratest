resource "aws_autoscaling_attachment" "jisoo_asgalatt" {
    autoscaling_group_name = aws_autoscaling_group.jisoo_asg.id
    alb_target_group_arn = aws_lb_target_group.jisoo_albtg.arn
}