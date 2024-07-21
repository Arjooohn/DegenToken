# DegenToken Project

DegenToken (DGN) is a decentralized ERC20 token deployed on the Avalanche blockchain.

## Description

The DegenToken smart contract, written in Solidity, utilizes the OpenZeppelin library to ensure a secure and standardized ERC20 implementation. It is deployed on the Avalanche blockchain and includes the following features:

### Key Features

1. **Mint Tokens**: Only the owner can mint new tokens. Use the mint function with the recipient address and amount.
2. **Redeem Tokens**: Burn tokens from a specified address using the redeem function.
3. **Burn Tokens**: Burn tokens from your own balance using the burn function.
4. **Add Pokemon**: Add new Pokémon to the contract using the addPokemon function (only callable by the owner).
5. **Catch Pokemon**: Use a Pokéball to catch a Pokémon with the catchPokemon function.
6. **Buy Pokeball**: Purchase a Pokéball using the buyPokeball function.
7. **Get Player Pokemons**: Retrieve the list of Pokémon owned by a player with getPlayerPokemons.
8. **Get Player Pokeballs**: Retrieve the list of Pokéballs owned by a player with getPlayerPokeballs.

## Getting Started

### Prerequisite
0. You need a MetaMask wallet, account, and balance on the Avalanche Fuji Testnet.

### Downloading the Project
1. Clone or download the repository.
2. Open the terminal in the project's root directory.
3. Run `npm install`.
4. Wait for the dependencies to install.

### Connecting to Remix
5. Run `remixd`.
6. Open Remix and select the "File Explorer" tab.
7. Under "Workspaces," choose and select "connect to localhost."
8. Click "Connect."

### Compiling and Deploying
9. In the "Solidity compiler" tab, click the Compile button (this might be unnecessary if auto compile is enabled).
10. Switch to the "Deploy & run transactions" tab.
11. Under "Environment," select "Injected Provider - MetaMask."
12. Check if MetaMask is connected to the Avalanche Fuji Testnet.
13. To deploy, click the "Deploy" button.
14. To check the deployed contract, enter `0xc2f1d4e6d74f892D8b6a92c5425D58accaB30900` next to the "At Address" button and click it.

## Help

For any issues or questions, Please refer to the official ERC20 documentation and Remix IDE tutorials for additional guidance.

## Authors
John Armand V. Yabut
