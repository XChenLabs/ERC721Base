// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ERC721Base} from "../src/ERC721Base.sol";

contract ERC721BaseScript is Script {
    ERC721Base public nftToken;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        nftToken = new ERC721Base("GameToken", "GT", "ipfs://");

        vm.stopBroadcast();
    }
}
