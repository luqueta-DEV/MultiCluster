module "eks" {

    source = "terraform-aws-modules/eks/aws"
    version = "~> 18.0"


    cluster_name = "my_cluster"
    cluster_version = "1.24"
    vpc_id = "module.vpc.vpc_id"
    subnet-ids = "module.vpc.private_subnets"

    node_groups = {
     eks_nodes = {
    desired_capacity    = 2
    max_capacity        = 3 
    min_capacity        = 1

} 
  }
   
  }  
