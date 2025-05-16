// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;


contract Paper {
    uint result;

    // simpan di memory untuk sementara
    function print() public pure returns (string memory) {
        return "Solidity Developer";
    }

    function add(uint a, uint b) public  {
        // tampung di local variable
        uint temp = a+b;
        result = temp;
    }

    function getResult() public  view  returns(uint)  {
        return result;
    }
}

// payable : memungkinkan smart contract kita menerima dana ether dari salah satu account
contract PayableContract {
    uint receivedAmount;

    function receivedEther() payable public  {
        receivedAmount = msg.value;
    }

    function getTotalAmount() public view  returns (uint)  {
        return receivedAmount;
    }

    // overload : nama function sama tapi parameters harus berbeda
    function add(uint a, uint b) public  pure returns (uint result)  {
        result = a+b;
    }

    function add(uint a, uint b, uint c) public  pure returns (uint result)  {
        result = a+b+c;
    }
}