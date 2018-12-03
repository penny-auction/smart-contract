const PennyAuctionContract = artifacts.require("./PennyAuctionContract.sol");

module.exports = function(deployer) {
  deployer.deploy(PennyAuctionContract);
};
