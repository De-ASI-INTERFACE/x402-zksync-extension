-- x402-zkSync Payment Verification | Author: Richard Patterson
import X402ZkSync.Basic

namespace X402ZkSync.Verification

def settle (a : PaymentAuth) (s : AccountState)
    (h : verify a s) : AccountState :=
  { s with used_nonces := s.used_nonces ∪ {a.nonce} }

theorem settled_nonce_recorded
    (a : PaymentAuth) (s : AccountState) (h : verify a s)
    : a.nonce ∈ (settle a s h).used_nonces := by
  simp [settle, Finset.mem_union, Finset.mem_singleton]

end X402ZkSync.Verification
