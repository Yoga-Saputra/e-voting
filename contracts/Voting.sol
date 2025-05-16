// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract Voting {
    struct Pemilih {
        uint weight; //weight is total voted per peserta
        bool voted; //if true, sudah pernah memilih
        address delegate; //address pemilih di smart contract
        uint vote; // memilih salah satu index peserta pemilu, ex: 0 / 1 (jika 2 peserta saja)
    }

    struct Proposal{
        string name; // nama proposal
        uint voteCount ; // akumulasi jumlah voting
    }

    address public  ketuaPemilu;
    mapping (address => Pemilih) public voters;
    Proposal[] public proposals;

    constructor(string[] memory namaProposal){
        ketuaPemilu = msg.sender;
        voters[ketuaPemilu].weight = 1;
        for(uint i=0; i < namaProposal.length; i++) {
            proposals.push(Proposal({
                name : namaProposal[i],  //nama proposal
                voteCount: 0
            }));
        }
    }

    function addressYangIkutVote(address voter) public   {
        require(msg.sender == ketuaPemilu,"hanya ketua pemilu yang dapat memberikan akses siapa yang dapat memilih");
        require(!voters[voter].voted, "pemilih ini sudah melakukan voted sebelum nya");
        require(voters[voter].weight == 0);
        voters[voter].weight = 1;
    }

    function  voted(uint proposal) public   {
        Pemilih storage sender = voters[msg.sender];
        require(sender.weight != 0, "tidak memiliki hak untuk memilih");
        require(!sender.voted, "sudah memilih");
        sender.voted = true;
        sender.vote = proposal;

        proposals[proposal].voteCount += sender.weight;
    }

    function pemenangProposal() public view returns (uint winingProposal_)  {
        uint winningVoteCount = 0;
        for (uint p=0; p<proposals.length; p++){
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winingProposal_ = p;
            }
        }
    }

    function pemenangVote() public  view returns (string memory winnerName_)  {
        winnerName_ = proposals[pemenangProposal()].name;
    }
}