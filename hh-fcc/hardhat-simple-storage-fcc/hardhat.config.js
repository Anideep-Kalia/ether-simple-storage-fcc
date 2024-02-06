require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
require("@nomicfoundation/hardhat-verify");

/** @type import('hardhat/config').HardhatUserConfig */
const SEPOLIA_URL = process.env.SEPOLIA_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const ETHERSCAN_API = process.env.ETHERSCAN_API;

module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    sepolia: {
      url: "https://eth-sepolia.g.alchemy.com/v2/p1PUHe1V7geIDNZCsYt68XmHjDJSJnFs",
      accounts: [PRIVATE_KEY],
      chainId: 11155111,
    },
  },
  solidity: "0.8.7",
  etherscan: {
    apikey: ETHERSCAN_API,
  },
};
