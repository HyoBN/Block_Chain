# Block_Chain

solidity_practice folder : only practice solidity at Remix ide.

ethereum_voting_dapp : 간단한 Dapp 실전 개발 (Goorm IDE에서!)

--------------

## 환경 구축
```
curl -sL https://deb.nodesource.com/setup_7.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs
mkdir -p ethereum_voting_dapp/chapter1
cd ethereum_voting_dapp/chapter1
npm install ganache-cli web3@0.20.1 solc

node_modules/.bin/ganache-cli // ganache 실행.
```
Available Accounts 와 Private Keys가 출력되고 포트 번호 나옴.ex) Listening on 127.0.0.1:8545

--------------

## 간단한 테스트
새로운 터미널 창을 열어서,
```
cd ethereum_voting_dapp/chapter1
node
 Web3 = require('web3')
 web3= new Web3(new Web3.providers.HttpProvider("http://localhost:127.0.0.1:8545"))
 
 web3.eth.accounts //계정 리스트 출력.
 web3.eth.getBalance('0x23816943921bc5e80496546524d3a0701e632760') // 해당 계정의 잔고 출력.
 web3.eth.getBalance('0x23816943921bc5e80496546524d3a0701e632760').toNumber() // wei 단위 값만 출력.
 web3.fromWei('100000000000000000000','ether') // ether 단위로 출력.
```
