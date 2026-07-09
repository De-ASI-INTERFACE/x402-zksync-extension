import Lake
open Lake DSL

package «x402-zksync» where
  name := "x402-zksync"

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.14.0"

lean_lib «X402ZkSync» where
  roots := #[`X402ZkSync]
