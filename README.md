# ethereum-go docker

### Deployment ###
* git clone git@github.com:bobyeoh/ethereum-docker.git
* docker build -t ethereum-docker .
* docker run -it -p 30303:30303 -p 8545:8545 -v ${PWD}/blockdata:/root/.ethereum --name="ethereum-node" -d ethereum-docker --rpc --rpcaddr "0.0.0.0"

### Usage ###
Enter to JavaScript console 
* docker exec -it ethereum-node geth attach ipc:/root/.ethereum/geth.ipc