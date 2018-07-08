resource "aws_lb_target_group" "blog" {
  name     = "blog"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    path                = "/status"
    protocol            = "HTTP"
    port                = 3000
    interval            = 30
  }
}

resource "aws_autoscaling_attachment" "asg" {
  autoscaling_group_name = "${var.asg_id}"
  alb_target_group_arn   = "${aws_lb_target_group.blog.arn}"
}

resource "aws_lb_listener_rule" "blog" {
  listener_arn = "${var.http_listener_arn}"
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.blog.arn}"
  }

  condition {
    field  = "host-header"
    values = ["${var.host}"]
  }
}

resource "aws_lb_listener_rule" "www_blog" {
  listener_arn = "${var.http_listener_arn}"
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.blog.arn}"
  }

  condition {
    field  = "host-header"
    values = ["www.${var.host}"]
  }
}

resource "aws_lb_listener_rule" "blog_ssl" {
  listener_arn = "${var.https_listener_arn}"
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.blog.arn}"
  }

  condition {
    field  = "host-header"
    values = ["${var.host}"]
  }
}

resource "aws_lb_listener_rule" "www_blog_ssl" {
  listener_arn = "${var.https_listener_arn}"
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.blog.arn}"
  }

  condition {
    field  = "host-header"
    values = ["www.${var.host}"]
  }
}
