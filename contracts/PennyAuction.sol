pragma solidity ^0.4.24;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";

contract PennyAuction is Ownable {
    uint256[] public bidIncrement;
    uint256[] public bidFee;
    uint256[] public timeIncrement;
    uint256[] public auctionEnd;
    uint256[] public highBid;

    string[] public highBidder;

    uint256 public counter;

    // OK.
    constructor() public {}

    // OK.
    function addNewLot(
        uint256 _initialPrice,
        uint256 _bidIncrement,
        uint256 _timeIncrement,
        uint256 _bidFee
    ) public onlyOwner returns (uint256 id) {
        highBidder.push("default"); // Set winner creator of the auction.
        bidIncrement.push(_bidIncrement);
        highBid.push(_initialPrice); // Add min price of the added product.
        bidFee.push(_bidFee);
        auctionEnd.push(now + _timeIncrement); // Add time, where auction should finish.

        counter++;

        // Return id of created auction.
        return counter;
    }

    event Bid(uint256 id, string uid, uint256 highBid);

    function bid(uint256 id, string uid) public onlyOwner {
        require(now < auctionEnd[id], "Auction is not finished.");
        require(keccak256(bytes(uid)) != keccak256(bytes(highBidder[id])), "Invalid uid. Already highBidder.");



        highBid[id] += bidIncrement[id];

        auctionEnd[id] += timeIncrement[id];

        highBidder[id] = uid;

        emit Bid(id, highBidder[id], highBid[id]);
    }

    function getWinner(uint256 id) public view onlyOwner returns (string uid, uint256 bighBid) {
        require(now < auctionEnd[id], "Auction is not finished.");

        return (highBidder[id], highBid[id]);
    }
}