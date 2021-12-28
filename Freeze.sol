pragma solidity ^0.7.0;

import "./Ownable.sol";
contract Freeze is Ownable{

    mapping (address => bool) public freezes;

    function freezeOf(address account) public view returns (bool) {
        return freezes[account];
    }

    function freeze(address account)  public onlyOwner {
        require(account != address(0), "ERC20: freeze account the zero address");

        freezes[account] = true;
    }


    function unfreeze(address account)  public onlyOwner {
        require(account != address(0), "ERC20: freeze account the zero address");

        freezes[account] = false;
    }
}
