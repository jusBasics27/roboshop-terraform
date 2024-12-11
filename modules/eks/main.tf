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


  # depends_on = [
  #   aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
  # ]
}