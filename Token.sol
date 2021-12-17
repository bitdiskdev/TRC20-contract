// 0.5.1-c8a2
// Enable optimization
pragma solidity ^0.5.0;

import "./TRC20.sol";
import "./TRC20Detailed.sol";

/**
 * @title SimpleToken
 * @dev Very simple ERC20 Token example, where all tokens are pre-assigned to the creator.
 * Note they can later distribute these tokens as they wish using `transfer` and other
 * `ERC20` functions.
 */
contract Token is TRC20, TRC20Detailed {

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     */
    constructor () public ERC20Detailed("BTD", "BTD", 6) {

        _mint(msg.sender, 2800000000 * (10 ** uint256(decimals())));
    }

    function freeze(address account)  public returns (bool) {
        require(msg.sender == owner(), "ERC20: caller is not the owner");
        _freeze(account);
        return true;
    }
    function unfreeze(address account)  public returns (bool) {
        require(msg.sender == owner(), "ERC20: caller is not the owner");
        _unfreeze(account);
        return true;
    }

     function burn(address account, uint256 amount)  public returns (bool) {
        require(msg.sender == owner(), "ERC20: caller is not the owner");
        _burn(account, amount * (10 ** uint256(decimals())));
        return true;
    }
}