module external_dns {
  source = "github.com/schrieksoft/module-kustomization.git?ref=main"
  absolute_paths = ["${path.root}/manifests"]
  patches = [
    {
      patch = templatefile("${path.module}/patches/namespace.yaml.tftpl",{
        namespace_tolerations = jsonencode(var.namespace_tolerations)
        namespace_node_selector = jsonencode(var.namespace_node_selector)
      })
    },
  ]
  secret_generators = [
    {
      name  = "external-dns"
      namespace = "external-dns"
      literals = [
        "cloudflare-api-token=${data.azurerm_key_vault_secret.this["cloudflare-api-token"].value}",
        "email=${var.cloudflare_email}",
      ]
      options = {
        disable_name_suffix_hash = false
      }
    }
  ]
}
