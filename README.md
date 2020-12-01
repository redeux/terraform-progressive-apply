# terraform-progressive-apply

This config seems to tigger the "progressive apply" issue in Terraform. Run as is, the configuration should apply without issue. However, if you swap the Kubernetes provider blocks, it should fail the first time and work the second.

Note: Assumes you have a Kubernetes cluster, such as Kind, available to you.

```shell

➜  terraform-progressive-apply git:(master) tf init 

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/local...
- Finding latest version of hashicorp/kubernetes...
- Installing hashicorp/kubernetes v1.13.3...
- Installed hashicorp/kubernetes v1.13.3 (signed by HashiCorp)
- Installing hashicorp/local v2.0.0...
- Installed hashicorp/local v2.0.0 (signed by HashiCorp)

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, we recommend adding version constraints in a required_providers block
in your configuration, with the constraint strings suggested below.

* hashicorp/kubernetes: version = "~> 1.13.3"
* hashicorp/local: version = "~> 2.0.0"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

➜  terraform-progressive-apply git:(master) tf apply --auto-approve

local_file.otherstuff[9]: Creating...
local_file.otherstuff[0]: Creating...
local_file.otherstuff[6]: Creating...
local_file.otherstuff[3]: Creating...
local_file.otherstuff[2]: Creating...
local_file.otherstuff[7]: Creating...
local_file.otherstuff[1]: Creating...
local_file.otherstuff[5]: Creating...
local_file.otherstuff[8]: Creating...
local_file.otherstuff[4]: Creating...
local_file.otherstuff[9]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[0]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[7]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[6]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[1]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[5]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[3]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[2]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[4]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[8]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.kubeconfig: Creating...
local_file.kubeconfig: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
kubernetes_config_map.test: Creating...
kubernetes_config_map.test: Creation complete after 0s [id=default/test]

Apply complete! Resources: 12 added, 0 changed, 0 destroyed.

Outputs:

local_file_kubeconfig = ./kubeconfig
locals_kubeconfig_file = ./kubeconfig

➜  terraform-progressive-apply git:(master) tf destroy --auto-approve

local_file.otherstuff[9]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[1]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[0]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[4]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[5]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[2]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[6]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[8]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[3]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[7]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.kubeconfig: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
kubernetes_config_map.test: Refreshing state... [id=default/test]
kubernetes_config_map.test: Destroying... [id=default/test]
kubernetes_config_map.test: Destruction complete after 0s
local_file.kubeconfig: Destroying... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.kubeconfig: Destruction complete after 0s
local_file.otherstuff[8]: Destroying... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[4]: Destroying... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[2]: Destroying... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[6]: Destroying... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[1]: Destroying... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[8]: Destruction complete after 0s
local_file.otherstuff[9]: Destroying... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[5]: Destroying... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[3]: Destroying... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[7]: Destroying... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[0]: Destroying... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[2]: Destruction complete after 0s
local_file.otherstuff[4]: Destruction complete after 0s
local_file.otherstuff[5]: Destruction complete after 0s
local_file.otherstuff[9]: Destruction complete after 0s
local_file.otherstuff[1]: Destruction complete after 0s
local_file.otherstuff[3]: Destruction complete after 0s
local_file.otherstuff[6]: Destruction complete after 0s
local_file.otherstuff[7]: Destruction complete after 0s
local_file.otherstuff[0]: Destruction complete after 0s

Destroy complete! Resources: 12 destroyed.

➜  terraform-progressive-apply git:(master) code ./
➜  terraform-progressive-apply git:(master) tf apply --auto-approve

local_file.otherstuff[7]: Creating...
local_file.otherstuff[1]: Creating...
local_file.otherstuff[0]: Creating...
local_file.otherstuff[2]: Creating...
local_file.otherstuff[5]: Creating...
local_file.otherstuff[6]: Creating...
local_file.otherstuff[9]: Creating...
local_file.otherstuff[8]: Creating...
local_file.otherstuff[4]: Creating...
local_file.otherstuff[7]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[0]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[1]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[6]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[9]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[4]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[5]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[2]: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[3]: Creating...
local_file.otherstuff[8]: Creation complete after 1s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[3]: Creation complete after 1s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.kubeconfig: Creating...
local_file.kubeconfig: Creation complete after 0s [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
kubernetes_config_map.test: Creating...

Error: Post "http://localhost/api/v1/namespaces/default/configmaps": dial tcp [::1]:80: connect: connection refused

  on main.tf line 27, in resource "kubernetes_config_map" "test":
  27: resource "kubernetes_config_map" "test" {


➜  terraform-progressive-apply git:(master) ✗ tf apply --auto-approve

local_file.otherstuff[9]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[8]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[3]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[7]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[0]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[6]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[2]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[1]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[4]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.otherstuff[5]: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
local_file.kubeconfig: Refreshing state... [id=5120530cc2c3000015b6e19e81f0cf91312a3b54]
kubernetes_config_map.test: Creating...
kubernetes_config_map.test: Creation complete after 0s [id=default/test]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

local_file_kubeconfig = ./kubeconfig
locals_kubeconfig_file = ./kubeconfig
➜  terraform-progressive-apply git:(master) ✗ 
```
