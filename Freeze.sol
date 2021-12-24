pragma solidity ^0.7.0;

import "./Ownable.sol";
contract Freeze is Ownable{

    mapping (address => bool) public _freezes;

    function freezeOf(address account) public view returns (bool) {
        return _freezes[account];
    }

    function _freeze(address account)  public onlyOwner {
        require(account != address(0), "ERC20: freeze account the zero address");

        _freezes[account] = true;
    }


    function _unfreeze(address account)  public onlyOwner {
        require(account != address(0), "ERC20: freeze account the zero address");

        _freezes[account] = false;
    }
}
