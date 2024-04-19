// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "erc721a/contracts/ERC721A.sol";

// ZamaNFT Contract Extends ERC721A Non-Fungible Token Standard basic implementation
contract ZamaNFT is ERC721A {
    // State variables
    address public owner;
    uint256 public constant MAX_QUANTITY = 5;
    string private baseUrl;
    string public promptName;

    // Events
    event Minted(address indexed to, uint256 quantity);

    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // Constructor initializes the token collection and metadata details.
    constructor() ERC721A("ZamaNFT", "ZMT") {
        owner = msg.sender;
        baseUrl = "https://gateway.pinata.cloud/ipfs/QmcKBhCbyaedQQuM8oqKXJV3d1ZZx93vsnMP4HWi3vvJEo/";
        promptName = "Image about African culture";
    }

    // Allows the owner to mint new tokens with  quantity minted.
   
    function mint(uint256 quantity) external onlyOwner {
        require(totalSupply() + quantity <= MAX_QUANTITY, "Exceeds max mint quantity");
        _mint(msg.sender, quantity);
        emit Minted(msg.sender, quantity);
    }

    // Accessor methods
    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

   
    // Public function to retrieve the prompt description for the NFTs.
    
    function getPromptDescription() external pure returns (string memory) {
        return "Default description";
    }
}

