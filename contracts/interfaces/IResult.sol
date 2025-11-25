// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.24;

/// @title IResult Interface
/// @notice Interface to interact with the Result storage contract
interface IResult {
    function setResultado(uint256 _num) external;
    function setFee(uint256 _newFee) external;
    function setAdmin(address _newAdmin) external;
}