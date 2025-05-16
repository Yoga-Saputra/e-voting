// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract VariableTypes {
    // state variable
    uint sum;

    // local variable
    function add(uint num1, uint num2) public {
        // local variable
        uint temp = num1 + num2;

        sum = temp;
    }

    function getResult() public  view  returns (uint) {
        return  sum;
    }
}

contract Types {
    bool public  valid = true;
    int32 public A = -30;
    uint public  B = 1;

    uint32 public ui_data = 16_05_2024;

    uint8 result;
    function add() public  {
        // result = 3/5;
    }

    bytes1 public  angka = "A";
    string public  kalimat = "ini adalah kalimat string";

}

contract EnumJobs{
    // local variable
    enum Jobs {Programmer, UiUx, DB}

    function getEnum()public pure  returns (Jobs) {
        return Jobs.Programmer;
    }
}