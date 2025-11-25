# 🔗 Connected Smart Contracts: Modular Architecture & Security

Continuing my **Master in Blockchain Development** at **Blockchain Accelerator Academy**, this project explores **Composability** and **Secure Contract Interaction** in the EVM.

As a **Java Software Engineer**, I am accustomed to building decoupled systems. In this project, I applied **Modular Architecture** principles to Solidity, creating a system where contracts interact via interfaces while adhering to strict security standards.

## 💡 Project Overview

The system creates a clear separation of concerns between Logic and Storage:

1.  **`Result.sol` (The Database):** Stores the state.
2.  **`Adder.sol` (The Controller):** Executes the addition logic and calls `Result` to save data.
3.  **`IResult.sol` (The Interface):** Defines the contract ABI, acting as the bridge.

### 🔍 Key Technical Features:

* **Security First (`msg.sender` vs `tx.origin`):**
    * Initially, I explored `tx.origin` for convenience in call chains, but after reviewing security implications (specifically phishing vectors), I refactored the architecture to rely strictly on **`msg.sender`**.
    * **The Lesson:** While `tx.origin` allows checking the original user, it makes the contract vulnerable if that user interacts with a malicious contract. Using `msg.sender` ensures we trust only the immediate caller, a fundamental principle of **Zero Trust** architecture.

* **Interface-Based Interaction:**
    * Usage of `IResult(address)` to decouple the implementation from the definition. The `Adder` contract interacts with `Result` purely through its interface, unaware of the underlying implementation details.

## 🛠️ Stack & Tools

* **Language:** Solidity `^0.8.24`
* **Architecture:** Modular (Logic/State separation)
* **Security:** Phishing protection via `msg.sender` authorization.
* **License:** LGPL-3.0-only

---

*This project demonstrates how to maintain modularity without compromising security.*
