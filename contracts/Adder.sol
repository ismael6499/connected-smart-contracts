// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

import "./interfaces/IResult.sol";

/// @title Adder Logic
/// @author Agustin Acosta
/// @notice Performs addition and updates the Result contract
contract Adder {
    
    error InvalidAddress();

    address public resultAddress;

    constructor(address _resultAddress) {
        if (_resultAddress == address(0)) revert InvalidAddress();
        resultAddress = _resultAddress;
    }

    function addition(uint256 _num1, uint256 _num2) external {
        uint256 result = _num1 + _num2;
        // Interaction with external contract
        IResult(resultAddress).setResultado(result);
    }

    // NOTE: In a secure architecture (using msg.sender in Result), 
    // this function will revert unless this Adder contract is the Admin of Result.
    // Admin actions should typically be called directly on the target contract.
    function setFee(uint256 _newFee) external {
        IResult(resultAddress).setFee(_newFee);
    }
}