// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/Multisigwallet.sol";

contract DeployMultiSig is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Adresses valides pour le multisig (20 bytes chacune)
        address[] memory owners = new address[](3);
        owners[0] = 0xb3e6B58E59651932488A33AcB429c68317989944;
        owners[1] = 0x86b944e625C514E7F5c7DB763889e479184C3BED; 
        owners[2] = 0xf1c28B73469f995285c8E3A0c354650196B150Af; 

        uint requiredConfirmations = 2;

        vm.startBroadcast(deployerPrivateKey);
        
        MultisigWallet multisigWallet = new MultisigWallet(owners, requiredConfirmations);
        
        vm.stopBroadcast();

        // Log de l'adresse du contrat déployé
        console.log("MultisigWallet deployed at:", address(multisigWallet));
        console.log("Owners:");
        for (uint i = 0; i < owners.length; i++) {
            console.log("  -", owners[i]);
        }
        console.log("Required confirmations:", requiredConfirmations);
    }
}

