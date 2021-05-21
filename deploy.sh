docker build -t zhixiangteoh/multi-sg-client:latest -t zhixiangteoh/multi-sg-client:$SHA -f ./client/Dockerfile ./client
docker build -t zhixiangteoh/multi-sg-server:latest -t zhixiangteoh/multi-sg-server:$SHA -f ./server/Dockerfile ./server
docker build -t zhixiangteoh/multi-sg-worker:latest -t zhixiangteoh/multi-sg-worker:$SHA -f ./worker/Dockerfile ./worker
docker push zhixiangteoh/multi-sg-client:latest
docker push zhixiangteoh/multi-sg-client:$SHA
docker push zhixiangteoh/multi-sg-server:latest
docker push zhixiangteoh/multi-sg-server:$SHA
docker push zhixiangteoh/multi-sg-worker:latest
docker push zhixiangteoh/multi-sg-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=zhixiangteoh/multi-sg-client:$SHA
kubectl set image deployments/server-deployment server=zhixiangteoh/multi-sg-server:$SHA
kubectl set image deployments/worker-deployment worker=zhixiangteoh/multi-sg-worker:$SHA