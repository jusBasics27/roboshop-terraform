env="dev"
domain_name = "waferhassan.online"
zone_id     = "Z02470712UA22OR7V1PNU"


db_instances = {
  mongodb = {
    app_port      = 27017
    instance_type = "t3.small"
    vpc_id="vpc-01d500845db0873f4"
  }

  redis = {
    app_port      = 6379
    instance_type = "t3.small"
    vpc_id="vpc-01d500845db0873f4"
  }

  rabbitmq = {
    app_port      = 5672
    instance_type = "t3.small"
    vpc_id="vpc-01d500845db0873f4"
  }

  mysql = {
    app_port      = 3306
    instance_type = "t3.small"
    vpc_id="vpc-01d500845db0873f4"
  }
}

app_instances = {

  catalogue = {
    app_port      = 8080
    instance_type = "t3.small"
    vpc_id="vpc-01d500845db0873f4"
  }

  cart = {
    app_port      = 8080
    instance_type = "t3.small"
    vpc_id="vpc-01d500845db0873f4"
  }

  user = {
    app_port      = 8080
    instance_type = "t3.small"
    vpc_id="vpc-01d500845db0873f4"
  }

  shipping = {
    app_port      = 8080
    instance_type = "t3.small"
    vpc_id="vpc-01d500845db0873f4"
  }

  payment = {
    app_port      = 8080
    instance_type = "t3.small"
    vpc_id="vpc-01d500845db0873f4"
  }

}

web_instances = {
  frontend = {
    app_port      = 80
    instance_type = "t3.small"
    vpc_id="vpc-01d500845db0873f4"
  }
}