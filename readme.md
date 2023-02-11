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