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