# 1) building private GKE cluster using GCP infrastructure
### first we build the network and the cluster using terraform
```bash
terraform init
terraform apply
```
----

### 2) Building the docker image Push it to gcr
1. the python app image
```bash
docker build -t gcp-python .
docker tag gcp-python gcr.io/zoz-project-375711/python-app
docker push gcr.io/zoz-project-375711/python-app
```
2. the redis image 
```
docker pull redis
docker tag redis gcr.io/zoz-project-375711/redis-gcr
docker push gcr.io/zoz-project-375711/redis-gcr
```
### 3) Running the kubernetes files form the private-management-vm
we run the files in the kubernetes-yml-files dir

1.to access using the **load balancer**
```bash
kubectl apply -f redis-deployment.yml
kubectl apply -f redis-srvc.yml
kubectl apply -f python-app.yml
kubectl apply -f loadBanlancer.yml
```
2.to access using **ingress**
```bash
kubectl delete service loadbalancer
kubectl apply -f nodePort.yml 
kubectl apply -f ingress.yml
```     
