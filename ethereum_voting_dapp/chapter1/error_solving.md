```
ParserError: Source file requires different compiler version (current compiler is 0.8.3+commit.8d00100c.Emscrip
ten.clang) - note that nightly builds are considered to be strictly less than the released version
 --> Voting.sol:1:1:
  |
1 | pragma solidity ^0.4.23;
  | ^^^^^^^^^^^^^^^^^^^^^^^^
```
  
#### 에러 해결 - pragma solidity >=0.4.23; 으로 수정하면 버전 에러는 더 이상 안 뜸.

------------------------------------
```
TypeError: Data location must be "storage" or "memory" for constructor parameter, but none was given.
  --> Voting.sol:12:17:
   |
12 |     constructor(bytes32[] candidateNames) public {// why bytes32 ? : solidity does not support string yet.
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^

```

#### Solidity에서 구조체, 배열 또는 매핑 유형의 모든 변수에 대한 명시적 데이터 위치는 이제 필수라 하여 bytes32[] memory candidate로 수정.  -> 에러 뜸. 

-----------------------------------

### memory, storage 적어야 하는 상황, 이유 정확하게 찾아본 후에 적용하기. ( Solidity 컴파일러 버전 차이로 인한 에러일 가능성이 높음)

-----------------------------------------
### 에러 해결 완료.

Solidity 버전으로 인한 문제는 아니였고, memory storage 명시 문제였다. 그래서 확실하게 찾아보았다.


#### Storage / Memory 

> 솔리디티에는 storage와 memory라는 변수를 저장할 수 있는 두가지 공간이 있다.

> **Storage**는 블록체인 상에 영구적으로 저장되는 변수를 의미하고, 

> **Memory**는 임시적으로 저장되는 변수이며 컨트랙트 함수에 대한 외부 호출들이 일어나는 사이에 지워진다.

> 솔리디티는 컨트랙트 내의 상태 변수(함수 외부에 선언된 변수)는 storage로 초기화 해주고

> 함수 내에 선언된 변수는 memory로 자동적으로 초기화해준다.

#### Voting.sol에서 에러가 났던 변수(bytes32[] candidateNames)는 constructor 내에서만 임시적으로 사용되기 때문에 **Memory**에 저장해야했다.
