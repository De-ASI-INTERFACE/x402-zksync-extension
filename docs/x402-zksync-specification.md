# x402-zkSync Era Specification
**Author:** Richard Patterson | **Ref:** RP-DEASI-ZKS-2026-0709-001

## Payment Schema (`scheme: zksync-erc20`)
```json
{ "scheme": "zksync-erc20", "chainId": 324,
  "payTo": "0x<facilitator>", "token": "0x<erc20>",
  "amount": "<uint256>", "nonce": "<uint256>",
  "expiresAt": "<unix-timestamp>",
  "signature": "<aa-validated-sig>" }
```

## zkSync Era-Specific Invariants
1. **Native AA:** Every account is `IAccount`; `validateTransaction` called before payment settlement
2. **EraVM ZK Validity:** All state transitions proven via ZK validity proof; no fraud window
3. **zkPorter (Data Availability):** Optional off-chain DA for high-throughput payment gate shards
4. **Paymaster Support:** Facilitator can act as Paymaster — sponsor gas for payer accounts
5. **SyncSwap v2 CL:** Concentrated liquidity routing with payment-gated pool access
