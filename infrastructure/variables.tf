# variable "git_repository" {
#   type = string
# }

# variable "git_branch" {
#   type = string
# }

# variable "domain" {
#   type = string
#   default = "kofow.thenational.academy"
#   # default = "test2.thenational.academy"
  
# }
# variable "domains" {
#   description = "Custom domains"
#     type = list(object({
#     name = string
#     redirect_to_main = optional(bool, false)
#   }))
#   default     = [
#     {
#       name = "labs.thenational.academy"
       
#     },
#     {
#       name = "oak-ai-lesson-assistant.vercel-preview.thenational.academy"
#       redirect_to_main = true
#       # redirect="labs.thenational.academy",
#     },
#     {
#       name = "xxx"
#       redirect_to_main = true
#       # redirect="labs.thenational.academy",
#     },
#     {
#       name = "oyyy"
#       redirect_to_main = false
#       # redirect="labs.thenational.academy",
#     }
#   ]

# }
# variable "main_domain" {
#   description = "Primary domain for the Project"
#   type = string
#   default = "labs.thenational.academy"
# }