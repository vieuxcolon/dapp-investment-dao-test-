// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Treasury {
    address public governance;

    constructor(address _governance) {
        governance = _governance;
    }

    // Minimal deposit function
    receive() external payable {}

    function balance() public view returns (uint256) {
        return address(this).balance;
    }
}
