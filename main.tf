# Terraform Main

module "domain" {
  source = "git::https://github.com/nalbam/terraform-aws-route53.git"
  domain = "${var.domain}"
}

module "demo-web" {
  source = "git::https://github.com/nalbam/terraform-aws-static-web.git"
  region = "${var.region}"

  zone_id         = "${module.domain.zone_id}"
  certificate_arn = "${module.domain.certificate_arn}"

  domain_name = [
    "${var.stage}-web.${var.domain}"
  ]
}
