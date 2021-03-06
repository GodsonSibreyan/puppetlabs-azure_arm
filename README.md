# Azure ARM

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
   * [Getting Azure credentials](#getting-azure-credentials)
   * [Set environment variables](#setting-environment-variables)
   * [Installing the module](#installing-the-module)
   * [Validating the module](#validating-the-module)
3. [Usage](#usage)
   * [Examples](#examples)
4. [Reference](#reference)
   * [Types and providers](#types-and-providers)

## Deprecation notice

We are no longer developing [this module](https://github.com/puppetlabs/puppetlabs-azure_arm) and will be eventually deprecating in the future.

## Description

Microsoft Azure exposes a powerful API for creating and managing its Infrastructure as a Service platform. Using Puppet code, the azure arm (Azure Resource Manager) module enables you to interact with that API to create and destroy virtual machines, and to manage other resources.

The azure arm module is generated from the Microsoft Azure [REST API specifications](https://github.com/Azure/azure-rest-api-specs/).  For additional information, see the [Azure documentation](https://docs.microsoft.com/azure/).

Classic (ASM) Azure is not supported.

> **Note**: This module and the [puppetlabs-azure](https://forge.puppet.com/puppetlabs/azure) module are mutually exclusive and should not be installed on the same machine. To avoid potential errors during a puppet run, install each module on separate machines.

## Setup

### Getting Azure credentials

To use this module, you need an Azure account. If you already have one, you can skip this section.

1. Sign up for an [Azure account](https://azure.microsoft.com/free/).

2. To generate a certificate for the Puppet module, install the [Azure CLI](https://azure.microsoft.com/documentation/articles/xplat-cli-install/) which is a cross-platform node.js-based tool that works on Windows and Linux.

3. To authenticate with the [Azure CLI](https://azure.microsoft.com/documentation/articles/xplat-cli-connect/), run the following command to receive the authentication code:

   ```shell
   az login
   ```

4. Visit https://microsoft.com/devicelogin and enter the authentication code.

5. To get a subscription ID, run the `az account list` command:

    ``` shell
    $ az account list
[
  {
    "cloudName": "AzureCloud",
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "isDefault": true,
    "name": "xxxx",
    "state": "Enabled",
    "tenantId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "user": {
      "name": "xxxx@xxxx.xxx",
      "type": "user"
    }
  }
]
    ```

To use the Resource Manager API instead, you need a service principal on the Active Directory. For more information, see the [Azure documentation](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-api-authentication).

### Setting environment variables

Set the following environment variables specific to your Azure installation (note the casing here).

```bash
export azure_subscription_id='your-subscription-id'
export azure_tenant_id='your-tenant-id'
export azure_client_id='your-client-id'
export azure_client_secret='your-client-secret'
```

#### Installing the module

To install the azure arm module, run the following command:

```shell
puppet module install puppetlabs-azure_arm
```

#### Validating the module

The azure arm module is compliant with the Puppet Development Kit [(PDK)](https://puppet.com/docs/pdk/1.x/pdk.html), which provides the tool to help validate the modules's metadata, syntax, and style. When you run validations, the PDK output tells you which validations are running and notifies you of any errors, or warnings, it finds for each type of validation; syntax, code style, and metadata.

To run all validations against this module, run the following commands:

```
pdk validate ruby
pdk validate metadata
```

To change validation behavior, add options flags to the command. For a complete list of command options and usage information, see the PDK command [reference](https://puppet.com/docs/pdk/1.x/pdk_reference.html#pdk-validate-command).

## Usage 

To create or remove resources in your manifests, set the `ensure` parameter to `present` or `absent`. The `stopped` and `running` states are managed using the [Microsoft Azure Portal](https://portal.azure.com). This functionality is available in the next Puppet Azure ARM release.

### Examples

The [examples](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/examples/) directory contains the following usage examples: 
* [create_vm.pp](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/examples/create_vm.pp) to create 2 virtual machines. 
* [delete_vm.pp](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/examples/delete_vm.pp) to delete the virtual machines.
* [create_virtual_machine_extension.pp](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/examples/create_virtual_machine_extension.pp) to create a virtual machine extension.
* [create_aks.pp](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/examples/create_aks.pp) for creating the Azure Kubernetes Service (AKS).
* [delete_aks.pp](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/examples/delete_aks.pp) for deleting the Azure Kubernetes Service (AKS).
* [create_resource_level_deployment.pp](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/examples/create_resource_level_deployment.pp) to deploy resources to a resource group in your Azure subscription.
* [delete_resource_level_deployment.pp](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/examples/delete_resource_level_deployment.pp) to delete a resource level deployment in your Azure subscription.
* [task_example.sh](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/examples/task_example.sh) contains a number of sample tasks, each using [Puppet Bolt](https://puppet.com/docs/bolt/0.x/bolt.html):
  * list the available Azure operations.
  * list virtual machines by location.
  * create Azure storage accounts.
  * create or delete resource level deployments.

Following the [create_vm.pp](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/examples/create_vm.pp) example, use the `puppet resource` command on existing resources to determine which values to populate in custom manifests.  

For example:

```shell
puppet resource azure_application_gateway
```

## Reference

### Types and providers

Here is a list of the types and providers with links to detailed descriptions for each one:
 
[account.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/datalake-analytics/resource-manager/Microsoft.DataLakeAnalytics/stable/2016-11-01/account.json)
 * [azure_compute_policy](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_compute_policy.md)
 * [azure_data_lake_analytics_account](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_data_lake_analytics_account.md)
 * [azure_firewall_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_firewall_rule.md)
 
[account.json(1)](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/datalake-store/resource-manager/Microsoft.DataLakeStore/stable/2016-11-01/account.json)
 * [azure_data_lake_store_account](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_data_lake_store_account.md)
 * [azure_firewall_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_firewall_rule.md)
 * [azure_trusted_id_provider](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_trusted_id_provider.md)
 * [azure_virtual_network_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_network_rule.md)
 
[accountfilters.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/mediaservices/resource-manager/Microsoft.Media/stable/2018-07-01/AccountFilters.json)
 * [azure_account_filter](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_account_filter.md)
 
[accounts.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/mediaservices/resource-manager/Microsoft.Media/stable/2018-07-01/Accounts.json)
 * [azure_media_service](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_media_service.md)
 
[actiongroups_api.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/monitor/resource-manager/Microsoft.Insights/stable/2019-06-01/actionGroups_API.json)
 * [azure_action_group_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_action_group_resource.md)
 
[activitylogalerts_api.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/monitor/resource-manager/Microsoft.Insights/stable/2017-04-01/activityLogAlerts_API.json)
 * [azure_activity_log_alert_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_activity_log_alert_resource.md)
 
[advisor.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/advisor/resource-manager/Microsoft.Advisor/stable/2017-04-19/advisor.json)
 * [azure_suppression_contract](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_suppression_contract.md)
 
[alertrules_api.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/monitor/resource-manager/Microsoft.Insights/stable/2016-03-01/alertRules_API.json)
 * [azure_alert_rule_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_alert_rule_resource.md)
 
[analysisservices.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/analysisservices/resource-manager/Microsoft.AnalysisServices/stable/2017-08-01/analysisservices.json)
 * [azure_analysis_services_server](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_analysis_services_server.md)
 
[analyticsitems_api.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/applicationinsights/resource-manager/Microsoft.Insights/stable/2015-05-01/analyticsItems_API.json)
 * [azure_application_insights_component_analytics_item](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_application_insights_component_analytics_item.md)
 
[apimdeployment.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/apimanagement/resource-manager/Microsoft.ApiManagement/stable/2019-01-01/apimdeployment.json)
 * [azure_api_management_service_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_api_management_service_resource.md)
 
[apimemailtemplate.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/apimanagement/resource-manager/Microsoft.ApiManagement/stable/2018-01-01/apimemailtemplate.json)
 * [azure_email_template_contract](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_email_template_contract.md)
 
[apimversionsets.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/apimanagement/resource-manager/Microsoft.ApiManagement/stable/2018-01-01/apimversionsets.json)
 * [azure_api_version_set_contract](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_api_version_set_contract.md)
 
[application.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/servicefabric/resource-manager/Microsoft.ServiceFabric/stable/2019-03-01/application.json)
 * [azure_application_type_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_application_type_resource.md)
 
[applicationgateway.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/applicationGateway.json)
 * [azure_application_gateway](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_application_gateway.md)
 
[applicationsecuritygroup.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/applicationSecurityGroup.json)
 * [azure_application_security_group](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_application_security_group.md)
 
[appservicecertificateorders.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/web/resource-manager/Microsoft.CertificateRegistration/stable/2018-02-01/AppServiceCertificateOrders.json)
 * [azure_app_service_certificate_order](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_app_service_certificate_order.md)
 * [azure_app_service_certificate_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_app_service_certificate_resource.md)
 
[appserviceenvironments.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/web/resource-manager/Microsoft.Web/stable/2018-02-01/AppServiceEnvironments.json)
 * [azure_app_service_environment_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_app_service_environment_resource.md)
 
[assetsandassetfilters.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/mediaservices/resource-manager/Microsoft.Media/stable/2018-07-01/AssetsAndAssetFilters.json)
 * [azure_asset](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_asset.md)
 * [azure_asset_filter](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_asset_filter.md)
 
[authorization-roleassignmentscalls.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/authorization/resource-manager/Microsoft.Authorization/stable/2015-07-01/authorization-RoleAssignmentsCalls.json)
 * [azure_role_assignment](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_role_assignment.md)
 
[authorization-roledefinitionscalls.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/authorization/resource-manager/Microsoft.Authorization/stable/2015-07-01/authorization-RoleDefinitionsCalls.json)
 * [azure_role_definition](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_role_definition.md)
 
[autoscale_api.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/monitor/resource-manager/Microsoft.Insights/stable/2015-04-01/autoscale_API.json)
 * [azure_autoscale_setting_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_autoscale_setting_resource.md)
 
[azureactivedirectory.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/azureactivedirectory/resource-manager/Microsoft.Aadiam/stable/2017-04-01/azureactivedirectory.json)
 * [azure_diagnostic_settings_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_diagnostic_settings_resource.md)
 
[azurefirewall.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/azureFirewall.json)
 * [azure_azure_firewall](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_azure_firewall.md)
 
[bastionhost.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/bastionHost.json)
 * [azure_bastion_host](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_bastion_host.md)
 
[batchai.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/batchai/resource-manager/Microsoft.BatchAI/stable/2018-05-01/BatchAI.json)
 * [azure_cluster](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_cluster.md)
 * [azure_experiment](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_experiment.md)
 * [azure_file_server](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_file_server.md)
 * [azure_job](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_job.md)
 * [azure_workspace](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_workspace.md)
 
[blob.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/storage/resource-manager/Microsoft.Storage/stable/2019-04-01/blob.json)
 * [azure_blob_container](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_blob_container.md)
 * [azure_immutability_policy](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_immutability_policy.md)
 
[bms.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/recoveryservicesbackup/resource-manager/Microsoft.RecoveryServices/stable/2017-07-01/bms.json)
 * [azure_protection_intent_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_protection_intent_resource.md)
 
[cdn.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/cdn/resource-manager/Microsoft.Cdn/stable/2019-04-15/cdn.json)
 * [azure_custom_domain](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_custom_domain.md)
 * [azure_endpoint](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_endpoint.md)
 * [azure_profile](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_profile.md)
 
[certificates.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/web/resource-manager/Microsoft.Web/stable/2018-11-01/Certificates.json)
 * [azure_certificate](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_certificate.md)
 
[cluster.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/servicefabric/resource-manager/Microsoft.ServiceFabric/stable/2019-03-01/cluster.json)
 * [azure_cluster](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_cluster.md)
 
[cognitiveservices.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/cognitiveservices/resource-manager/Microsoft.CognitiveServices/stable/2017-04-18/cognitiveservices.json)
 * [azure_cognitive_services_account](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_cognitive_services_account.md)
 
[components_api.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/applicationinsights/resource-manager/Microsoft.Insights/stable/2015-05-01/components_API.json)
 * [azure_application_insights_component](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_application_insights_component.md)
 
[compute.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/compute/resource-manager/Microsoft.Compute/stable/2019-03-01/compute.json)
 * [azure_availability_set](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_availability_set.md)
 * [azure_dedicated_host](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_dedicated_host.md)
 * [azure_dedicated_host_group](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_dedicated_host_group.md)
 * [azure_image](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_image.md)
 * [azure_proximity_placement_group](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_proximity_placement_group.md)
 * [azure_virtual_machine](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_machine.md)
 * [azure_virtual_machine_extension](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_machine_extension.md)
 * [azure_virtual_machine_scale_set](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_machine_scale_set.md)
 * [azure_virtual_machine_scale_set_extension](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_machine_scale_set_extension.md)
 * [azure_virtual_machine_scale_set_vm](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_machine_scale_set_vm.md)
 
[consumption.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/consumption/resource-manager/Microsoft.Consumption/stable/2019-05-01/consumption.json)
 * [azure_budget](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_budget.md)
 
[containerinstance.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/containerinstance/resource-manager/Microsoft.ContainerInstance/stable/2018-10-01/containerInstance.json)
 * [azure_container_group](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_container_group.md)
 
[containerregistry.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/containerregistry/resource-manager/Microsoft.ContainerRegistry/stable/2019-05-01/containerregistry.json)
 * [azure_registry](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_registry.md)
 * [azure_replication](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_replication.md)
 * [azure_webhook](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_webhook.md)
 
[containerregistry_build.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/containerregistry/resource-manager/Microsoft.ContainerRegistry/stable/2019-04-01/containerregistry_build.json)
 * [azure_task](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_task.md)
 
[containerservice.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/compute/resource-manager/Microsoft.ContainerService/stable/2017-01-31/containerService.json)
 * [azure_container_service](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_container_service.md)
 
[containerservice.json(1)](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/containerservice/resource-manager/Microsoft.ContainerService/stable/2017-07-01/containerService.json)
 * [azure_container_service](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_container_service.md)
 
[contentkeypolicies.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/mediaservices/resource-manager/Microsoft.Media/stable/2018-07-01/ContentKeyPolicies.json)
 * [azure_content_key_policy](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_content_key_policy.md)
 
[contentmoderator.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/cognitiveservices/data-plane/ContentModerator/stable/v1.0/ContentModerator.json)
 * [azure_image_list](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_image_list.md)
 * [azure_term_list](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_term_list.md)
 
[cosmos-db.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/cosmos-db/resource-manager/Microsoft.DocumentDB/stable/2015-04-08/cosmos-db.json)
 * [azure_cassandra_keyspace](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_cassandra_keyspace.md)
 * [azure_cassandra_table](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_cassandra_table.md)
 * [azure_database_account](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_database_account.md)
 * [azure_gremlin_database](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_gremlin_database.md)
 * [azure_gremlin_graph](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_gremlin_graph.md)
 * [azure_mongo_db_collection](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_mongo_db_collection.md)
 * [azure_mongo_db_database](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_mongo_db_database.md)
 * [azure_sql_container](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_sql_container.md)
 * [azure_sql_database](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_sql_database.md)
 * [azure_table](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_table.md)
 
[costmanagement.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/cost-management/resource-manager/Microsoft.CostManagement/stable/2019-01-01/costmanagement.json)
 * [azure_export](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_export.md)
 
[customer-insights.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/customer-insights/resource-manager/Microsoft.CustomerInsights/stable/2017-04-26/customer-insights.json)
 * [azure_connector_mapping_resource_format](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_connector_mapping_resource_format.md)
 * [azure_connector_resource_format](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_connector_resource_format.md)
 * [azure_hub](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_hub.md)
 * [azure_kpi_resource_format](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_kpi_resource_format.md)
 * [azure_link_resource_format](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_link_resource_format.md)
 * [azure_prediction_resource_format](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_prediction_resource_format.md)
 * [azure_profile_resource_format](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_profile_resource_format.md)
 * [azure_relationship_link_resource_format](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_relationship_link_resource_format.md)
 * [azure_relationship_resource_format](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_relationship_resource_format.md)
 * [azure_role_assignment_resource_format](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_role_assignment_resource_format.md)
 * [azure_view_resource_format](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_view_resource_format.md)
 
[customersubscription.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/azurestack/resource-manager/Microsoft.AzureStack/stable/2017-06-01/CustomerSubscription.json)
 * [azure_customer_subscription](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_customer_subscription.md)
 
[databox.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/databox/resource-manager/Microsoft.DataBox/stable/2018-01-01/databox.json)
 * [azure_job_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_job_resource.md)
 
[databricks.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/databricks/resource-manager/Microsoft.Databricks/stable/2018-04-01/databricks.json)
 * [azure_workspace](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_workspace.md)
 
[datacatalog.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/datacatalog/resource-manager/Microsoft.DataCatalog/stable/2016-03-30/datacatalog.json)
 * [azure_adc_catalog](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_adc_catalog.md)
 
[datafactory.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/datafactory/resource-manager/Microsoft.DataFactory/stable/2018-06-01/datafactory.json)
 * [azure_dataset_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_dataset_resource.md)
 * [azure_factory](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_factory.md)
 * [azure_integration_runtime_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_integration_runtime_resource.md)
 * [azure_linked_service_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_linked_service_resource.md)
 * [azure_pipeline_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_pipeline_resource.md)
 * [azure_trigger_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_trigger_resource.md)
 
[ddoscustompolicy.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/ddosCustomPolicy.json)
 * [azure_ddos_custom_policy](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_ddos_custom_policy.md)
 
[ddosprotectionplan.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/ddosProtectionPlan.json)
 * [azure_ddos_protection_plan](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_ddos_protection_plan.md)
 
[devspaces.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/devspaces/resource-manager/Microsoft.DevSpaces/stable/2019-04-01/devspaces.json)
 * [azure_controller](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_controller.md)
 
[disasterrecoveryconfigurations.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/sql/resource-manager/Microsoft.Sql/stable/2014-04-01/disasterRecoveryConfigurations.json)
 * [azure_disaster_recovery_configuration](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_disaster_recovery_configuration.md)
 
[disk.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/compute/resource-manager/Microsoft.Compute/stable/2019-03-01/disk.json)
 * [azure_disk](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_disk.md)
 * [azure_snapshot](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_snapshot.md)
 
[dns.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/dns/resource-manager/Microsoft.Network/stable/2018-05-01/dns.json)
 * [azure_record_set](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_record_set.md)
 * [azure_zone](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_zone.md)
 
[domains.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/web/resource-manager/Microsoft.DomainRegistration/stable/2018-02-01/Domains.json)
 * [azure_domain](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_domain.md)
 * [azure_domain_ownership_identifier](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_domain_ownership_identifier.md)
 
[domainservices.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/domainservices/resource-manager/Microsoft.AAD/stable/2017-06-01/domainservices.json)
 * [azure_domain_service](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_domain_service.md)
 * [azure_replica_set](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_replica_set.md)
 
[edgegateway.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/edgegateway/resource-manager/Microsoft.DataBoxEdge/stable/2019-03-01/edgegateway.json)
 * [azure_bandwidth_schedule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_bandwidth_schedule.md)
 * [azure_data_box_edge_device](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_data_box_edge_device.md)
 * [azure_order](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_order.md)
 * [azure_role](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_role.md)
 * [azure_share](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_share.md)
 * [azure_storage_account_credential](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_storage_account_credential.md)
 * [azure_trigger](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_trigger.md)
 * [azure_user](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_user.md)
 
[elasticpools.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/sql/resource-manager/Microsoft.Sql/stable/2014-04-01/elasticPools.json)
 * [azure_elastic_pool](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_elastic_pool.md)
 
[encoding.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/mediaservices/resource-manager/Microsoft.Media/stable/2018-07-01/Encoding.json)
 * [azure_job](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_job.md)
 * [azure_transform](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_transform.md)
 
[eventgrid.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/eventgrid/resource-manager/Microsoft.EventGrid/stable/2019-06-01/EventGrid.json)
 * [azure_domain](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_domain.md)
 * [azure_domain_topic](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_domain_topic.md)
 * [azure_event_subscription](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_event_subscription.md)
 * [azure_topic](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_topic.md)
 
[eventhub.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/eventhub/resource-manager/Microsoft.EventHub/stable/2017-04-01/EventHub.json)
 * [azure_arm_disaster_recovery](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_arm_disaster_recovery.md)
 * [azure_authorization_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_authorization_rule.md)
 * [azure_consumer_group](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_consumer_group.md)
 * [azure_eh_namespace](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_eh_namespace.md)
 * [azure_eventhub](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_eventhub.md)
 
[expressroutecircuit.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/expressRouteCircuit.json)
 * [azure_express_route_circuit](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_express_route_circuit.md)
 * [azure_express_route_circuit_authorization](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_express_route_circuit_authorization.md)
 * [azure_express_route_circuit_connection](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_express_route_circuit_connection.md)
 * [azure_express_route_circuit_peering](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_express_route_circuit_peering.md)
 
[expressroutecrossconnection.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/expressRouteCrossConnection.json)
 * [azure_express_route_cross_connection_peering](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_express_route_cross_connection_peering.md)
 
[expressroutegateway.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/expressRouteGateway.json)
 * [azure_express_route_connection](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_express_route_connection.md)
 * [azure_express_route_gateway](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_express_route_gateway.md)
 
[expressrouteport.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/expressRoutePort.json)
 * [azure_express_route_port](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_express_route_port.md)
 
[favorites_api.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/applicationinsights/resource-manager/Microsoft.Insights/stable/2015-05-01/favorites_API.json)
 * [azure_application_insights_component_favorite](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_application_insights_component_favorite.md)
 
[file.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/storage/resource-manager/Microsoft.Storage/stable/2019-04-01/file.json)
 * [azure_file_share](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_file_share.md)
 
[firewallpolicy.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/firewallPolicy.json)
 * [azure_firewall_policy](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_firewall_policy.md)
 * [azure_firewall_policy_rule_group](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_firewall_policy_rule_group.md)
 
[firewallrules.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/sql/resource-manager/Microsoft.Sql/stable/2014-04-01/firewallRules.json)
 * [azure_firewall_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_firewall_rule.md)
 
[frontdoor.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/frontdoor/resource-manager/Microsoft.Network/stable/2019-05-01/frontdoor.json)
 * [azure_backend_pool](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_backend_pool.md)
 * [azure_front_door](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_front_door.md)
 * [azure_frontend_endpoint](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_frontend_endpoint.md)
 * [azure_health_probe_settings_model](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_health_probe_settings_model.md)
 * [azure_load_balancing_settings_model](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_load_balancing_settings_model.md)
 * [azure_routing_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_routing_rule.md)
 
[functions.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/streamanalytics/resource-manager/Microsoft.StreamAnalytics/stable/2016-03-01/functions.json)
 * [azure_function](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_function.md)
 
[gallery.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/compute/resource-manager/Microsoft.Compute/stable/2019-07-01/gallery.json)
 * [azure_gallery](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_gallery.md)
 * [azure_gallery_application](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_gallery_application.md)
 * [azure_gallery_application_version](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_gallery_application_version.md)
 * [azure_gallery_image](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_gallery_image.md)
 * [azure_gallery_image_version](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_gallery_image_version.md)
 
[graphrbac.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/graphrbac/data-plane/Microsoft.GraphRbac/stable/1.6/graphrbac.json)
 * [azure_application](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_application.md)
 * [azure_service_principal](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_service_principal.md)
 * [azure_user](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_user.md)
 
[guestconfiguration.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/guestconfiguration/resource-manager/Microsoft.GuestConfiguration/stable/2018-11-20/guestconfiguration.json)
 * [azure_guest_configuration_assignment](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_guest_configuration_assignment.md)
 
[healthcare-apis.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/healthcareapis/resource-manager/Microsoft.HealthcareApis/stable/2019-09-16/healthcare-apis.json)
 * [azure_services_description](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_services_description.md)
 
[hybriddata.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/hybriddatamanager/resource-manager/Microsoft.HybridData/stable/2016-06-01/hybriddata.json)
 * [azure_data_manager](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_data_manager.md)
 * [azure_data_store](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_data_store.md)
 * [azure_job_definition](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_job_definition.md)
 
[inputs.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/streamanalytics/resource-manager/Microsoft.StreamAnalytics/stable/2016-03-01/inputs.json)
 * [azure_input](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_input.md)
 
[interfaceendpoint.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-02-01/interfaceEndpoint.json)
 * [azure_interface_endpoint](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_interface_endpoint.md)
 
[iotcentral.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/iotcentral/resource-manager/Microsoft.IoTCentral/stable/2018-09-01/iotcentral.json)
 * [azure_app](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_app.md)
 
[iotdps.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/deviceprovisioningservices/resource-manager/Microsoft.Devices/stable/2018-01-22/iotdps.json)
 * [azure_certificate_response](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_certificate_response.md)
 * [azure_provisioning_service_description](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_provisioning_service_description.md)
 
[iothub.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/iothub/resource-manager/Microsoft.Devices/stable/2018-04-01/iothub.json)
 * [azure_certificate_description](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_certificate_description.md)
 * [azure_event_hub_consumer_group_info](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_event_hub_consumer_group_info.md)
 * [azure_iot_hub_description](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_iot_hub_description.md)
 
[iotsecuritysolutions.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/security/resource-manager/Microsoft.Security/stable/2019-08-01/iotSecuritySolutions.json)
 * [azure_io_t_security_solution_model](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_io_t_security_solution_model.md)
 
[keyvault.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/keyvault/resource-manager/Microsoft.KeyVault/stable/2018-02-14/keyvault.json)
 * [azure_vault](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_vault.md)
 
[kusto.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/azure-kusto/resource-manager/Microsoft.Kusto/stable/2019-05-15/kusto.json)
 * [azure_cluster](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_cluster.md)
 * [azure_data_connection](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_data_connection.md)
 * [azure_database](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_database.md)
 
[links.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/resources/resource-manager/Microsoft.Resources/stable/2016-09-01/links.json)
 * [azure_resource_link](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_resource_link.md)
 
[loadbalancer.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/loadBalancer.json)
 * [azure_inbound_nat_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_inbound_nat_rule.md)
 * [azure_load_balancer](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_load_balancer.md)
 
[locks.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/resources/resource-manager/Microsoft.Authorization/stable/2016-09-01/locks.json)
 * [azure_management_lock_object](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_management_lock_object.md)
 
[logic.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/logic/resource-manager/Microsoft.Logic/stable/2016-06-01/logic.json)
 * [azure_assembly_definition](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_assembly_definition.md)
 * [azure_batch_configuration](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_batch_configuration.md)
 * [azure_integration_account](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_integration_account.md)
 * [azure_integration_account_agreement](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_integration_account_agreement.md)
 * [azure_integration_account_certificate](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_integration_account_certificate.md)
 * [azure_integration_account_map](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_integration_account_map.md)
 * [azure_integration_account_partner](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_integration_account_partner.md)
 * [azure_integration_account_rosetta_net_process_configuration](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_integration_account_rosetta_net_process_configuration.md)
 * [azure_integration_account_schema](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_integration_account_schema.md)
 * [azure_integration_account_session](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_integration_account_session.md)
 * [azure_workflow](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_workflow.md)
 
[logicappsmanagementclient.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/web/resource-manager/Microsoft.Web/stable/2016-06-01/logicAppsManagementClient.json)
 * [azure_api_connection_definition](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_api_connection_definition.md)
 * [azure_connection_gateway_definition](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_connection_gateway_definition.md)
 * [azure_custom_api_definition](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_custom_api_definition.md)
 
[logprofiles_api.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/monitor/resource-manager/Microsoft.Insights/stable/2016-03-01/logProfiles_API.json)
 * [azure_log_profile_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_log_profile_resource.md)
 
[machinelearningservices.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/machinelearningservices/resource-manager/Microsoft.MachineLearningServices/stable/2019-06-01/machineLearningServices.json)
 * [azure_compute_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_compute_resource.md)
 * [azure_workspace](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_workspace.md)
 
[managedapplications.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/resources/resource-manager/Microsoft.Solutions/stable/2018-06-01/managedapplications.json)
 * [azure_application](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_application.md)
 * [azure_application_definition](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_application_definition.md)
 
[managedclusters.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/containerservice/resource-manager/Microsoft.ContainerService/stable/2019-08-01/managedClusters.json)
 * [azure_agent_pool](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_agent_pool.md)
 * [azure_managed_cluster](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_managed_cluster.md)
 
[managedidentity.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/msi/resource-manager/Microsoft.ManagedIdentity/stable/2018-11-30/ManagedIdentity.json)
 * [azure_identity](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_identity.md)
 
[managedservices.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/managedservices/resource-manager/Microsoft.ManagedServices/stable/2019-06-01/managedservices.json)
 * [azure_registration_assignment](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_registration_assignment.md)
 * [azure_registration_definition](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_registration_definition.md)
 
[maps-management.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/maps/resource-manager/Microsoft.Maps/stable/2018-05-01/maps-management.json)
 * [azure_maps_account](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_maps_account.md)
 
[mariadb.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/mariadb/resource-manager/Microsoft.DBforMariaDB/stable/2018-06-01/mariadb.json)
 * [azure_database](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_database.md)
 * [azure_firewall_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_firewall_rule.md)
 * [azure_server](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_server.md)
 * [azure_virtual_network_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_network_rule.md)
 
[media.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/mediaservices/resource-manager/Microsoft.Media/stable/2015-10-01/media.json)
 * [azure_media_service](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_media_service.md)
 
[metricalert_api.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/monitor/resource-manager/Microsoft.Insights/stable/2018-03-01/metricAlert_API.json)
 * [azure_metric_alert_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_metric_alert_resource.md)
 
[migrate.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/migrate/resource-manager/Microsoft.Migrate/stable/2018-02-02/migrate.json)
 * [azure_assessment](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_assessment.md)
 * [azure_group](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_group.md)
 * [azure_project](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_project.md)
 
[ml.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/labservices/resource-manager/Microsoft.LabServices/stable/2018-10-15/ML.json)
 * [azure_environment](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_environment.md)
 * [azure_environment_setting](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_environment_setting.md)
 * [azure_gallery_image](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_gallery_image.md)
 * [azure_lab](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_lab.md)
 * [azure_lab_account](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_lab_account.md)
 * [azure_user](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_user.md)
 
[mysql.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/mysql/resource-manager/Microsoft.DBforMySQL/stable/2017-12-01/mysql.json)
 * [azure_database](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_database.md)
 * [azure_firewall_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_firewall_rule.md)
 * [azure_server](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_server.md)
 * [azure_virtual_network_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_network_rule.md)
 
[natgateway.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/natGateway.json)
 * [azure_nat_gateway](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_nat_gateway.md)
 
[networkinterface.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/networkInterface.json)
 * [azure_network_interface](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_network_interface.md)
 * [azure_network_interface_tap_configuration](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_network_interface_tap_configuration.md)
 
[networkprofile.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/networkProfile.json)
 * [azure_network_profile](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_network_profile.md)
 
[networksecuritygroup.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/networkSecurityGroup.json)
 * [azure_network_security_group](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_network_security_group.md)
 * [azure_security_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_security_rule.md)
 
[networkwatcher.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/networkWatcher.json)
 * [azure_connection_monitor_result](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_connection_monitor_result.md)
 * [azure_network_watcher](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_network_watcher.md)
 * [azure_packet_capture_result](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_packet_capture_result.md)
 
[notificationhubs.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/notificationhubs/resource-manager/Microsoft.NotificationHubs/stable/2017-04-01/notificationhubs.json)
 * [azure_namespace_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_namespace_resource.md)
 * [azure_notification_hub_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_notification_hub_resource.md)
 * [azure_shared_access_authorization_rule_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_shared_access_authorization_rule_resource.md)
 
[openshiftmanagedclusters.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/containerservice/resource-manager/Microsoft.ContainerService/stable/2019-04-30/openShiftManagedClusters.json)
 * [azure_open_shift_managed_cluster](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_open_shift_managed_cluster.md)
 
[operationalinsights.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/operationalinsights/resource-manager/Microsoft.OperationalInsights/stable/2015-03-20/OperationalInsights.json)
 * [azure_saved_search](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_saved_search.md)
 * [azure_storage_insight](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_storage_insight.md)
 
[outputs.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/streamanalytics/resource-manager/Microsoft.StreamAnalytics/stable/2016-03-01/outputs.json)
 * [azure_output](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_output.md)
 
[policy.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/resources/resource-manager/Microsoft.Authorization/stable/2016-04-01/policy.json)
 * [azure_policy_assignment](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_policy_assignment.md)
 * [azure_policy_definition](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_policy_definition.md)
 
[policyassignments.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/resources/resource-manager/Microsoft.Authorization/stable/2019-06-01/policyAssignments.json)
 * [azure_policy_assignment](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_policy_assignment.md)
 
[policydefinitions.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/resources/resource-manager/Microsoft.Authorization/stable/2019-06-01/policyDefinitions.json)
 * [azure_policy_definition](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_policy_definition.md)
 
[policysetdefinitions.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/resources/resource-manager/Microsoft.Authorization/stable/2019-06-01/policySetDefinitions.json)
 * [azure_policy_set_definition](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_policy_set_definition.md)
 
[postgresql.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/postgresql/resource-manager/Microsoft.DBforPostgreSQL/stable/2017-12-01/postgresql.json)
 * [azure_database](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_database.md)
 * [azure_firewall_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_firewall_rule.md)
 * [azure_server](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_server.md)
 * [azure_virtual_network_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_network_rule.md)
 
[powerbidedicated.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/powerbidedicated/resource-manager/Microsoft.PowerBIdedicated/stable/2017-10-01/powerbidedicated.json)
 * [azure_dedicated_capacity](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_dedicated_capacity.md)
 
[privatedns.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/privatedns/resource-manager/Microsoft.Network/stable/2018-09-01/privatedns.json)
 * [azure_private_zone](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_private_zone.md)
 * [azure_record_set](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_record_set.md)
 * [azure_virtual_network_link](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_network_link.md)
 
[privateendpoint.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/privateEndpoint.json)
 * [azure_private_endpoint](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_private_endpoint.md)
 
[privatelinkservice.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/privateLinkService.json)
 * [azure_private_link_service](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_private_link_service.md)
 
[publicipaddress.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/publicIpAddress.json)
 * [azure_public_ip_address](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_public_ip_address.md)
 
[publicipprefix.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/publicIpPrefix.json)
 * [azure_public_ip_prefix](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_public_ip_prefix.md)
 
[recoveryservicesbackup.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/recoveryservicesbackup/resource-manager/Microsoft.RecoveryServices/stable/2016-06-01/recoveryservicesbackup.json)
 * [azure_protection_policy_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_protection_policy_resource.md)
 
[redis.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/redis/resource-manager/Microsoft.Cache/stable/2018-03-01/redis.json)
 * [azure_redis_firewall_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_redis_firewall_rule.md)
 * [azure_redis_linked_server_with_properties](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_redis_linked_server_with_properties.md)
 * [azure_redis_patch_schedule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_redis_patch_schedule.md)
 * [azure_redis_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_redis_resource.md)
 
[registration.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/azurestack/resource-manager/Microsoft.AzureStack/stable/2017-06-01/Registration.json)
 * [azure_registration](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_registration.md)
 
[relay.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/relay/resource-manager/Microsoft.Relay/stable/2017-04-01/relay.json)
 * [azure_authorization_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_authorization_rule.md)
 * [azure_hybrid_connection](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_hybrid_connection.md)
 * [azure_relay_namespace](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_relay_namespace.md)
 * [azure_wcf_relay](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_wcf_relay.md)
 
[resources.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/resources/resource-manager/Microsoft.Resources/stable/2019-08-01/resources.json)
 * [azure_deployment_extended](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_deployment_extended.md)
 * [azure_generic_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_generic_resource.md)
 * [azure_resource_group](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_resource_group.md)
 * [azure_tag_details](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_tag_details.md)
 
[routefilter.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/routeFilter.json)
 * [azure_route_filter](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_route_filter.md)
 * [azure_route_filter_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_route_filter_rule.md)
 
[routetable.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/routeTable.json)
 * [azure_route](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_route.md)
 * [azure_route_table](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_route_table.md)
 
[scheduledqueryrule_api.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/monitor/resource-manager/Microsoft.Insights/stable/2018-04-16/scheduledQueryRule_API.json)
 * [azure_log_search_rule_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_log_search_rule_resource.md)
 
[search.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/search/resource-manager/Microsoft.Search/stable/2015-08-19/search.json)
 * [azure_query_key](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_query_key.md)
 * [azure_search_service](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_search_service.md)
 
[serverazureadadministrators.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/sql/resource-manager/Microsoft.Sql/stable/2014-04-01/serverAzureADAdministrators.json)
 * [azure_server_azure_ad_administrator](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_server_azure_ad_administrator.md)
 
[servercommunicationlinks.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/sql/resource-manager/Microsoft.Sql/stable/2014-04-01/serverCommunicationLinks.json)
 * [azure_server_communication_link](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_server_communication_link.md)
 
[servers.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/sql/resource-manager/Microsoft.Sql/stable/2014-04-01/servers.json)
 * [azure_server](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_server.md)
 
[service.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/recoveryservicessiterecovery/resource-manager/Microsoft.RecoveryServices/stable/2018-07-10/service.json)
 * [azure_fabric](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_fabric.md)
 * [azure_migration_item](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_migration_item.md)
 * [azure_network_mapping](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_network_mapping.md)
 * [azure_policy](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_policy.md)
 * [azure_protection_container_mapping](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_protection_container_mapping.md)
 * [azure_recovery_plan](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_recovery_plan.md)
 * [azure_recovery_services_provider](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_recovery_services_provider.md)
 * [azure_replication_protected_item](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_replication_protected_item.md)
 * [azure_storage_classification_mapping](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_storage_classification_mapping.md)
 * [azure_v_center](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_v_center.md)
 
[service.json(1)](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/web/resource-manager/Microsoft.Web/stable/2015-08-01/service.json)
 * [azure_certificate](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_certificate.md)
 * [azure_certificate_order](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_certificate_order.md)
 * [azure_certificate_order_certificate](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_certificate_order_certificate.md)
 * [azure_csr](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_csr.md)
 * [azure_deployment](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_deployment.md)
 * [azure_domain](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_domain.md)
 * [azure_host_name_binding](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_host_name_binding.md)
 * [azure_hosting_environment](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_hosting_environment.md)
 * [azure_relay_service_connection_entity](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_relay_service_connection_entity.md)
 * [azure_server_farm_with_rich_sku](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_server_farm_with_rich_sku.md)
 * [azure_site](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_site.md)
 * [azure_site_source_control](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_site_source_control.md)
 * [azure_vnet_info](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_vnet_info.md)
 * [azure_vnet_route](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_vnet_route.md)
 
[servicebus.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/servicebus/resource-manager/Microsoft.ServiceBus/stable/2017-04-01/servicebus.json)
 * [azure_arm_disaster_recovery](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_arm_disaster_recovery.md)
 * [azure_migration_config_properties](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_migration_config_properties.md)
 * [azure_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_rule.md)
 * [azure_sb_authorization_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_sb_authorization_rule.md)
 * [azure_sb_namespace](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_sb_namespace.md)
 * [azure_sb_queue](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_sb_queue.md)
 * [azure_sb_subscription](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_sb_subscription.md)
 * [azure_sb_topic](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_sb_topic.md)
 
[serviceendpointpolicy.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/serviceEndpointPolicy.json)
 * [azure_service_endpoint_policy](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_service_endpoint_policy.md)
 * [azure_service_endpoint_policy_definition](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_service_endpoint_policy_definition.md)
 
[signalr.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/signalr/resource-manager/Microsoft.SignalRService/stable/2018-10-01/signalr.json)
 * [azure_signal_r_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_signal_r_resource.md)
 
[smartdetectoralertrulesapi.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/alertsmanagement/resource-manager/Microsoft.AlertsManagement/stable/2019-06-01/SmartDetectorAlertRulesApi.json)
 * [azure_alert_rule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_alert_rule.md)
 
[storage.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/storage/resource-manager/Microsoft.Storage/stable/2019-04-01/storage.json)
 * [azure_management_policy](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_management_policy.md)
 * [azure_storage_account](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_storage_account.md)
 
[storageimportexport.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/storageimportexport/resource-manager/Microsoft.ImportExport/stable/2016-11-01/storageimportexport.json)
 * [azure_job_response](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_job_response.md)
 
[storagesync.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/storagesync/resource-manager/Microsoft.StorageSync/stable/2019-03-01/storagesync.json)
 * [azure_cloud_endpoint](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_cloud_endpoint.md)
 * [azure_registered_server](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_registered_server.md)
 * [azure_server_endpoint](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_server_endpoint.md)
 * [azure_storage_sync_service](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_storage_sync_service.md)
 * [azure_sync_group](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_sync_group.md)
 
[storsimple.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/storsimple8000series/resource-manager/Microsoft.StorSimple/stable/2017-06-01/storsimple.json)
 * [azure_access_control_record](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_access_control_record.md)
 * [azure_backup_policy](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_backup_policy.md)
 * [azure_backup_schedule](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_backup_schedule.md)
 * [azure_bandwidth_setting](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_bandwidth_setting.md)
 * [azure_manager](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_manager.md)
 * [azure_manager_extended_info](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_manager_extended_info.md)
 * [azure_storage_account_credential](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_storage_account_credential.md)
 * [azure_volume](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_volume.md)
 * [azure_volume_container](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_volume_container.md)
 
[streamingjobs.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/streamanalytics/resource-manager/Microsoft.StreamAnalytics/stable/2016-03-01/streamingjobs.json)
 * [azure_streaming_job](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_streaming_job.md)
 
[streamingpoliciesandstreaminglocators.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/mediaservices/resource-manager/Microsoft.Media/stable/2018-07-01/StreamingPoliciesAndStreamingLocators.json)
 * [azure_streaming_locator](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_streaming_locator.md)
 * [azure_streaming_policy](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_streaming_policy.md)
 
[streamingservice.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/mediaservices/resource-manager/Microsoft.Media/stable/2018-07-01/streamingservice.json)
 * [azure_live_event](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_live_event.md)
 * [azure_live_output](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_live_output.md)
 * [azure_streaming_endpoint](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_streaming_endpoint.md)
 
[timeseriesinsights.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/timeseriesinsights/resource-manager/Microsoft.TimeSeriesInsights/stable/2017-11-15/timeseriesinsights.json)
 * [azure_access_policy_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_access_policy_resource.md)
 * [azure_environment_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_environment_resource.md)
 * [azure_event_source_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_event_source_resource.md)
 * [azure_reference_data_set_resource](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_reference_data_set_resource.md)
 
[vaults.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/recoveryservices/resource-manager/Microsoft.RecoveryServices/stable/2016-06-01/vaults.json)
 * [azure_vault](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_vault.md)
 
[virtualnetwork.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/virtualNetwork.json)
 * [azure_subnet](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_subnet.md)
 * [azure_virtual_network](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_network.md)
 * [azure_virtual_network_peering](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_network_peering.md)
 
[virtualnetworkgateway.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/virtualNetworkGateway.json)
 * [azure_local_network_gateway](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_local_network_gateway.md)
 * [azure_virtual_network_gateway](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_network_gateway.md)
 * [azure_virtual_network_gateway_connection](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_network_gateway_connection.md)
 
[virtualnetworktap.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/virtualNetworkTap.json)
 * [azure_virtual_network_tap](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_network_tap.md)
 
[virtualwan.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/virtualWan.json)
 * [azure_p2_s_vpn_gateway](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_p2_s_vpn_gateway.md)
 * [azure_p2_s_vpn_server_configuration](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_p2_s_vpn_server_configuration.md)
 * [azure_virtual_hub](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_hub.md)
 * [azure_virtual_wan](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_wan.md)
 * [azure_vpn_connection](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_vpn_connection.md)
 * [azure_vpn_gateway](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_vpn_gateway.md)
 * [azure_vpn_site](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_vpn_site.md)
 
[vmwarecloudsimple.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/vmwarecloudsimple/resource-manager/Microsoft.VMwareCloudSimple/stable/2019-04-01/vmwarecloudsimple.json)
 * [azure_dedicated_cloud_node](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_dedicated_cloud_node.md)
 * [azure_dedicated_cloud_service](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_dedicated_cloud_service.md)
 * [azure_virtual_machine](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_virtual_machine.md)
 
[webapplicationfirewall.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/frontdoor/resource-manager/Microsoft.Network/stable/2019-03-01/webapplicationfirewall.json)
 * [azure_web_application_firewall_policy](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_web_application_firewall_policy.md)
 
[webapplicationfirewall.json(1)](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/network/resource-manager/Microsoft.Network/stable/2019-06-01/webapplicationfirewall.json)
 * [azure_web_application_firewall_policy](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_web_application_firewall_policy.md)
 
[webapps.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/web/resource-manager/Microsoft.Web/stable/2018-11-01/WebApps.json)
 * [azure_deployment](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_deployment.md)
 * [azure_function_envelope](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_function_envelope.md)
 * [azure_host_name_binding](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_host_name_binding.md)
 * [azure_premier_add_on](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_premier_add_on.md)
 * [azure_public_certificate](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_public_certificate.md)
 * [azure_relay_service_connection_entity](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_relay_service_connection_entity.md)
 * [azure_site_extension_info](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_site_extension_info.md)
 * [azure_site_source_control](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_site_source_control.md)
 * [azure_swift_virtual_network](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_swift_virtual_network.md)
 
[webservices.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/machinelearning/resource-manager/Microsoft.MachineLearning/stable/2017-01-01/webservices.json)
 * [azure_web_service](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_web_service.md)
 
[webtests_api.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/applicationinsights/resource-manager/Microsoft.Insights/stable/2015-05-01/webTests_API.json)
 * [azure_web_test](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_web_test.md)
 
[windowsiotservices.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/windowsiot/resource-manager/Microsoft.WindowsIoT/stable/2019-06-01/WindowsIotServices.json)
 * [azure_device_service](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_device_service.md)
 
[workbooks_api.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/applicationinsights/resource-manager/Microsoft.Insights/stable/2015-05-01/workbooks_API.json)
 * [azure_workbook](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_workbook.md)
 
[workspaces.json](https://github.com/Azure/azure-rest-api-specs/blob/2fbb5118cd34f412a51d9bc8a274224b216763cf/specification/machinelearning/resource-manager/Microsoft.MachineLearning/stable/2016-04-01/workspaces.json)
 * [azure_workspace](https://github.com/puppetlabs/puppetlabs-azure_arm/blob/master/azure_workspace.md)

