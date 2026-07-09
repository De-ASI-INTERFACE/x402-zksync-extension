# x402-zkSync Extension
**HTTP 402 Payment-Gated Routing on zkSync Era**
**Author:** Richard Patterson (@De-ASI-INTERFACE) | **Version:** 1.0.0 | **Date:** 2026-07-09 | **License:** MIT

## Overview
The x402-zkSync Extension adapts the x402 HTTP 402 payment standard to zkSync Era (chainId: 324) using ZK-rollup validity proofs, native account abstraction (AA), and EraVM. It defines `scheme: zksync-erc20` for ERC-20/ETH payments with SyncSwap v2 and Mute.io as canonical DEX routing surfaces. zkSync Era's native AA means every account is a smart contract — payment authorization uses `IAccount.validateTransaction` with any signature scheme. Lean 4 + Mathlib proofs verify nonce replay prevention, timestamp expiry, and AA validation invariants.
**Reference ID:** RP-DEASI-ZKS-2026-0709-001
