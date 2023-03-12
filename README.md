# Docker-KubeFlow

## Running KubeFlow in a DevContainer

Kubeflow doc's for installing Kind:
https://www.kubeflow.org/docs/components/pipelines/v1/installation/localcluster-deployment/


### 1. DevContainer Setup Instructions

All of the following is "for free" because this repository already has all of these added to it:

1. visual studio code
2. command palette
3. DevContainers: Create new Dev Container -> select "Kubernetes - MiniKube-in-Docker"
4. Checked all of the following:
- Git (from source) devcontainers
- Git Large File Support (LFS) devcontainers
- Go devcontainers
- Kind mpriscella
- Kubectl, Helm, and Minikube devcontainers
- Python devcontainers


## 2. Create Kubernetes Cluster Using Kind 

Open Terminal

1. Run the command:

```
kind create cluster
```

You should get the following output:

```
Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.25.3) 🖼 
 ✓ Preparing nodes 📦  
 ✓ Writing configuration 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Have a nice day! 👋
```


## 3. Deploy Kubeflow Pipeline

You can now move to this part of the Kubeflow documentation:

https://www.kubeflow.org/docs/components/pipelines/v1/installation/localcluster-deployment/#deploying-kubeflow-pipelines

You can just run the script:

scripts/deployKubeflowPipeline.sh

which should output the following:

```
namespace/kubeflow created
customresourcedefinition.apiextensions.k8s.io/applications.app.k8s.io created
customresourcedefinition.apiextensions.k8s.io/clusterworkflowtemplates.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/cronworkflows.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/scheduledworkflows.kubeflow.org created
customresourcedefinition.apiextensions.k8s.io/viewers.kubeflow.org created
customresourcedefinition.apiextensions.k8s.io/workfloweventbindings.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/workflows.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/workflowtaskresults.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/workflowtasksets.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/workflowtemplates.argoproj.io created
serviceaccount/kubeflow-pipelines-cache-deployer-sa created
clusterrole.rbac.authorization.k8s.io/kubeflow-pipelines-cache-deployer-clusterrole created
clusterrolebinding.rbac.authorization.k8s.io/kubeflow-pipelines-cache-deployer-clusterrolebinding created
customresourcedefinition.apiextensions.k8s.io/applications.app.k8s.io condition met
I0311 22:48:46.546514    7582 log.go:198] well-defined vars that were never replaced: kfp-app-version,kfp-app-name
serviceaccount/argo created
serviceaccount/kubeflow-pipelines-cache created
serviceaccount/kubeflow-pipelines-container-builder created
serviceaccount/kubeflow-pipelines-metadata-writer created
serviceaccount/kubeflow-pipelines-viewer created
serviceaccount/metadata-grpc-server created
serviceaccount/ml-pipeline created
serviceaccount/ml-pipeline-persistenceagent created
serviceaccount/ml-pipeline-scheduledworkflow created
serviceaccount/ml-pipeline-ui created
serviceaccount/ml-pipeline-viewer-crd-service-account created
serviceaccount/ml-pipeline-visualizationserver created
serviceaccount/mysql created
serviceaccount/pipeline-runner created
role.rbac.authorization.k8s.io/argo-role created
role.rbac.authorization.k8s.io/kubeflow-pipelines-cache-deployer-role created
role.rbac.authorization.k8s.io/kubeflow-pipelines-cache-role created
role.rbac.authorization.k8s.io/kubeflow-pipelines-metadata-writer-role created
role.rbac.authorization.k8s.io/ml-pipeline created
role.rbac.authorization.k8s.io/ml-pipeline-persistenceagent-role created
role.rbac.authorization.k8s.io/ml-pipeline-scheduledworkflow-role created
role.rbac.authorization.k8s.io/ml-pipeline-ui created
role.rbac.authorization.k8s.io/ml-pipeline-viewer-controller-role created
role.rbac.authorization.k8s.io/pipeline-runner created
rolebinding.rbac.authorization.k8s.io/argo-binding created
rolebinding.rbac.authorization.k8s.io/kubeflow-pipelines-cache-binding created
rolebinding.rbac.authorization.k8s.io/kubeflow-pipelines-cache-deployer-rolebinding created
rolebinding.rbac.authorization.k8s.io/kubeflow-pipelines-metadata-writer-binding created
rolebinding.rbac.authorization.k8s.io/ml-pipeline created
rolebinding.rbac.authorization.k8s.io/ml-pipeline-persistenceagent-binding created
rolebinding.rbac.authorization.k8s.io/ml-pipeline-scheduledworkflow-binding created
rolebinding.rbac.authorization.k8s.io/ml-pipeline-ui created
rolebinding.rbac.authorization.k8s.io/ml-pipeline-viewer-crd-binding created
rolebinding.rbac.authorization.k8s.io/pipeline-runner-binding created
configmap/kfp-launcher created
configmap/metadata-grpc-configmap created
configmap/ml-pipeline-ui-configmap created
configmap/pipeline-install-config created
configmap/workflow-controller-configmap created
secret/mlpipeline-minio-artifact created
secret/mysql-secret created
service/cache-server created
service/metadata-envoy-service created
service/metadata-grpc-service created
service/minio-service created
service/ml-pipeline created
service/ml-pipeline-ui created
service/ml-pipeline-visualizationserver created
service/mysql created
service/workflow-controller-metrics created
priorityclass.scheduling.k8s.io/workflow-controller created
persistentvolumeclaim/minio-pvc created
persistentvolumeclaim/mysql-pv-claim created
deployment.apps/cache-deployer-deployment created
deployment.apps/cache-server created
deployment.apps/metadata-envoy-deployment created
deployment.apps/metadata-grpc-deployment created
deployment.apps/metadata-writer created
deployment.apps/minio created
deployment.apps/ml-pipeline created
deployment.apps/ml-pipeline-persistenceagent created
deployment.apps/ml-pipeline-scheduledworkflow created
deployment.apps/ml-pipeline-ui created
deployment.apps/ml-pipeline-viewer-crd created
deployment.apps/ml-pipeline-visualizationserver created
deployment.apps/mysql created
deployment.apps/workflow-controller created
```

