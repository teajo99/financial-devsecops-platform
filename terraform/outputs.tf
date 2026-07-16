output "vpc_id" {

  value = aws_vpc.main.id

}

output "cluster_name" {

  value = aws_eks_cluster.financial.name

}

output "ecr_repository_url" {

  value = aws_ecr_repository.financial_api.repository_url

}

output "node_group_name" {

  value = aws_eks_node_group.financial_nodes.node_group_name

}

