// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ERC721Base} from "../src/ERC721Base.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";

contract ERC721Wallet is ERC721Holder {

}

contract ERC721BaseTest is Test, ERC721Holder {
    ERC721Base public nftToken;
    ERC721Wallet public wallet;

    function setUp() public {
        nftToken = new ERC721Base("GameToken", "GT", "ipfs://");
        wallet = new ERC721Wallet();
    }

    function test_mint () public {
        uint256 tokenId = nftToken.safeMint(address(this), "1234");
        assertEq(tokenId, 0);
        assertEq(nftToken.tokenURI(tokenId), "ipfs://1234");

        tokenId = nftToken.safeMint(address(this), "5678");
        assertEq(tokenId, 1);
        assertEq(nftToken.tokenURI(tokenId), "ipfs://5678");
    }

    function test_transfer() public {
        uint256 tokenId = nftToken.safeMint(address(this), "9999");
        nftToken.safeTransferFrom(address(this), address(wallet), tokenId);
        assertEq(nftToken.ownerOf(tokenId), address(wallet));
    }
}
