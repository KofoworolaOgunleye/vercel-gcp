terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      # version = "~> 4.29.0"
      version = "~>5.6.0"
    }
    vercel = {
      source  = "vercel/vercel"
      version = "~> 3.5.1"
    }
  }
}

# resource "vercel_project" "this" {
#   name = "vercel-gcp"
#   # framework = "nextjs"
#   enable_affected_projects_deployments=false
#   git_repository = {
#     type = "github"
#     repo = "KofoworolaOgunleye/vercel-gcp"
#   }
#   root_directory = "app/vercel-site"
# }

# resource "vercel_project" "this" {
#   # name      = "learning-vercel"
#   name = "vercel-gcp"
#   framework = "nextjs"
#   # oidc_token_config = {
#   #   enabled     = true
#   #   issuer_mode = "global"
#   # }
#   git_repository = {
#     type = "github"
#     repo = var.git_repository
#   }
#   enable_affected_projects_deployments=true
#   root_directory = "app"
# }

# resource "vercel_project_domain" "example" {
#   project_id = vercel_project.this.id
#   # domain     = var.domain
#   domain = "kofow.thenational.academy"
#   team_id = "team_5MdEwhWulpsOF31pm2UPqJOC"
# }

# resource "vercel_deployment" "this" {
#   project_id  = vercel_project.this.id
#   ref=var.git_branch
# }


# resource "vercel_custom_environment" "this" {
#   project_id  = vercel_project.this.id
#   name        = "staging"
#   description = "Custom environment for "

#   branch_tracking = {
#     pattern = "feat/add-app"
#     type    = "equals"
#   }
# }