terraform {
  required_providers {
    vercel = {
      source = "vercel/vercel"
      version = "~> 3.5.1"
    }
  }
}

resource "vercel_project" "this" {
  name      = "learning-vercel"
  framework = "nextjs"
  git_repository = {
    type = "github"
    repo = var.git_repository
  }
   root_directory = "api"
}

resource "vercel_deployment" "this" {
  project_id  = vercel_project.this.id
  ref=var.git_branch
}