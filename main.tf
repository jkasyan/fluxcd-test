terraform {
  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = "1.3.0"
    }
  }
}

provider "flux" {
  kubernetes = {
    config_path = "~/.kube/config"
  }

  git = {
    url = "https://github.com/kbot.git"
    http = {
      username = "git"
      password = var.github_token
    }
  }
}


resource "flux_bootstrap_git" "this" {
  path = var.target_path
}
