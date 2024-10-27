env="dev"
domain_name = "waferhassan.online"
zone_id     = "Z0252555OF8RI2R4KATG"


db_instances = {
  mongodb = {
    app_port      = 27017
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
  }

  redis = {
    app_port      = 6379
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
  }

  rabbitmq = {
    app_port      = 5672
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
  }

  mysql = {
    app_port      = 3306
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
  }
}

app_instances = {

  catalogue = {
    app_port      = 8080
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
  }

  cart = {
    app_port      = 8080
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
  }

  user = {
    app_port      = 8080
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
  }

  shipping = {
    app_port      = 8080
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
  }

  payment = {
    app_port      = 8080
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
  }

}

web_instances = {
  frontend = {
    app_port      = 80
    instance_type = "t3.small"
    # vpc_id="vpc-0e7361b299bf17582"
  }
}