# 🔗 Connected Smart Contracts: Inter-Contract Communication

Continuing my **Master in Blockchain Development** at **Blockchain Accelerator Academy**, this project moves beyond single-contract logic to explore **Composability** and **Contract Interaction**.

As a **Java Software Engineer**, I am used to dependency injection and defining behavior via Interfaces to keep systems modular. This project applies those same principles to the **EVM**, demonstrating how one smart contract can drive the state of another using the `interface` keyword.

## 💡 Project Overview

The goal is to separate logic (Calculation) from state (Storage) using three distinct files:

1.  **`Result.sol` (The Database):** A simple contract that holds a state variable. It doesn't know *how* the result is calculated, it just stores it.
2.  **`IResult.sol` (The API):** An Interface definition located in `interfaces/`. It acts as the contract's ABI definition, allowing other contracts to know which functions are available without needing the implementation logic.
3.  **`Adder.sol` (The Controller):** This contract performs the addition logic. Instead of storing the result itself, it calls the `Result` contract via the `IResult` interface.

### 🔍 Key Technical Concepts:

* **Interfaces:** Just like in Java, defining an `interface` allows for decoupling. `Adder` doesn't need to import the full code of `Result`, only its signature.
* **External Calls:** Using `IResult(address).function()` to execute code on a different address within the same transaction.
* **Modularity:** This architecture mimics a microservices approach where specific contracts handle specific tasks (Logic vs. Storage).

## 🛠️ Stack & Tools

* **Language:** Solidity `^0.8.24`
* **Architecture:** Interface-based interaction.
* **Structure:**
    * `interfaces/IResult.sol`
    * `Adder.sol`
    * `Result.sol`

---

*This pattern is the fundamental building block of DeFi protocols, enabling "Money Legos" to interact seamlessly.*
