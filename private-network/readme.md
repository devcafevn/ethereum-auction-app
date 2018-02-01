# Setup Ethereum Private Network

## Install geth

https://geth.ethereum.org/downloads

Create a local folder. Let say C:\private-eth. Copy the genesis.json to that folder. Then open PowerShell Windows in that folder. Type

> geth init .\genegis.json --datadir chaindata

Then start geth

> geth --datadir .\chaindata --nodiscover --rpc --rpccorsdomain "\*" --ws --wsorigins "\*" --networkid 15

Open another PowserShell Windows
> get attach

In the console
> personal.newAccount();

> miner.setEtherbase(eth.accounts[0]);

> miner.start(1);

## Install Wallet

https://github.com/ethereum/mist/releases
