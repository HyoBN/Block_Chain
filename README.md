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
#### ganache 실행 결과.
Available Accounts 와 Private Keys가 출력되고 포트 번호 나옴.
ex) 
```
Listening on 127.0.0.1:8545
```
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


## Compile.
터미널 창에서,
```
node_modules/.bin/solcjs --bin --abi Voting.sol
```
입력하면 동일 디렉토리에 .bin , .abi 파일이 생성됨.

**.bin**파일은 바이트코드가 저장되어 있으며 이 바이트코드는 블록체인에 실제로 배포되는 코드이다.
**.abi**파일은 ABI(Application binary Interface)라는 일종의 인터페이스로, 컨트랙트의 템플릿 같은 개념이고 컨트랙트 사용자에게 어떤 메소드들을 사용할 수 있는지 알려주는 역할을 한다.
**이들은 컨트랙트와 상호작용하기 위해서 필요한 두 가지 요소이다.**
