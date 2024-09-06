// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


contract Premint {

    mapping (uint => address) applicants;
    mapping (address => bool) applied;
    uint count = 0;
    uint collected_total = 0;
    
    // apply for an early adopter pass
    function apply_for_pass() public payable {
        require (applied[msg.sender] == false, "you have already applied");
        require (msg.value >= 0.01 ether, "the deposit must be at least 0.01 ether");
        require (count < 1000);
        applied[msg.sender] = true;
        applicants[count + 1] = msg.sender;
        count = count + 1;
        collected_total = collected_total + msg.value; 
    }


    // show total collection as of now
    function collection() public view returns (uint256){
        return collected_total;
    }
}
