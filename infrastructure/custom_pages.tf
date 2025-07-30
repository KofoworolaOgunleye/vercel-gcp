# locals {
#   custom_pages = [
#     {
#       type = "basic_challenge"
#       url  = "https://oaknational.github.io/static-website-error-pages-2022/custom-error-waf-challenge.html"
#     },
#     {
#       type = "country_challenge"
#       url  = "https://oaknational.github.io/static-website-error-pages-2022/custom-error-under-attack.html"
#     },
#     {
#       type = "managed_challenge"
#       url  = "https://oaknational.github.io/static-website-error-pages-2022/custom-error-waf-challenge.html"
#     },
#     {
#       type = "ip_block"
#       url  = "https://oaknational.github.io/static-website-error-pages-2022/custom-error-geo-block.html"
#     },
#     {
#       type = "500_errors"
#       url  = "https://oaknational.github.io/static-website-error-pages-2022/custom-error-500.html"
#     },
#     {
#       type = "1000_errors"
#       url  = "https://oaknational.github.io/static-website-error-pages-2022/custom-error-1000.html"
#     },
#   ]
# }

locals {
  html_files = {
    "basic_challenge" = {
      file_path = "${path.root}/index.html"
      type      = "basic_challenge"
    }
    # "country_challenge" = {
    #   file_path = "${path.module}/docs/custom-error-under-attack.html"
    #   type      = "country_challenge"
    # }
  }
   custom_pages = [
    for key, config in local.html_files : {
      type      = config.type
      # url       = "https://oaknational.github.io/static-website-error-pages-2022/${basename(config.file_path)}"
      url = "https://kofoworolaogunleye.github.io/vercel-gcp/${basename(config.file_path)}"
      file_hash = filemd5(config.file_path)
    }
  ]
}

locals {
  custom_pages_records = {
    for cp in local.custom_pages : cp.type => cp
  }
}

resource "terraform_data" "this" {
  for_each = local.custom_pages_records
  
  input = each.value.file_hash
}

resource "cloudflare_custom_pages" "this" {
  for_each = local.custom_pages_records

  zone_id =  data.cloudflare_zone.this.zone_id
  identifier = each.value.type
  url     = each.value.url
  state   = "customized"

  lifecycle {
    replace_triggered_by = [
      terraform_data.this[each.key]
    ]
  }
}


# $ terraform import cloudflare_custom_pages.example '<{accounts|zones}/{account_id|zone_id}>/<identifier>'