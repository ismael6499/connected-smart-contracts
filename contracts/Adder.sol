// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

import "./interfaces/IResult.sol";

contract Adder{
    
    address public resultAddress;

    constructor(address _resultAddress){
        resultAddress = _resultAddress;
    }

    function addition(uint256 _num1, uint256 _num2) external {
        uint256 result = _num1 + _num2;
        IResult(resultAddress).setResultado(result);
    }

    function setFee(uint256 _newFee) external  {
        IResult(resultAddress).setFee(_newFee);
    }
}