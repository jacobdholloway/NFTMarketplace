// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract NFTMarketplace is ReentrancyGuard {
    // State variables
    struct Listing {
        address seller;
        uint256 price;
        bool isActive;
    }

    mapping(address => mapping(uint256 => Listing)) public listings; // NFT contract address to token ID to Listing

    // Events
    event Listed(address indexed seller, address indexed nft, uint256 indexed tokenId, uint256 price);
    event Bought(address indexed buyer, address indexed nft, uint256 indexed tokenId, uint256 price);

    // List an NFT
    function listNFT(address nft, uint256 tokenId, uint256 price) public {
        ERC721 token = ERC721(nft);
        require(token.ownerOf(tokenId) == msg.sender, "Only the owner can list");
        require(token.getApproved(tokenId) == address(this), "Marketplace not approved");

        listings[nft][tokenId] = Listing(msg.sender, price, true);
        emit Listed(msg.sender, nft, tokenId, price);
    }

    // Buy a listed NFT
    function buyNFT(address nft, uint256 tokenId) public payable nonReentrant {
        Listing memory listing = listings[nft][tokenId];
        require(listing.isActive, "Listing is not active");
        require(msg.value == listing.price, "Incorrect value");

        // Transfer funds directly to the seller
        payable(listing.seller).transfer(msg.value);

        // Transfer ownership of the NFT
        ERC721(nft).safeTransferFrom(listing.seller, msg.sender, tokenId);

        // Mark listing as inactive
        listings[nft][tokenId].isActive = false;

        emit Bought(msg.sender, nft, tokenId, listing.price);
    }
}
