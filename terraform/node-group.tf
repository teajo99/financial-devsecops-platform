resource "aws_iam_role" "eks_node_role" {

  name = "financial-eks-node-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "ec2.amazonaws.com"

        }

        Action = "sts:AssumeRole"

      }

    ]

  })

}

resource "aws_iam_role_policy_attachment" "worker_node_policy" {

  role = aws_iam_role.eks_node_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

}

resource "aws_iam_role_policy_attachment" "ecr_read_policy" {

  role = aws_iam_role.eks_node_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

}

resource "aws_iam_role_policy_attachment" "cni_policy" {

  role = aws_iam_role.eks_node_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

}

resource "aws_eks_node_group" "financial_nodes" {

  cluster_name = aws_eks_cluster.financial.name

  node_group_name = "financial-workers"

  node_role_arn = aws_iam_role.eks_node_role.arn

  subnet_ids = [

    aws_subnet.private_1.id,

    aws_subnet.private_2.id

  ]

  scaling_config {

    desired_size = 2

    min_size = 2

    max_size = 4

  }

  instance_types = ["t3.medium"]

  capacity_type = "ON_DEMAND"

  depends_on = [

    aws_iam_role_policy_attachment.worker_node_policy,

    aws_iam_role_policy_attachment.ecr_read_policy,

    aws_iam_role_policy_attachment.cni_policy

  ]

}