## 4. Check Kubeflow Pipelines UI

./scripts/kubectlForwardPort.sh

which should output:

```
Forwarding from 127.0.0.1:8080 -> 3000
```

and if you navigate a browser here:
http://localhost:8080/

you should see the Kubeflow Pipelines UI

## Google Cloud SDK

When you're doing a "local deployment" (using something like "kind" or "minikube") - you shouldn't need Google Cloud SDK installed.

Although not specified in the instructions - if you attempt to run a pipeline without Google Cloud SDK installed - the pipeline will "stall" - in the test I did it was on the "Preprocess & Transform" stage.  When you run the following:

```
kfp diagnose_me
```

You'll see:

```
Google Cloud SDK is not installed, gcloud, gsutil and kubectl are required for this app to run. Please follow instructions at https://cloud.google.com/sdk/install to install the SDK.
```

## Create Pipeline

Sync to this repository (git clone):

https://github.com/kubeflow/pipelines

### Core Sample (sequential)

Navigate to this directory:

```
kubeflow/pipelines
```

and run:

```
dsl-compile --py samples/core/sequential/sequential.py --output samples/core/sequential/sequential.tar.gz
```

### Pytorch

After you have cloned "kubeflow/pipelines" - navigate to this directory:

```
kubeflow/pipelines/samples/contrib/pytorch-samples
```

you can either run this script:

```
./install-dependencies.sh 
```

or if you're using pip3 - then do this:

```
pip3 install -r requirements.txt
```

Then run this:

```
python3 utils/generate_templates.py cifar10/template_mapping.json
```

The above generates the yaml files

Now run

```
pip3 install kfp
```

Then run either

```
python3 cifar10/pipeline.py
```

or

```
python3 bert/pipeline.py
```

Despite the instructions in the pytorch samples - it seems that you need to generate a compressed archive as mentioned here:

https://www.kubeflow.org/docs/components/pipelines/v1/tutorials/build-pipeline/

So run

```
dsl-compile --py ./cifar10/pipeline.py --output ./test.tar.gz
```

## General Trouble-Shooting

### Port Connection/Forwarding Not Working

If you get an error like the following:

```
E0312 21:41:46.168970   20897 memcache.go:238] couldn't get current server API group list: Get "http://localhost:8080/api?timeout=32s": dial tcp 127.0.0.1:8080: connect: connection refused
The connection to the server localhost:8080 was refused - did you specify the right host or port?
```

Try blowing away the cluster created by kind - i.e.:

```
kind delete cluster
```

which should output:

```
Deleting cluster "kind" ...
```

Then recreate it using the "create" command.


### Random Python Troubleshooting

You'll need the kubeflow pipeline package:

```
pip install kfp
```

to be honest - you can just save yourself time by running the following (from the directory: "python/pytorch-samples/requirements.txt"):

```
pip install -r requirements.txt
```

Then if you get this error:

```
  File "/workspaces/docker-kubeflow2/python/pytorch-samples/utils/generate_templates.py", line 43, in get_templates_list
    assert os.path.exists(TEMPLATE_PATH)
```

try this:

```
pip install components
pip install pytorch-kfp-components
./install-dependencies.sh
```
