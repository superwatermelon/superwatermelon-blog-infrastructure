# Superwatermelon Blog Infrastructure

A Terraform module for the infrastructure required to support the
Superwatermelon blog.

Creates a load-balancer listener rule (currently expects an application load
balancer and external listener to already exist) forwarding traffic with the
given host to the blog app port.

## Usage

```terraform
module "blog" {
  source = "github.com/superwatermelon/superwatermelon-blog-infrastructure"
  artifact_bucket_name = "artifacts"
  vpc_id = "${aws_vpc.main.id}"
  asg_id = "${aws_autoscaling_group.main.id}"
  http_listener_arn = "${aws_lb_listener.main_http.arn}"
  https_listener_arn = "${aws_lb_listener.main_https.arn}"
  host = "blog.example.com"
}
```
