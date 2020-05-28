package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/gcp"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

func TestTerraformGcpExample(t *testing.T) {
	vars := map[string]interface{}{
		"agent_cidr_range":  "10.0.0.0/16",
		"master_cidr_range": "10.1.0.0/16",
		"cluster_name":      "testcluster",
	}

	t.Parallel()

	exampleDir := test_structure.CopyTerraformFolderToTemp(t, "../", "./")
	projectId := gcp.GetGoogleProjectIDFromEnvVar(t)

	// Configure Terraform setting path to Terraform code, bucket name, and instance name.
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: exampleDir,

		// Variables to pass to our Terraform code using -var options
		Vars: vars,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of some of the output variables
	networkName := terraform.Output(t, terraformOptions, "network_name")

	fmt.Printf("%v", networkName)
	compute := gcp.NewComputeService(t)
	network, err := compute.Networks.Get(projectId, networkName).Do()

	if assert.NoError(t, err) {
		assert.Equal(t, fmt.Sprintf("%s-network", vars["cluster_name"]), network.Name)
	}

	assert.Len(t, network.Subnetworks, 2)

	// assert.Contains(t, network.Subnetworks, "10.0.0.0")
	// assert.Contains(t, network.Subnetworks, "10.1.0.0")
}
