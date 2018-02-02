pragma solidity ^0.4.17;

contract NashTechAuction {
    
    address public beneficiary;
    uint public auctionEnd;
    
    address public currentHighestBidder;
    uint public currentHighestBid;
    
    mapping(address => uint) pendingReturns;
    
    bool ended = false;
    
    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);
    
    function NashTechAuction(uint _biddingTime, address _beneficiary) public {
        beneficiary = _beneficiary;
        auctionEnd = now + _biddingTime;
    }
    
    function bid() public payable {
        // The keyword payable is required for the function to
        // be able to receive Ether.

        require(now <= auctionEnd);
        require(msg.value > currentHighestBid);
        
        if (currentHighestBidder != 0) {
            pendingReturns[currentHighestBidder] += currentHighestBid;
        }
        
        currentHighestBidder = msg.sender;
        currentHighestBid = msg.value;
        HighestBidIncreased(msg.sender, msg.value);
    }
    
    function withdraw() public returns (bool) {
        uint amount = pendingReturns[msg.sender];
        if (amount > 0) {
            // It is important to set this to zero because the recipient
            // can call this function again as part of the receiving call
            // before `send` returns.
            pendingReturns[msg.sender] = 0;
            if (!msg.sender.send(amount)) {
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        
        return true;
    }
    
    function auctionEnd() public {
        require(now >= auctionEnd);
        require(!ended);
        
        ended = true;
        AuctionEnded(currentHighestBidder, currentHighestBid);
        
        beneficiary.transfer(currentHighestBid);
    }
}