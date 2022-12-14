// SPDX-License-Identifier: None

// Specifies the version of Solidity, using semantic versioning.
// Learn more: https://solidity.readthedocs.io/en/v0.5.10/layout-of-source-files.html#pragma
pragma solidity >=0.8.9;
pragma abicoder v2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "hardhat/console.sol";

// Defines a contract named `HelloWorld`.
// A contract is a collection of functions and data (its state). Once deployed, a contract resides at a specific address on the Ethereum blockchain. Learn more: https://solidity.readthedocs.io/en/v0.5.10/structure-of-a-contract.html
contract GatheringToken is Initializable, ERC20Upgradeable {

  uint docAward;
  uint voteAward;
  uint passThreshold;
  uint voteDocsToCheckAmount;
  uint public docCount;
  address public _tokenAddress;

  function initialize() initializer public {
    __ERC20_init("Blockchain Gathering", "gBG");
    // Mint 100 tokens to msg.sender
    _mint(msg.sender, 100 * 10**uint(decimals()));

    docAward = 100;
    voteAward = 5;
    passThreshold = 50; // %
    docCount = 0;
    voteDocsToCheckAmount = 20;
  }

  receive () external payable {
  }

//  fallback() external payable {
//  }

  struct Vote {
    address voterAddress;
    uint weight;
    uint8 vote; // 1 == approve, 2 == reject, 3 == abstain
  }

  struct Doc {
    address submitter; // address of user who added the doc
    uint256 timestamp; // createdAt
    string docUid; // uid of the doc
    uint8 docType; // 1 == doc, 2 == sheet, 3 == slide
    bool approved; // passed vote
    uint256 totalVotesCount; // votes count for this doc
    uint256 totalApproveVotesWeight; // approve votes weight for this doc
    uint256 totalRejectVotesWeight; // reject votes weight for this doc
    uint256 totalAbstainVotesWeight; // abstain votes weight for this doc
    mapping(uint256 => Vote) votes;
  }

//  Doc[] public docs;
  mapping (uint => Doc) public docs;

  event DocAdded(uint docId);
  event DocApproved(uint docId);

  function addDoc(string memory docUid, uint8 docType) external returns (uint) {
    // CHECKING IF DOC EXISTS ALREADY
    // bool docExists = false;
    // for (uint i; i < docCount; i++) {
    //   if (keccak256(bytes(docs[i].docUid)) == keccak256(bytes(docUid)) && docs[i].docType == docType) {
    //     docExists = true;
    //     break;
    //   }
    // }
    // require(docExists == false, "Doc exists already.");

    Doc storage doc = docs[docCount];
    doc.submitter = msg.sender;
    doc.timestamp = block.timestamp;
    doc.docUid = docUid;
    doc.docType = docType;
    doc.approved = false;
    doc.totalVotesCount = 0;
    doc.totalApproveVotesWeight = 0;

    docCount += 1;
    emit DocAdded(docCount);

    return docCount;
  }

  function voteOnDoc(uint docId, uint8 vote) external returns (bool approved) {
    require(balanceOf(msg.sender) > 0, "Not part of this gathering.");
    require(docId < docCount, "Doc doesn't exist.");

    bool votedAlready = false;
    Doc storage doc = docs[docId];

    // Check if the user has voted already
    for (uint j; j < doc.totalVotesCount; j++) {
      if (doc.votes[j].voterAddress == msg.sender) {
        votedAlready = true;
        break;
      }
    }
    require(votedAlready == false, "Voted already.");

    // Add vote to doc object
    doc.votes[doc.totalVotesCount] = Vote({
      voterAddress: msg.sender,
      weight: balanceOf(msg.sender),
      vote: vote
    });
    doc.totalVotesCount++;

    // Reward voter with award tokens
    _mint(msg.sender, voteAward * 10**uint(decimals()));

    // If the vote is approve -> check if it passes approval threshold (50% of totalSupply)
    if (vote == 1) {
      doc.totalApproveVotesWeight += balanceOf(msg.sender);
      uint256 threshold = totalSupply() / (100 / passThreshold);
      if (doc.totalApproveVotesWeight > threshold) {
        doc.approved = true;

        // Reward submitter with award tokens
        _mint(doc.submitter, docAward * 10**uint(decimals()));
        // Caculate allowance value 
        uint256 approvedUSDC = IERC20(_tokenAddress).allowance(doc.submitter, address(this)); // calcluate approved USDC balance of submitter 
        // Transfer USDC token 
        transferUSDC(doc.submitter, address(this), approvedUSDC); // transfer x-amount USDC to token contract

        emit DocApproved(docId);
        return true;
      }
      return false;
    } else if (vote == 2) {
      doc.totalRejectVotesWeight += balanceOf(msg.sender);
      return false;
    } else if (vote == 3) {
      doc.totalAbstainVotesWeight += balanceOf(msg.sender);
      return false;
    }
  }

  function docsToVoteOn() public view returns (uint256[] memory) {
    uint toCheck = 0;

    if (docCount < voteDocsToCheckAmount) {
      toCheck = docCount;
    } else {
      toCheck = voteDocsToCheckAmount;
    }

    uint256[] memory docsToVoteOnArr = new uint256[](toCheck);
    uint toVoteCount = 0;
    for (uint i = 1; i <= toCheck; i++) {
      if (docs[docCount - i].approved == false) {
        docsToVoteOnArr[toVoteCount] = docCount - i;
        toVoteCount += 1;
      }
    }

    uint256[] memory output = new uint256[](toVoteCount);
    for (uint i = 0; i < toVoteCount; i++) {
      output[i] = docsToVoteOnArr[i];
    }

    return output;
  }

  //ERC20 token address set function
  function setTokenAddress(address tokenAddress) public {
    _tokenAddress = tokenAddress; 
  }

  //ERC20 Transfer function
  function tokenTransfer() external {
    require(balanceOf(msg.sender) > 0, 'Not part of this gathering.'); // validate balance of gGBT token about msg.sender
    uint256 usdcBalance = IERC20(_tokenAddress).balanceOf(address(this)); // get ERC20 token balance of gatheringToken contract
    IERC20(_tokenAddress).transfer(msg.sender, usdcBalance); // transfer ERC20 token balance of gatheringToken contract to gBGT holder.
  }

  //Upadted ERC20 Transfer function
  function transferUSDC(address from, address to, uint256 amount) private { // If you test this function, you must change this funtion as public function not private function
    if( from == address(this)) {
      IERC20(_tokenAddress).transfer(to, amount);
    }
    IERC20(_tokenAddress).transferFrom(from, to, amount);
  }


  /*function approveSpend(uint256 amount) external {
    address tipTokenAddress = 0x0000000000000000000000000000000000001010;

    IERC20 tipTokenInstance = IERC20(tipTokenAddress);
    bool success = tipTokenInstance.approve(msg.sender, amount);
    // tipTokenInstance.allowance(msg.sender, address(this));

    require(success, "Approval failed");

    return true;
  }

  function tipDoc(uint docId, uint256 amount) external {
    address tipTokenAddress = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    IERC20 tipTokenInstance = IERC20(tipTokenAddress);
    require(tipTokenInstance.balanceOf(msg.sender) >= amount , "Your balance is too low" );
    bool success = tipTokenInstance.transferFrom(msg.sender, address(this), amount);

    require(success, "Transfer failed");

    return true;
  }

  function checkApproval() external {
    address tipTokenAddress = 0x0000000000000000000000000000000000001010;

    IERC20 tipTokenInstance = IERC20(tipTokenAddress);
    uint256 allowance = tipTokenInstance.allowance(msg.sender, address(this));

    return allowance;
  }*/
}
