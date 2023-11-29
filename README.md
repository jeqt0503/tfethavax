# tfethavax

#Types of function functionality

1. *Initialization*
   -The initialization starts with the Contract with the initial supply of tokens, the entirety of the amount of supply will be received by the owner
2. *Minting of tokens*
    - The mint function allows only the owner to mint which means add tokens to the entire supply.
3. *Burning of tokens*
    - The burn function will also be accessible to the users which means they can also burn their own tokens that is subjected to certain conditions. The amount must be greater to 15 for them to burn the tokens.
4. *Transfering of token*
    - This overrides the ERC-20 which is the transfer function that will provide the custom logic.
