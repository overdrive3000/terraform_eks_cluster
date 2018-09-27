output "service_role" {
  description = "EKS IAM Service Role"
  value       = "${aws_iam_role.service-role.arn}"
}

output "node_instance_profile" {
  description = "IAM Instance Profile of EKS Node"
  value       = "${aws_iam_instance_profile.eks-node.arn}"
}

output "node_role_arn" {
  description = "Role ARN of EKS Node"
  value       = "${aws_iam_role.eks-node.arn}"
}

output "security_group" {
  description = "EKS Control Plane Security Group"
  value       = "${aws_security_group.control-plane-sg.id}"
}

output "endpoint" {
  description = "EKS Endpoint"
  value       = "${aws_eks_cluster.cluster.endpoint}"
}

output "certificate-authority-data" {
  description = "EKS Certificate Authority Data"
  value       = "${aws_eks_cluster.cluster.certificate_authority.0.data}"
}
