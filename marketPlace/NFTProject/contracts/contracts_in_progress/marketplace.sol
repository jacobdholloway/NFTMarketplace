pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/utils/SafeERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract NFTMarketplace is ReentrancyGuard {
    using Address for address;

    struct Listing {
        address seller;
        address nftAddress;
        uint256 tokenId;
        uint256 price;
    }

    mapping(uint256 => Listing) public listings;
    uint256 public nextListingId;

    event Listed(uint256 indexed listingId, address indexed seller, address indexed nftAddress, uint256 tokenId, uint256 price);
    event Sold(uint256 indexed listingId, address indexed buyer, address indexed nftAddress, uint256 tokenId, uint256 price);

    function listNFT(address nftAddress, uint256 tokenId, uint256 price) public nonReentrant {
        require(price > 0, "Price must be at least 1 wei");
        IERC721 nft = IERC721(nftAddress);
        require(nft.ownerOf(tokenId) == msg.sender, "Caller must own the token");
        nft.transferFrom(msg.sender, address(this), tokenId);

        listings[nextListingId] = Listing(msg.sender, nftAddress, tokenId, price);
        emit Listed(nextListingId, msg.sender, nftAddress, tokenId, price);
        nextListingId++;
    }

    function buyNFT(uint256 listingId) public payable nonReentrant {
        Listing memory listing = listings[listingId];
        require(msg.value >= listing.price, "Insufficient funds sent");
        
        IERC721(listing.nftAddress).transferFrom(address(this), msg.sender, listing.tokenId);
        payable(listing.seller).sendValue(listing.price);
        emit Sold(listingId, msg.sender, listing.nftAddress, listing.tokenId, listing.price);

        // Clean up the listing
        delete listings[listingId];
    }
}
