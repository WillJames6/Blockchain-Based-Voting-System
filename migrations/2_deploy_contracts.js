const Voting = artifacts.require("Voting");

module.exports = function (deployer) {
  const candidates = [
    web3.utils.asciiToHex("Asia"),   // All candidate names converted to byte32 for the contract
    web3.utils.asciiToHex("Bob"),
    web3.utils.asciiToHex("Charlie")
  ];

  deployer.deploy(Voting, candidates);
};
