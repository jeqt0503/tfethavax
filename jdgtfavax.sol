// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract jeToken is ERC20, Ownable {
    constructor(uint256 iSupply) ERC20("ERC20", "ETH") {
        _mint(msg.sender, iSupply);
    }

    function burn(uint256 amount) 
    public {
        require(amount > 15, "Must be greater than 15");
        require(amount <= balanceOf(msg.sender), "Insufficient balance");
        _burn(msg.sender, amount);
    }

    function mint(uint256 amount) 
    public onlyOwner {
        _mint(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), to, amount);    
        return true;
    }
}
