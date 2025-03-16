1. Clone this repo [Youtube-Clone-application](https://github.com/piyushsachdeva/Youtube_Clone) in your local system
2. Create a Remote Repo in Azure DevOps Repos and Push the Code to Remote Repo
3. Manually create a storage Container Account (Blob) to store the terraform's State file [Refer Doc: Using Remote Storage Account for State file](https://dedsec-1.gitbook.io/dedsec_hacks/devops/iac/terraform-with-azure/creating-resources/using-tfstate-from-remote-backend)
4. Clone my repo and in the Youtube_Clone_infra->Providers.tf File change the parameters of Remote Backend Storage A/C to your Scenario
5. Run the following commands inside of "Youtube-Clone-infra" Directory to provision the Infrastructure.
```sh
git clone https://github.com/Le0-haK/DevOps-Projects.git
cd Youtube_Clone_infra
terraform init --upgrade
terrafrom apply -var-file=tfvars\dev.tfvars -auto-approve
```
6. Create a App Registering which our Azure DevOps Pipeline can used as an Service Principal to authenticate and work with Azure, check this to learn how to [create App Registration (or Service Principal)](https://dedsec-1.gitbook.io/dedsec_hacks/devops/certification/azure-developer-associate-az-204/app-registration#what-is-app-registration-in-azure)
7. Generate Client Secret in your App Registration
8. Assign this Service principal atleast Contributor Role in your Subscription
9. Using the Service Principal, Create a Service Connection in Azure DevOps, check this to learn how to [create a service connection](https://dedsec-1.gitbook.io/dedsec_hacks/devops/certification/azure-devops-engineer-expert-az-400/pipelines/service-connection-and-app-registration-for-azure-devops#configure-a-new-azure-service-connection)
10. Create your Starter pipeline in "Azure DevOps" and paste my "azure-pipelines.yml" code
11. Run the CI/CD Pipeline to deploy the App
