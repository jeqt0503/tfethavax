// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract jeToken is ERC20, Ownable {
    uint256 private constant MINIMUM_BURN_AMOUNT = 15;

    event TokensBurned(address indexed burner, uint256 amount);

    constructor(address initialOwner, uint256 initialSupply) ERC20("jeToken", "JET") Ownable() {
        _mint(initialOwner, initialSupply);
    }

    function burn(uint256 amount) external {
        _burnLogic(msg.sender, amount);
    }


    function mint(address account, uint256 amount) external onlyOwner {
        _mint(account, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }

    function _burnLogic(address account, uint256 amount) internal {
        require(amount >= MINIMUM_BURN_AMOUNT, "Amount must be greater than or equal to 15");
        require(amount <= balanceOf(account), "Insufficient balance");

        _burn(account, amount);
        emit TokensBurned(account, amount);
    }
}
