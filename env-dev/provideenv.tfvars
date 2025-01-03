env="dev"
domain_name = "waferhassan.online"
zone_id     = "Z0252555OF8RI2R4KATG"


db_instances = {
  mongodb = {
    app_port      = 27017
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
    volume_size=20
  }

  redis = {
    app_port      = 6379
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
    volume_size=20
  }

  rabbitmq = {
    app_port      = 5672
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
    volume_size=20
  }

  mysql = {
    app_port      = 3306
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
    volume_size=20
  }
}

app_instances = {

  catalogue = {
    app_port      = 8080
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
    volume_size=30
  }

  cart = {
    app_port      = 8080
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
    volume_size=30
  }

  user = {
    app_port      = 8080
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
    volume_size=30
  }

  shipping = {
    app_port      = 8080
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
    volume_size=30
  }

  payment = {
    app_port      = 8080
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
    volume_size=30
  }

}

web_instances = {
  frontend = {
    app_port      = 80
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
    volume_size=20
  }
}

eks = {
  subnet_ids = ["subnet-0eeecc495d4cd5f80","subnet-0d2fcd631f420bc93"]
  addons={
    vpc-cni = {}
    # coredns = {} -  removed becoz its not required
    kube-proxy  = {}
    eks-pod-identity-agent = {}
  }

  access_entries= {
    workstation = {
      principal_arn = "arn:aws:iam::137068255381:role/wk-role"
      kubernetes_groups = []
      policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
      access_scope_type = "cluster"
      access_scope_namespaces = []
    }
    # UI Access
    ui-access = {
      principal_arn = "arn:aws:iam::137068255381:root"
      kubernetes_groups = []
      policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
      access_scope_type = "cluster"
      access_scope_namespaces = []
    }
  }


  node_groups = {
    g1 = {
      desired_size = 1
      max_size     = 2
      min_size     = 1
      capacity_type=  "SPOT"
      instance_types= ["t3.large"]
    }
  }
}