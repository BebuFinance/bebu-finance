// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;
pragma experimental ABIEncoderV2;

interface IRewardPool {

    struct PoolInfo {
        address token; // Address of LP token contract.
        uint256 allocPoint; // How many allocation points assigned to this pool. Bebus to distribute per block.
        uint256 lastRewardTime; // Last time that Bebus distribution occurs.
        uint256 accBebuPerShare; // Accumulated Bebus per share, times 1e18. See below.
        bool isStarted; // if lastRewardTime has passed
    }

    struct UserInfo {
        uint256 amount; // How many LP tokens the user has provided.
        uint256 rewardDebt; // Reward debt. See explanation below.
    }

    function BebuPerSecond() external returns (uint256);

    function totalAllocPoint() external returns (uint256);

    function poolInfo(uint256 _pid) external returns (PoolInfo memory);

    function pendingShare(uint256 _pid, address _user) external returns (uint256);

    function userInfo(uint256 _pid, address _addr) external returns (UserInfo memory);
}