const MyContract = artifacts.require("MyContract");

module.exports = function(deployer) {
  deployer.deploy(MyContract);
};

const MyNFT = artifacts.require("MyNFT");

module.exports = function(deployer) {
    deployer.deploy(MyNFT);
};

