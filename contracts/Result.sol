// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

/// @title Result Storage
/// @author Agustin Acosta
/// @notice Stores calculation results and manages administrative settings
contract Result {
    
    error NotAuthorized(address caller);
    error InvalidAddress();

    uint256 public result;
    address public admin;
    uint256 public fee;

    event ResultUpdated(uint256 newValue);
    event FeeUpdated(uint256 newFee);
    event AdminUpdated(address newAdmin);

    modifier onlyAdmin() {
        // SECURITY FIX: Replaced tx.origin with msg.sender to prevent phishing
        if (msg.sender != admin) {
            revert NotAuthorized(msg.sender);
        }
        _;
    }

    constructor(address _admin) {
        if (_admin == address(0)) revert InvalidAddress();
        admin = _admin;
        fee = 5;
    }

    function setResultado(uint256 _num) external {
        result = _num;
        emit ResultUpdated(_num);
    }

    function setFee(uint256 _newFee) external onlyAdmin {
        fee = _newFee;
        emit FeeUpdated(_newFee);
    }
    
    function setAdmin(address _newAdmin) external onlyAdmin {
        if (_newAdmin == address(0)) revert InvalidAddress();
        admin = _newAdmin;
        emit AdminUpdated(_newAdmin);
    }
}