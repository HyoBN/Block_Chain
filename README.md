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

## 컨트랙트 테스트
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

**.abi**파일은 ABI(Application binary Interface)라는 일종의 인터페이스로, 컨트랙트의 템플릿 같은 개념이고 컨트랙트 사용자에게 어떤 메소드들을 사용할 수 있는지 알려주는 역할을 한다..

**이들은 컨트랙트와 상호작용하기 위해서 필요한 두 가지 요소이다.**




## 컨트랙트를 블록체인에 배포하기.

터미널 창에서,
```
node
Web3 = require('web3')
web3 = new Web3("http://localhost:8545")
bytecode = fs.readFileSync('./Voting_sol_Voting.bin').toString()
abi = fs.readFileSync('./Voting_sol_Voting.abi').toString()
abi = JSON.parse(fs.readFileSync('./Voting_sol_Voting.abi').toString())
```

-----------------------

가나슈  : 테스트 목적으로 PC에 설치하여 사용할 수 있는 간이 블록체인.  
 - 이더리움 기반 블록체인 app 개발 테스트에 사용할 수 있는 개인용(프라이빗) 블록체인이다.
 - 로컬에서 네트워크 연결없이 계약을 배포, 테스트 해볼 수 있다.

web3.js : 블록체인과 상호작용하는 라이브러리.

트러플(Truffle) : 이더리움 기반 dapp를 쉽게 개발할 수 있도록 도와주는 블록체인 프레임워크.  
 - 스마트 컨트랙트 컴파일, 배포, 관리, 테스트를 빠르고 쉽게 할 수 있다.