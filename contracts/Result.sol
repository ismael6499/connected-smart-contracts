// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

contract Result{
    uint256 public result;

    function setResultado (uint256 num_) external{
        result = num_;
    }
}