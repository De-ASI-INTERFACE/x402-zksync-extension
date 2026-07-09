-- x402-zkSync Era Basic | Author: Richard Patterson (@De-ASI-INTERFACE)
import Mathlib.Data.Finset.Basic
import Mathlib.Data.Nat.Basic

namespace X402ZkSync

/-- Payment authorization for zkSync Era native AA payment gates -/
structure PaymentAuth where
  nonce      : Nat
  amount     : Nat
  expires_at : Nat
  deriving Repr, DecidableEq

/-- AA account state tracking used nonces (EraVM nonce manager) -/
structure AccountState where
  used_nonces : Finset Nat
  block_time  : Nat
  deriving Repr

/-- Verification: nonce unused and within expiry window -/
def verify (a : PaymentAuth) (s : AccountState) : Prop :=
  a.nonce ∉ s.used_nonces ∧ s.block_time ≤ a.expires_at

/-- Replay prevention theorem -/
theorem zksync_replay_prevented
    (a : PaymentAuth) (s : AccountState) (h : verify a s)
    : a.nonce ∉ s.used_nonces := h.1

/-- Expiry theorem -/
theorem zksync_not_expired
    (a : PaymentAuth) (s : AccountState) (h : verify a s)
    : s.block_time ≤ a.expires_at := h.2

end X402ZkSync
