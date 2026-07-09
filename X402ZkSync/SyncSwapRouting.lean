-- ============================================================
-- x402-zkSync: SyncSwap v2 Routing Invariants
-- Author: Richard Patterson (@De-ASI-INTERFACE)
-- Date: 2026-07-09
-- ============================================================
import Mathlib.Data.Nat.Basic
import X402ZkSync.PaymentVerification

namespace X402ZkSync.SyncSwap

structure Pool where
  token0 : Nat; token1 : Nat
  pool_type : Nat  -- 1=classic, 2=stable
  deriving Repr

structure SwapPath where
  pool : Pool; token_in : Nat
  amount_in : Nat; min_amount_out : Nat
  deriving Repr

structure GatedSwap where
  auth : PaymentAuth; path : SwapPath
  deriving Repr

def route_authorized (gs : GatedSwap) (s : FacilitatorState) : Prop := verify gs.auth s
def route_sane (gs : GatedSwap) : Prop := 0 < gs.path.min_amount_out ∧ gs.auth.amount = gs.path.amount_in
def gated_swap_valid (gs : GatedSwap) (s : FacilitatorState) : Prop := route_authorized gs s ∧ route_sane gs

theorem gated_swap_requires_payment (gs : GatedSwap) (s : FacilitatorState) (h : gated_swap_valid gs s) :
    gs.auth.nonce ∉ s.used_nonces := replay_prevented gs.auth s h.1

end X402ZkSync.SyncSwap
