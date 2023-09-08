# Drone Insurance Smart Contract

## 환경
```
Truffle v5.11.0 (core: 5.11.0)
Ganache v7.9.0
Solidity - 0.8.13 (solc-js)
Node v18.16.1
Web3.js v1.10.0
```

## 실행
```bash
개발 환경
truffle migrate --network development
테스트넷 환경
truffle migrate --network testnet

// --compile-all : 모든 소스코드 강제 재컴파일
// --reset : migrations 내의 .sol 파일 모두 실행
truffle migrate --compile-all --reset
```

## 테스트
```bash
truffle test
```

## ETC
```bash
// 콘솔
truffle console --network development
```
