module "childmodule" {
  source = "../webserverModule"
  instance_size = "Standard_D1_v2"
  location = "westeurope"
  environment = "Prod"
}
