terraform{
    required_providers {
        github = {
            source = "integrations/github"
        }
    }
}

provider "github"{
    token = "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"
}

resource "github_repository" "terraform-test" {
  name        = "terraform"
  description = "for testtin TF codes"

  visibility = "public"

}