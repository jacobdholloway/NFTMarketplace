// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract MyNFT is ERC721 {
    using Strings for uint256;

    address private _deployer;
    string private _baseURIextended;
    mapping(uint256 => bool) private _tokenExists;

    constructor(string memory baseURI) ERC721("MyNFT", "MNFT") {
        _deployer = msg.sender;
        _baseURIextended = baseURI;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseURIextended;
    }

    // Corrected: removed the override keyword
    function _exists(uint256 tokenId) internal view returns (bool) {
        return _tokenExists[tokenId];
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 
            ? string(abi.encodePacked(baseURI, "NFT", tokenId.toString(), ".json"))
            : "";
    }

    function mint(address to, uint256 tokenId) public {
        require(msg.sender == _deployer, "Only deployer can mint");
        require(!_exists(tokenId), "ERC721: token already minted"); // Ensure token doesn't already exist
        _tokenExists[tokenId] = true;  // Mark the token as exists to prevent re-minting
        _mint(to, tokenId);  // Call the internal _mint function
    }
}
