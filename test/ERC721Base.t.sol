// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ERC721Base} from "../src/ERC721Base.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";

contract ERC721BaseTest is Test, ERC721Holder {
    ERC721Base public nftToken;

    function setUp() public {
        nftToken = new ERC721Base("GameToken", "GT", "ipfs://");
    }

    function test_mint () public {
        nftToken.safeMint(address(this), "1234");
        assertEq(nftToken.tokenURI(0), "ipfs://1234");
    }

    /*function test_transfer(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }*/
}
