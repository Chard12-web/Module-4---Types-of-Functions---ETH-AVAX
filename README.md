# DegenToken Smart Contract

## Overview

DegenToken is an ERC20 token named "Richard" with the symbol "RCHRD". It allows the owner to mint tokens and users to transfer, redeem, and burn tokens. The contract includes a shop with predefined items and prices where users can redeem tokens for items.

## Features

1. **Minting Tokens**: Only the owner can mint new tokens.
2. **Token Transfers**: Users can transfer tokens to others.
3. **Redeeming Tokens**: Users can redeem tokens for items in the shop.
4. **Burning Tokens**: Users can burn their tokens.
5. **Viewing Balances**: Users can view their token balance.

## Contract Details

### Events

- `TokensMinted(address indexed receiver, uint amount)`: Emitted when new tokens are minted.

### Enums

- `SellItem`: Enum representing items available in the shop.
  - `DEGEN_REFRIGERATOR`
  - `DEGEN_AIRCON`
  - `DEGEN_OVEN`
  - `DEGEN_MICROWAVE`
  - `DEGEN_RICECOOKER`

### State Variables

- `RichardShopPrices`: Mapping of `SellItem` to their respective prices.

### Constructor

- Initializes the token with the name "Richard" and symbol "RCHRD".
- Mints an initial supply of 10,000 tokens to the owner's address.
- Sets prices for the items in the shop.

### Functions

#### `mint(address _seller, uint _amount) public onlyOwner`

Mints new tokens to a specified address. Only callable by the contract owner.

#### `richardTokens(address _seller, uint _amount) public`

Transfers tokens from the caller to a specified address.

#### `redeemTokens(SellItem _item) public`

Allows users to redeem tokens for items in the shop. The caller must have a sufficient balance to redeem the item.

#### `degenTokenBalance(address _buyer) public view returns (uint)`

Returns the token balance of a specified address.

#### `burnTokens(uint _amount) public`

Burns a specified amount of tokens from the caller's balance.

## How to Use

1. **Deployment**: Deploy the contract using a compatible Ethereum environment (e.g., Remix, Hardhat).
2. **Minting Tokens**: Use the `mint` function to create new tokens.
3. **Transferring Tokens**: Use the `richardTokens` function to transfer tokens to other users.
4. **Redeeming Tokens**: Use the `redeemTokens` function to exchange tokens for items in the shop.
5. **Burning Tokens**: Use the `burnTokens` function to destroy a specified amount of tokens from your balance.
6. **Checking Balance**: Use the `degenTokenBalance` function to check your token balance.

## Example Usage

1. **Deploy the Contract**:
   ```solidity
   const degenToken = await DegenToken.deployed();
   ```

2. **Mint Tokens**:
   ```solidity
   await degenToken.mint("0xSellerAddress", 1000);
   ```

3. **Transfer Tokens**:
   ```solidity
   await degenToken.richardTokens("0xSellerAddress", 500);
   ```

4. **Redeem Tokens**:
   ```solidity
   await degenToken.redeemTokens(0); // Redeem DEGEN_REFRIGERATOR
   ```

5. **Burn Tokens**:
   ```solidity
   await degenToken.burnTokens(200);
   ```

6. **Check Balance**:
   ```solidity
   const balance = await degenToken.degenTokenBalance("0xYourAddress");
   ```

## Notes

- Ensure you have sufficient balance before performing transfer, redeem, or burn operations.
- Only the contract owner can mint new tokens.

## License

This project is licensed under the MIT License.
