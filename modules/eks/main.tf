resource "aws_eks_cluster" "main" {
  name = "${var.env}-eks"

  # access_config {
  #   authentication_mode = "API"
  # }

  role_arn = aws_iam_role.eks-cluster-role.arn
  # version  = "1.31"

  vpc_config {
    subnet_ids = var.subnet_ids
  }

}

# resource "aws_eks_addon" "vpc-cni" {
#   cluster_name = aws_eks_cluster.main.name
#   addon_name   = "vpc-cni"
#   addon_version = "v1.19.1-eksbuild.1"
# }
# The above code is for one addon, the below code is for multiple, so modified to for-each loop
resource "aws_eks_addon" "vpc-cni" {
  for_each = var.addons
  cluster_name = aws_eks_cluster.main.name
  addon_name   = each.key
  addon_version = data.aws_eks_addon_version.add-on-version[each.key].version
}

resource "aws_eks_node_group" "main" {
  for_each = var.node_groups
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = each.key
  node_role_arn   = aws_iam_role.eks-node-group-role.arn
  subnet_ids      = var.subnet_ids
  capacity_type = each.value["capacity_type"]
  instance_types = each.value["instance_types"]

  scaling_config {
    desired_size = each.value["desired_size"]
    max_size     = each.value["max_size"]
    min_size     = each.value["min_size"]
  }

}



