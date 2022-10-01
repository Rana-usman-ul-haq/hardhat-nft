// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//yarn add @openzepplin/contracts

contract BasicNft is ERC721 {
    string public constant TOKEN_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    uint256 private s_tokenCounter;
    uint256 public mintRate = 0.01 ether;

    constructor() ERC721("Dogie", "DOG") {}

    function mintNft() public payable returns (uint256) {
        require(msg.value >= mintRate, "not enough ether");
        _safeMint(msg.sender, s_tokenCounter); //mint NFT everytime someone calls contract
        s_tokenCounter = s_tokenCounter + 1; //+1 when minted
        return s_tokenCounter;
    }

    function tokenURI(
        uint256 /*tokenId*/
    ) public pure override returns (string memory) {
        // require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return TOKEN_URI;
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
