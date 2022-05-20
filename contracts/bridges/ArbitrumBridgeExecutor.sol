// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.10;

import {AddressAliasHelper} from '../dependencies/arbitrum/AddressAliasHelper.sol';
import {L2BridgeExecutor} from './L2BridgeExecutor.sol';

contract ArbitrumBridgeExecutor is L2BridgeExecutor {
  modifier onlyEthereumGovernanceExecutor() override {
    if (AddressAliasHelper.undoL1ToL2Alias(msg.sender) != _ethereumGovernanceExecutor)
      revert UnauthorizedEthereumExecutor();
    _;
  }

  constructor(
    address ethereumGovernanceExecutor,
    uint256 delay,
    uint256 gracePeriod,
    uint256 minimumDelay,
    uint256 maximumDelay,
    address guardian
  )
    L2BridgeExecutor(
      ethereumGovernanceExecutor,
      delay,
      gracePeriod,
      minimumDelay,
      maximumDelay,
      guardian
    )
  {
    // Intentionally left blank
  }
}