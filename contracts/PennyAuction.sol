pragma solidity ^0.4.24;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";

contract PennyAuction is Ownable {
    address[] public seller;

    uint256 public counter;

    uint256[] public _bidIncrement;
    uint256[] public _timeIncrement;

    uint256 public bidFee;

    uint256[] public auctionEnd;
    address[] public highBidder;
    uint256[] public highBid;

    constructor(

    ) public {
        bidFee = bidFee;
    }

    function addNewAuction(
        uint256 timeoutPeriod,
        uint256 bidIncrement,
        uint256 timeIncrement,
        uint256 initialPrice
    ) public returns (uint256) {
        highBidder.push(msg.sender);          // Set winner creator of the auction.
        seller.push(msg.sender);              // Add seller.
        highBid.push(initialPrice);           // Add min price of the added product.
        auctionEnd.push(now + timeoutPeriod); // Add time, where auction should finish.

        _bidIncrement.push(bidIncrement);
        _timeIncrement.push(timeIncrement);

        uint256 id = counter;
        counter++;

        return id; // Return id of created auction.
    }

    mapping(address => uint256) public balanceOf;

    event Bid(uint256 auctionID, address highBidder, uint256 highBid);

    function bid(uint256 id) public payable {
        require(now < auctionEnd[id], "Error. This auction is already finished!");
        require(msg.sender != highBidder[id], "Error. Invalid user address.");

        balanceOf[msg.sender] += msg.value;

        require(balanceOf[msg.sender] >= highBid[id] + bidFee + _bidIncrement[id], "Error. Not enought ethereum.");

        balanceOf[msg.sender] -= highBid[id] + bidFee + _bidIncrement[id];

        balanceOf[owner] += bidFee;
        balanceOf[seller[id]] += _bidIncrement[id];
        balanceOf[highBidder[id]] += highBid[id];

        highBid[id] += _bidIncrement[id];
        highBidder[id] = msg.sender;
        auctionEnd[id] += _timeIncrement[id];

        emit Bid(id, highBidder[id], highBid[id]);
    }

    /* Not sure if this function should exist. */
    function withdrawAll() public {
        uint256 amount = balanceOf[msg.sender];
        balanceOf[msg.sender] = 0;
        msg.sender.transfer(amount);
    }

    function withdraw(uint256 amount) public {
        require (balanceOf[msg.sender] >= amount, "Not enought ethereum on your balance.");
        balanceOf[msg.sender] -= amount;
        msg.sender.transfer(amount);
    }
}
