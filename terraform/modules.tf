module "vpc" {
  source         = "./modules/vpc"
  aws_region     = var.aws_region
  cluster_name   = var.cluster_name
}

module "cluster" {
  source                  = "./modules/cluster"
  vpc_id                  = module.vpc.vpc_id
  aws_region              = var.aws_region
  cluster_name            = var.cluster_name
  cluster_key             = aws_key_pair.cluster_key.key_name
  aws_ami_base            = var.aws_ami_base
  public_subnet_1a        = module.vpc.public_subnet_1a
  public_subnet_1b        = module.vpc.public_subnet_1b
  nodes_instance_type     = var.nodes_instance_type
  kibana_instance_type    = var.kibana_instance_type
  apm_instance_type       = var.apm_instance_type
  logstash_instance_type  = var.logstash_instance_type
}