// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    // Define a structure to represent a Pokemon
    struct Pokemon {
        string name;
        string pokemonType;
        uint256 level;
    }

    // Define a structure to represent a Pokeball
    struct Pokeball {
        string name;
        uint256 captureRate;
    }

    // Arrays to store all available Pokemons and Pokeballs
    Pokemon[] public pokemons;
    Pokeball[] public pokeballs;

    // Mappings to store the Pokemons and Pokeballs owned by each player
    mapping(address => Pokemon[]) public playerPokemons;
    mapping(address => Pokeball[]) public playerPokeballs;

    // Constructor to initialize the ERC20 token and default Pokeballs
    constructor() ERC20("Degen", "DGN") {
        // Initialize some default Pokeballs
        pokeballs.push(Pokeball("Poke Ball", 50));
        pokeballs.push(Pokeball("Great Ball", 75));
        pokeballs.push(Pokeball("Ultra Ball", 90));
        pokeballs.push(Pokeball("Master Ball", 100));
    }

    // Function to mint new tokens, restricted to the contract owner
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Function to redeem tokens, burning the specified amount from the provided address
    function redeem(address from, uint256 amount) external {
        _burn(from, amount);
    }

    // Function to burn tokens, burning the specified amount from the sender's balance
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Function to add a new Pokemon, restricted to the contract owner
    function addPokemon(string memory name, string memory pokemonType, uint256 level) external onlyOwner {
        pokemons.push(Pokemon(name, pokemonType, level));
    }

    // Function to catch a Pokemon using a specified Pokeball
    function catchPokemon(uint256 pokemonId, uint256 pokeballId) external {
        require(pokemonId < pokemons.length, "Invalid Pokemon ID");
        require(pokeballId < pokeballs.length, "Invalid Pokeball ID");
        require(balanceOf(msg.sender) >= 1, "Not enough tokens");

        // Simplified catch logic for example purposes
        if (uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 100 < pokeballs[pokeballId].captureRate) {
            playerPokemons[msg.sender].push(pokemons[pokemonId]);
            _burn(msg.sender, 1); // Burn 1 token as a cost to catch a Pokemon
        }
    }

    // Function to buy a Pokeball using tokens
    function buyPokeball(uint256 pokeballId) external {
        require(pokeballId < pokeballs.length, "Invalid Pokeball ID");
        require(balanceOf(msg.sender) >= 1, "Not enough tokens");

        playerPokeballs[msg.sender].push(pokeballs[pokeballId]);
        _burn(msg.sender, 1); // Burn 1 token as a cost to buy a Pokeball
    }

    // Function to retrieve the Pokemons owned by a specific player
    function getPlayerPokemons(address player) external view returns (Pokemon[] memory) {
        return playerPokemons[player];
    }

    // Function to retrieve the Pokeballs owned by a specific player
    function getPlayerPokeballs(address player) external view returns (Pokeball[] memory) {
        return playerPokeballs[player];
    }
}
