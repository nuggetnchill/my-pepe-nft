// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyEpicNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721 ("SquareNFT", "SQUARE"){
        console.log("This is NFT contract. Woah!");
    }

    function makeAnEpicNFT() public {
        uint256 newItemId = _tokenIds.current();

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId,"https://jsonkeeper.com/b/P5NV");
        console.log("An NFT with ID %s has been minted to %s", newItemId, msg.sender);

        _tokenIds.increment();
    }
}