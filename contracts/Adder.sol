// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

import "./interfaces/IResult.sol";

contract Adder{
    
    address resultAddress;

    constructor(address resultAddress_){
        resultAddress = resultAddress_;
    }

    function addition(uint256 num1_, uint256 num2_) external {
        uint256 result = num1_ + num2_;
        IResult(resultAddress).setResultado(result);
    }
}