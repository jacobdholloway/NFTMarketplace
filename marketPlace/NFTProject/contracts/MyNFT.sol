// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable {

    uint256 private _currentTokenId = 0;
    address private _deployer;
    
    constructor() ERC721("MyNFT", "MNFT") Ownable() {
        _deployer = msg.sender;
    }

    modifier onlyDeployer() {
        require(msg.sender == _deployer, "Only deployer can mint tokens");
        _;
    }

    // Function to mint a new NFT
    // Changed from onlyOwner to onlyDeployer 
    function mintNFT(address recipient, string memory tokenURI) public onlyDeployer returns (uint256) {
        uint256 newTokenId = _currentTokenId++;
        _mint(recipient, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        return newTokenId;
    }
}
