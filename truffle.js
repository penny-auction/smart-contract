/*
 * NB: since truffle-hdwallet-provider 0.0.5 you must wrap HDWallet providers in a
 * function when declaring them. Failure to do so will cause commands to hang. ex:
 * ```
 * mainnet: {
 *     provider: function() {
 *       return new HDWalletProvider(mnemonic, 'https://mainnet.infura.io/<infura-key>')
 *     },
 *     network_id: '1',
 *     gas: 4500000,
 *     gasPrice: 10000000000,
 *   },
 */

 require('dotenv').config();
 const HDWalletProvider = require("truffle-hdwallet-provider");

 module.exports = {
   networks: {
     development: {
       host: "localhost",
       port: 7545,
       gas: 6500000,
       network_id: "5777"
     },
     ropsten: {
         provider: new HDWalletProvider(process.env.MNENOMIC, "https://ropsten.infura.io/" + process.env.INFURA_API_KEY),
         network_id: 3,
         gas: 4500000
     },
   }
 };
