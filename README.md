# terraform-progressive-apply

This config seems to tigger the "progressive apply" issue in Terraform. Run as is, the configuration should apply without issue. However, if you swap the Kubernetes provider blocks, it should fail every time.

Note: Assumes you have a Kubernetes cluster, such as Kind, available to you.
