const PennyAuction = artifacts.require("./PennyAuction.sol");

module.exports = function(deployer) {
  deployer.deploy(PennyAuction);
};
