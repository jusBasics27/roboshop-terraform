provider "vault" {
  address         = "http://vault-internal.waferhassan.online:8200"
  token           = var.vault_token
  skip_tls_verify = true
}


# my note: This provider always helps to connect to the instance here its vault instance which requires token to get in