-- ============================================================
-- x402-zkSync: Basic Re-export Shim
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09
-- Chain: zkSync Era / ERC-20 Native AA / SyncSwap v2
--
-- Re-exports X402ZkSync.PaymentVerification as the single
-- authoritative source of all shared types and definitions.
-- Chain-prefixed theorem aliases are provided for ergonomic use.
-- ============================================================
import X402ZkSync.PaymentVerification

namespace X402ZkSync

/-- Alias: replay prevention under the zkSync chain prefix.
    result type: a.nonce ∉ s.used_nonces. -/
theorem zksync_replay_prevented
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    a.nonce ∉ s.used_nonces :=
  replay_prevented a s h

/-- Alias: expiry enforcement under the zkSync chain prefix.
    Delegates to within_expiry: s.block_time ≤ a.expires_at. -/
theorem zksync_not_expired
    (a : PaymentAuth) (s : FacilitatorState) (h : verify a s) :
    s.block_time ≤ a.expires_at :=
  within_expiry a s h

end X402ZkSync
