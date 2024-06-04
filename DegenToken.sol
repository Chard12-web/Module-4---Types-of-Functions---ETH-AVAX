// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
  event TokensMinted(address indexed receiver, uint amount);
  enum SellItem {
    DEGEN_REFRIGERATOR,
    DEGEN_AIRCON,
    DEGEN_OVEN,
    DEGEN_MICROWAVE,
    DEGEN_RICECOOKER
  }
  mapping(SellItem => uint) public RichardShopPrices;

  constructor() ERC20("Richard", "RCHRD") Ownable(msg.sender) {
    _mint(msg.sender, 10000 * 10**decimals());

    RichardShopPrices[SellItem.DEGEN_REFRIGERATOR] = 2000;
    RichardShopPrices[SellItem.DEGEN_AIRCON] = 5000;
    RichardShopPrices[SellItem.DEGEN_OVEN] = 4000;
    RichardShopPrices[SellItem.DEGEN_MICROWAVE] = 3500;
    RichardShopPrices[SellItem.DEGEN_RICECOOKER] = 3000;
  }

  function mint(address _seller, uint _amount) public onlyOwner {
    _mint(_seller, _amount);
    emit TokensMinted(_seller, _amount);
  }

  function richardTokens(address _seller, uint _amount) public {
    _transfer(msg.sender, _seller, _amount);
  }

  function redeemTokens(SellItem _item) public {
    uint256 itemPrice = RichardShopPrices[_item];
    require(balanceOf(msg.sender) >= itemPrice, "You have insufficient balance, try again");

    _burn(msg.sender, itemPrice);
  }

  function degenTokenBalance(address _buyer) public view returns (uint) {
    return balanceOf(_buyer);
  }

  function burnTokens(uint _amount) public {
    require(balanceOf(msg.sender) >= _amount, "You have insufficient balance, try again");
    _burn(msg.sender, _amount);
  }
}
