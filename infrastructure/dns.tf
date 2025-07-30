data "cloudflare_accounts" "oak" {
  name = "Oak National Academy"
}
# data "cloudflare_zone" "thenational" {
#   account_id = data.cloudflare_accounts.oak.accounts[0].id
#   name       = "thenational.academy"
# }

data "cloudflare_zone" "this" {
  filter={
  name       = "oaknational.dev"
  }
}
# # resource "vercel_project_domain" "this" {
# #   for_each = { for domain in var.domains: domain.name => domain if domain.redirect_to_main == false}

# #   project_id = vercel_project.this.id
# #   domain     = each.key
# # }
# # resource "cloudflare_dns_record" "this" {

# #   zone_id = data.cloudflare_zone.this.zone_id
# #  name    = var.domain
# #   type    = "CNAME"
# #   content = "cname.vercel-dns.com"
# #   proxied = true
# #   ttl     = 1
# # }

# # resource "cloudflare_certificate_pack" "this" {
# #   zone_id           = data.cloudflare_zone.thenational.id
# #   # hosts             = [var.domain]
# #   hosts = ["kofo-est.thenational.academy"]
# #   validation_method = "txt"
# #   certificate_authority= "google"
# #   type = "advanced"
# #   validity_days = "14"
# # }
# # resource "cloudflare_record" "txt" {
# #  for_each = {
# #     for rec in cloudflare_certificate_pack.this.validation_records :
# #     rec.txt_name => rec
# #   }
# #   zone_id = data.cloudflare_zone.thenational.id
# #   name    = each.key
# #   type    = "TXT"
# #   value   = each.value.txt_value
# #   ttl     = 120
# # }

# resource "cloudflare_record" "this" {

#   zone_id = data.cloudflare_zone.thenational.id
#  name    = var.domain
#   type    = "CNAME"
#   # value = "498644d724a3cde8.vercel-dns-013.com"
#   value="cname.vercel-dns.com"
#   proxied = true
#   ttl     = 1
# }

# # resource "cloudflare_record" "this2" {

# #   zone_id = data.cloudflare_zone.thenational.id
# #  name    = "klast.thenational.academy"
# #   type    = "CNAME"
# #   value = "498644d724a3cde8.vercel-dns-013.com"
# #   proxied = true
# #   ttl     = 1
# # }

# # resource "cloudflare_record" "this3" {

# #   zone_id = data.cloudflare_zone.thenational.id
# #  name    = "kofow.thenational.academy"
# #   type    = "CNAME"
# #   value = "498644d724a3cde8.vercel-dns-013.com"
# #   proxied = true
# #   ttl     = 1
# # }

# # resource "cloudflare_record" "this_netlify" {

# #   zone_id = data.cloudflare_zone.thenational.id
# #  name    = "kofow.thenational.academy"
# #   type    = "CNAME"
# #   value = "curious-torte-d7e902.netlify.app"
# #   proxied = true
# #   ttl     = 1
# # }

# resource "cloudflare_record" "txt_vercel" {

#   zone_id = data.cloudflare_zone.thenational.id
#  name    = "_acme-challenge.kofow"
#   type    = "TXT"
#   value = "CNUbgHoGhPuChNJBX8bsdT9jVeMLghD9G74cv-gNOq0"
#   ttl     = 1
# }

# # resource "cloudflare_record" "txt_vercel2" {

# #   zone_id = data.cloudflare_zone.thenational.id
# #  name    = "_vercel"
# #   type    = "TXT"
# #   value = "vc-domain-verify=testtt.thenational.academy,123210bada08177f2c94,dc"
# #   ttl     = 1
# # }

# resource "cloudflare_record" "txt_netlify" {

#   zone_id = data.cloudflare_zone.thenational.id
#  name    = "netlify-challenge"
#   type    = "TXT"
#   value = "917ae4cbde2fecf31530c8f7f2eee295"
#   ttl     = 1
# }

# # resource "cloudflare_ruleset" "this" {
# #   # zone_id     = data.cloudflare_zone.this.id
# #   name        = "domain-redirects"
# #   description = "Redirect rules for Vercel domains"
# #   kind        = "zone"
# #   phase       = "http_request_dynamic_redirect"

# #  rules = [
# #     for domain in var.domains : 
# #     {
# #       action = "redirect"
# #       action_parameters = {
# #         from_value = {
# #           status_code = 301
# #           target_url = {
# #             value = "https://${var.main_domain}"
# #           }
# #         }
# #       }
# #       description = "Redirects ${domain.name} to ${var.main_domain}"
# #       expression  = "(http.host eq \"${domain.name}\")"
# #       # enabled     = domain.redirect_to_main
# #     } if domain.redirect_to_main 
# #   ]
# # }

# # resource "cloudflare_dns_record" "this" {
# #     for_each = var.domains

# #   zone_id = cloudflare_zone.this.id
# #   name = replace(each.value, "/\\.?${var.zone_name}$/", "")
# #   type = "CNAME"
# #   content = "cname.vercel-dns.com"
# #   proxied = lookup(each.value, "proxied", false)
# #   tags = ["owner:vercel"]
# #   ttl = 3600
# # }

# variable "zone_name" {
#   description = "Domain name for the zone"
#   type        = string
#   default = "thenational.academy"
# }

# # variable "domains" {
# #   description = "Custom domains"
# #   type        = map(string)
# #   default     = {"owa-vercel.thenational.academy" = ""}
# # }

# # # cloudflare = {
# # #       source  = "cloudflare/cloudflare"
# # #       version = "~> 5.6.0"
# # #     }