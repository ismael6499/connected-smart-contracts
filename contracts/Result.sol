// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

contract Result{
    uint256 public result;
    address public admin;
    uint256 public fee;

    modifier onlyAdmin() {
        if(tx.origin != admin) revert();
        _;
    }

    constructor(address _admin){
        admin = _admin;
        fee = 5;
    }

    function setResultado (uint256 _num) external{
        result = _num;
    }

    function setFee(uint256 _newFee) external onlyAdmin {
        fee = _newFee;
    }
    
    function setAdmin(address _newAdmin) external onlyAdmin {
        admin = _newAdmin;
    }
}