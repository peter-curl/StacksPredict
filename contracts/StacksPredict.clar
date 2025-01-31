;; Title: StacksPredict: L2-Powered Bitcoin Price Prediction Protocol
;;
;; A sophisticated decentralized prediction market protocol built on Stacks L2,
;; enabling secure and transparent Bitcoin price predictions. The protocol leverages
;; Stacks' unique Bitcoin-native capabilities to create a robust market for BTC price
;; movement predictions.
;;
;; Key Features:
;; - Trustless execution through smart contracts
;; - L2 scalability for reduced transaction costs
;; - Real-time BTC price oracle integration
;; - Proportional reward distribution
;; - Anti-manipulation safeguards
;;
;; Security Features:
;; - Role-based access control
;; - Oracle price verification
;; - Stake-based participation
;; - Platform sustainability through fee mechanism
;; - Double-claim prevention

;; Constants

;; Administrative
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))

;; Error codes
(define-constant err-not-found (err u101))
(define-constant err-invalid-prediction (err u102))
(define-constant err-market-closed (err u103))
(define-constant err-already-claimed (err u104))
(define-constant err-insufficient-balance (err u105))
(define-constant err-invalid-parameter (err u106))

;; State Variables

;; Platform configuration
(define-data-var oracle-address principal 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-data-var minimum-stake uint u1000000) ;; 1 STX minimum stake
(define-data-var fee-percentage uint u2) ;; 2% platform fee
(define-data-var market-counter uint u0)