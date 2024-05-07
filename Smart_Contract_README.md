## Steps for Creating NFT
1) Host NFTMarketplace-main/marketPlace/marketPlace/descriptors (I used python3 -m http.server 8001 while in that path)
2) From Account Admin: Deploy MyNFT.sol with argument: http://127.0.0.1:8001/ 
3) From Account Admin: Deploy NFTMarketplace.sol
4) From Account Admin: Mint NFT1 with mint(address Account A, uint256 1)
5) From Account Admin: MyNFT.approve(NFT Address, #)
6) From Account Admin: NFTMarketplace.listNFT(NFT Address, #, 10)
7) From Account B: NFTMarketplace.buyNFT(NFT Address, #) with msg.value = 10 (msg.value must equal last argument from step 6)

## Commands Needed for UI Implementation 
* MyNFT.tokenURI(#) -> http://127.0.0.1:8001/NFT#.json
* MyNFT.ownerOf(#) -> EOA
### Example:
* Listing[NFT Address][#]->
  
0:
address: seller 0xF9c921989014BAc29611c56bf55ea7627E1e15b5
1:
uint256: price 10
2:
bool: isActive false
