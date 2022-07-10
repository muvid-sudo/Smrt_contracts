//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


contract TEST_WALLET
{
    address public owner;
    mapping (address => uint256) private summary;

    
     constructor() {
        owner = msg.sender;
    }
    
    
    function getSummary() public view returns(uint256)
    {
        return summary[msg.sender];
    }

    function increaseSummary() public payable
    {
        
        {
        
            summary[msg.sender] += msg.value;
        }
    }

    function decreaseAmount() public payable
    {
        if (summary[msg.sender] - msg.value >= 0)
        {
            summary[msg.sender] -= msg.value;
            payable(msg.sender).transfer(msg.value);
        }
        else
        {
            revert("No founds");
        }
    }
}
