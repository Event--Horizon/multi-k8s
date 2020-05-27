docker build -t eventh0riz0n/multi-client:latest -t eventh0riz0n/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t eventh0riz0n/multi-server:latest -t eventh0riz0n/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t eventh0riz0n/multi-worker:latest -t eventh0riz0n/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push eventh0riz0n/multi-client:latest
docker push eventh0riz0n/multi-client:$SHA
docker push eventh0riz0n/multi-server:latest
docker push eventh0riz0n/multi-server:$SHA
docker push eventh0riz0n/multi-workers:latest
docker push eventh0riz0n/multi-workers:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployments server=eventh0riz0n/multi-server:$SHA
kubectl set image deployments/client-deployments client=eventh0riz0n/multi-client:$SHA
kubectl set image deployments/worker-deployments worker=eventh0riz0n/multi-worker:$SHA