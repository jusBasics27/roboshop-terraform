env="dev"
domain_name = "waferhassan.online"
zone_id     = "Z02249652EM5BAO495DZ1"


db_instances = {
  mongodb = {
    app_port      = 27017
    instance_type = "t3.small"
    vpc_id="vpc-089f5c3c4016f25e4"
  }

  redis = {
    app_port      = 6379
    instance_type = "t3.small"
    vpc_id="vpc-089f5c3c4016f25e4"
  }

  rabbitmq = {
    app_port      = 5672
    instance_type = "t3.small"
    vpc_id="vpc-089f5c3c4016f25e4"
  }

  mysql = {
    app_port      = 3306
    instance_type = "t3.small"
    vpc_id="vpc-089f5c3c4016f25e4"
  }
}

app_instances = {

  catalogue = {
    app_port      = 8080
    instance_type = "t3.small"
    vpc_id="vpc-089f5c3c4016f25e4"
  }

  cart = {
    app_port      = 8080
    instance_type = "t3.small"
    vpc_id="vpc-089f5c3c4016f25e4"
  }

  user = {
    app_port      = 8080
    instance_type = "t3.small"
    vpc_id="vpc-089f5c3c4016f25e4"
  }

  shipping = {
    app_port      = 8080
    instance_type = "t3.small"
    vpc_id="vpc-089f5c3c4016f25e4"
  }

  payment = {
    app_port      = 8080
    instance_type = "t3.small"
    vpc_id="vpc-089f5c3c4016f25e4"
  }

}

web_instances = {
  frontend = {
    app_port      = 80
    instance_type = "t3.small"
    vpc_id="vpc-089f5c3c4016f25e4"
  }
}