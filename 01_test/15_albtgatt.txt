resource "aws_lb_target_group_attachment" "jisoo_tgatt" {
    target_group_arn = aws_lb_target_group.jisoo_albtg.arn
    target_id = aws_instance.jisoo_weba.id
    port = 80 
}