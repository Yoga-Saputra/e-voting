// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract basicContract {
    uint storedData;

    // melakukan set data
    function set(uint x) public {
        storedData= x;
    }

    // get data
    function get() public  view  returns (uint){
        return  storedData;
    }
}