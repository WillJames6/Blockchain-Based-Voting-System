module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545, // Same port as Ganache
      network_id: "*", // Match any network
    },
  },
  compilers: {
    solc: {
      version: "0.5.16", // Match Solidity version
    },
  },
};
