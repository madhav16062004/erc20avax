// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract Mtoken is ERC20 {

    address private owner;
    constructor() ERC20("Ether", "ETH") {
        owner = msg.sender;
       _mint(owner, 100 * 10**uint(decimals()));
    }

    modifier checkowner(){
        require(owner == msg.sender );
        _;
     }

    function minting (address receiver,uint256 amount) public payable checkowner {
        _mint(receiver,amount);
    }

    function burning(uint256 amount) public {
        _burn(msg.sender,amount);
    }

    function transfer (address receiver,uint256 amount) public virtual override returns (bool){
        require(receiver != address(0) , "address can't be zero");
        require(amount > 0,"amount can't be zero" );
        _transfer(msg.sender, receiver, amount);
            return true;
        


    }



}
