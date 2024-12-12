data "aws_eks_addon_version" "add-on-version" {
  # addon_name         = "vpc-cni"
  for_each = var.addons
  addon_name = each.key
  kubernetes_version = aws_eks_cluster.main.version
}

# To print the above data output
# output "add-on-version" {
#   value = data.aws_eks_addon_version.add-on-version
# }