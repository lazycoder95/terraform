terraform{
    required_providers {
        github = {
            source = "integrations/github"
        }
    }
}

provider "github"{}

resource "github_repository" "terraform-test" {
  name        = "terraform"
  description = "for testtin TF codes"

  visibility = "public"

}