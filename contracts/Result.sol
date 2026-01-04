// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

/// @title Result Storage
/// @author Agustin Acosta
/// @notice Persistence layer responsible for holding state
contract Result {
    
    // Custom Error para ahorrar gas (Senior approach)
    error NotAuthorizedLogic();

    uint256 public resultado;
    address public immutable logicContract;

    /// @notice Sets the immutable logic contract address allowed to write state
    /// @param _logicContract The address of the Adder contract
    constructor(address _logicContract) {
        logicContract = _logicContract;
    }

    /// @notice Updates the state. Protected by strict access control.
    /// @param _num The new result to store
    function setResultado(uint256 _num) external {
        // Zero Trust Security: Only the specific logic contract can write here
        if (msg.sender != logicContract) {
            revert NotAuthorizedLogic();
        }
        resultado = _num;
    }
}
