// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ThreeBeadsGame {
    address public owner;
    uint8 private winningBead; // 1, 2, or 3

    event Played(address player, uint8 guess, bool won);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
        winningBead = 1;
    }

    function setWinningBead(uint8 bead) external onlyOwner {
        require(bead >= 1 && bead <= 3, "Invalid bead");
        winningBead = bead;
    }

    function guess(uint8 bead) external returns (bool) {
        require(bead >= 1 && bead <= 3, "Invalid guess");

        bool won = (bead == winningBead);

        emit Played(msg.sender, bead, won);

        return won;
    }

    function revealWinningBead() external view onlyOwner returns (uint8) {
        return winningBead;
    }
}