provider "netlify" {
  token = var.NETLIFY_API_TOKEN
}

resource "netlify_site" "astro_site" {
  name = "Astro dashboard"
  #   custom_domain = "your-domain.com"

  repo {
    provider = "github"
    repo_branch = "main"
    repo_path = "pabloimrik17/kinkoi-project"
    command = "pnpm build"
    dir = "dist"
    deploy_key_id = netlify_deploy_key.astro_key.id
  }
}

resource "netlify_deploy_key" "astro_key" {
  // Empty resource. The id will be used in the netlify_site resource.
}
