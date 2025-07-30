
# resource "cloudflare_load_balancer_pool" "netlify_pool" {
#   account_id       = "aed898552e5dcb6d77303e6fb9fd5d91"
#   name             = "netlify-pool-test"
#   description      = "Netlify test pool (Blue)"
#   enabled          = true
#   origins = [{
#     name    = "netlify"
#     address = "effortless-marzipan-66c004.netlify.app"
#     enabled = true
#     header = {
#       host = ["effortless-marzipan-66c004.netlify.app"]
#     }
#   }]
# #     origin_steering = {
# #     policy = "random"
# #   }
#   monitor = cloudflare_load_balancer_monitor.https_monitor.id
# }

# resource "cloudflare_load_balancer_monitor" "https_monitor" {
#     account_id = "aed898552e5dcb6d77303e6fb9fd5d91"
#   type           = "https"
#   description    = "HTTPS monitor"
#   method         = "GET"
#   path           = "/"
#   interval       = 60
#   retries        = 2
#   timeout        = 5
#   expected_codes = "2xx"
  
#   header ={
#     Host = ["effortless-marzipan-66c004.netlify.app"]
#   }
# }

# resource "cloudflare_load_balancer_monitor" "https_monitor2" {
#     account_id = "aed898552e5dcb6d77303e6fb9fd5d91"
#   type           = "https"
#   description    = "HTTPS monitor"
#   method         = "GET"
#   path           = "/"
#   interval       = 60
#   retries        = 2
#   timeout        = 5
#   expected_codes = "2xx"
  
#   header ={
#     Host = ["vercel-site-tan.vercel.app"]
#   }
# }
# resource "cloudflare_load_balancer_pool" "vercel_pool" {
#   account_id       = "aed898552e5dcb6d77303e6fb9fd5d91"
#   name             = "vercel-pool-test"
#   description      = "Vercel test pool (Green)"
#   enabled          = true
#   origins =[{
#     name    = "vercel"
#     address = "cname.vercel-dns.com"
#     enabled = true
#     header = {
#       host = ["vercel-site-tan.vercel.app"]
#     }
#   }]
# #    origin_steering = {
# #     policy = "random"
# #   }
#   monitor = cloudflare_load_balancer_monitor.https_monitor2.id
# }

# # resource "cloudflare_dns_record" "this" {

# #   zone_id = "3ef9358bc740214b90cea8378fe39221"
# #   name    = "blue-green.thenational.academy"
# #   type    = "CNAME"
# #   content = cloudflare_load_balancer.blue_green.name
# #   proxied = true
# #   tags = ["vercel-migration Blue-Green test"]
# #   ttl     = 1
# # }

# resource "cloudflare_load_balancer" "blue_green" {
#     # depends_on = [ cloudflare_dns_record.this ]
#   zone_id          = "3ef9358bc740214b90cea8378fe39221"
#   name             = "blue-green.thenational.academy"
#   description      = "vercel-migration Blue-Green test"
#   steering_policy  = "random"
# #   session_affinity = "cookie"
# #   session_affinity_ttl = 3600
#   proxied = true

#   random_steering = {
#     pool_weights = {
#       "${cloudflare_load_balancer_pool.netlify_pool.id}" = 0
#       "${cloudflare_load_balancer_pool.vercel_pool.id}"  = 1
#     }
#   }

#   default_pools = [
#     cloudflare_load_balancer_pool.netlify_pool.id,
#     cloudflare_load_balancer_pool.vercel_pool.id
#   ]
#   fallback_pool = cloudflare_load_balancer_pool.vercel_pool.id
# }

# output "lb_hostname" {
#   value = cloudflare_load_balancer.blue_green.name
# }