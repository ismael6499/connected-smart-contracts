# 🧩 Modular Contract Architecture: Logic & Storage Separation

![Solidity](https://img.shields.io/badge/Solidity-0.8.24-363636?style=flat-square&logo=solidity)
![Pattern](https://img.shields.io/badge/Pattern-Separation_of_Concerns-green?style=flat-square)
![License](https://img.shields.io/badge/License-LGPL_3.0-blue?style=flat-square)

A reference implementation of **composable smart contract architecture**, focusing on the strict decoupling of Business Logic from Persistence Layers.

This project addresses the immutability constraints of the EVM by implementing a **Hub-and-Spoke** model. By isolating state (`Result.sol`) from execution (`Adder.sol`), the system allows for logic upgrades without state migration, serving as a foundational primitive for Proxy patterns and Diamond Standards (EIP-2535).

## 🏗 Architecture & Design Decisions

### 1. Separation of Concerns (SoC)
- **Decoupled State Management:**
  - **Logic Layer (`Adder`):** Stateless controller responsible for arithmetic execution and input validation.
  - **Persistence Layer (`Result`):** Pure storage contract responsible for holding state.
  - **Benefit:** This separation reduces the risk of storage collision and simplifies unit testing by allowing logic components to be tested in isolation with mocked storage.

### 2. Inter-Contract Security (Zero Trust)
- **Authentication via `msg.sender`:**
  - The architecture explicitly rejects `tx.origin` for authorization to mitigate **Phishing vulnerabilities** (CWE-115).
  - **Caller Verification:** The Storage contract implements a strict allowlist mechanism, only accepting state-changing calls (`setResultado`) from the authorized Logic contract address (`msg.sender`), effectively creating a permissioned call chain.

### 3. Interface-Driven Design
- **Dependency Inversion:** The Logic contract interacts with Storage purely through the `IResult` interface (ABI), ensuring that the implementation details of the storage layer remain abstract. This adheres to the **Dependency Inversion Principle** (SOLID), facilitating hot-swapping of storage implementations if necessary.

## 🛠 Tech Stack

* **Core:** Solidity `^0.8.24`
* **Architecture:** Modular (Logic/Storage Split)
* **Security:** Role-Based Access Control (RBAC)

## 📝 Contract Interface

The logic layer interacts with persistence via strict ABI definitions:

```solidity
// Interface abstraction for the storage layer
interface IResult {
    function setResultado(uint256 _num) external;
}

// Interaction in the Logic Layer
function addition(uint256 _num1, uint256 _num2) external {
    uint256 result = _num1 + _num2;
    // External call via interface
    IResult(resultAddress).setResultado(result);
}
```

---
*Reference implementation for decoupled EVM system design.*
