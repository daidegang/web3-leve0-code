//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Error {
    function testRequire(uint256 _i) public pure {
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint256 _x)public pure {
       if(_x <= 10){
        revert("Input must be greater than 10");
       }
    }

    uint256 public num;
    function testAssert() public view {
        assert(num == 0);
    }

    //customer error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmout);

    function testCustomerError(uint256 _withdrawAmout) public view {
        uint256 bal = address(this).balance;
        if (bal < _withdrawAmout) {
            revert InsufficientBalance({
                balance: bal,
                withdrawAmout : _withdrawAmout
            });
        }
    }
}