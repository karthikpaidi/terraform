## deploy GKE using the free google cloud account

## Install and configure GCloud

First, install the [Google Cloud CLI](https://cloud.google.com/sdk/docs/quickstarts) 
and initialize it.

```shell
$ gcloud init
```

Once you've initialized gcloud (signed in, selected project), add your account 
to the Application Default Credentials (ADC). This will allow Terraform to access
these credentials to provision resources on GCloud.

```shell
$ gcloud auth application-default login
```

# you can refer to this ansible play to install all the needed tools for this to work https://github.com/karthikpaidi/Ansible/tree/main/gketerraformpre

## Before starting please update your varibles in terrafrom.tfvars to pick proper project details

## How to run the terraform script

1) terrafrom init
2) terraform validate
3) terrafrom graph (optional if you want to get an graph of your infra)
4) terraform apply

this take serveral minutes so please give it some time 

## Note: make sure all the api endpoints are enabled like kubernetes engine API etc...


## post deployment run the below in your shell to add kube credentials to your kubeconfig

gcloud container clusters get-credentials $(terraform output kubernetes_cluster_name) --region $(terraform output region)

Note: The Kubernetes cluster name and region correspond to the output variables showed after the successful Terraform run

## if you decide to destroy the cluster and cleanup everything run destroy

terraform destroy