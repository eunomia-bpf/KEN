(set-info :original "b.pp.ms.o.bc")
(set-info :authors "SeaHorn v.14.0.0-rc0")
(declare-rel verifier.error (Bool Bool Bool ))
(declare-rel sea.synth.inferable.infer@entry ())
(declare-rel sea.synth.inferable.infer (Bool Bool Bool Int Int Bool ))
(declare-rel itp@_tail (Int Int ))
(declare-rel itp@.split (Bool Int Int ))
(declare-rel itp (Bool Bool Bool Int Int Bool ))
(declare-rel main@entry (Int Int Int Int Int Int ))
(declare-rel main@_16 (Int Int Int ))
(declare-rel main@verifier.error ())
(declare-rel main@verifier.error.split ())
(declare-var sea.synth.inferable.infer@arg.0_0 Int )
(declare-var sea.synth.inferable.infer@arg.1_0 Int )
(declare-var itp@arg.0_0 Int )
(declare-var itp@arg.1_0 Int )
(declare-var itp@%_br_0 Bool )
(declare-var main@%_17_0 Int )
(declare-var @nd4_0 Int )
(declare-var main@%_18_0 Int )
(declare-var main@%_19_0 Int )
(declare-var @nd5_0 Int )
(declare-var main@%_20_0 Int )
(declare-var main@%_21_0 Int )
(declare-var @nd6_0 Int )
(declare-var main@%_22_0 Int )
(declare-var main@%_23_0 Bool )
(declare-var main@%_24_0 Bool )
(declare-var main@%_25_0 Int )
(declare-var main@%_26_0 Bool )
(declare-var main@%or.cond.i_0 Bool )
(declare-var main@%_27_0 Bool )
(declare-var main@%spec.select.i_0 Bool )
(declare-var main@%_0_0 Int )
(declare-var main@%_1_0 Int )
(declare-var main@%_2_0 Bool )
(declare-var main@%_3_0 Bool )
(declare-var main@%_4_0 Int )
(declare-var @nd1_0 Int )
(declare-var main@%_5_0 Int )
(declare-var main@%_6_0 Int )
(declare-var @nd2_0 Int )
(declare-var main@%_7_0 Int )
(declare-var main@%_8_0 Int )
(declare-var @nd3_0 Int )
(declare-var main@%_9_0 Int )
(declare-var main@%.not.i_0 Bool )
(declare-var main@%_10_0 Int )
(declare-var main@%_11_0 Int )
(declare-var main@%_12_0 Bool )
(declare-var main@%_13_0 Bool )
(declare-var main@%_14_0 Bool )
(declare-var main@%_15_0 Bool )
(rule (verifier.error false false false))
(rule (verifier.error false true true))
(rule (verifier.error true false true))
(rule (verifier.error true true true))
(rule (sea.synth.inferable.infer
  true
  true
  true
  sea.synth.inferable.infer@arg.0_0
  sea.synth.inferable.infer@arg.1_0
  false))
(rule (sea.synth.inferable.infer
  false
  true
  true
  sea.synth.inferable.infer@arg.0_0
  sea.synth.inferable.infer@arg.1_0
  false))
(rule (sea.synth.inferable.infer
  false
  false
  false
  sea.synth.inferable.infer@arg.0_0
  sea.synth.inferable.infer@arg.1_0
  false))
(rule (itp true true true itp@arg.0_0 itp@arg.1_0 itp@%_br_0))
(rule (itp false true true itp@arg.0_0 itp@arg.1_0 itp@%_br_0))
(rule (itp false false false itp@arg.0_0 itp@arg.1_0 itp@%_br_0))
(rule (itp@_tail itp@arg.0_0 itp@arg.1_0))
(rule (=> (and (itp@_tail itp@arg.0_0 itp@arg.1_0)
         true
         false
         (sea.synth.inferable.infer
           true
           false
           false
           itp@arg.0_0
           itp@arg.1_0
           itp@%_br_0))
    (itp@.split itp@%_br_0 itp@arg.0_0 itp@arg.1_0)))
(rule (=> (itp@.split itp@%_br_0 itp@arg.0_0 itp@arg.1_0)
    (itp true false false itp@arg.0_0 itp@arg.1_0 itp@%_br_0)))
(rule (main@entry @nd4_0 @nd5_0 @nd6_0 @nd1_0 @nd2_0 @nd3_0))
(rule (let ((a!1 (and (main@entry @nd4_0 @nd5_0 @nd6_0 @nd1_0 @nd2_0 @nd3_0)
                true
                (itp true false false main@%_0_0 main@%_1_0 main@%_2_0)
                (not main@%_3_0)
                (= main@%_4_0 @nd1_0)
                (= main@%_6_0 @nd2_0)
                (= main@%_8_0 @nd3_0)
                (= main@%.not.i_0 (not (= main@%_5_0 0)))
                (= main@%_10_0 (* main@%_9_0 2))
                (= main@%_11_0 (+ main@%_10_0 6))
                (= main@%_12_0 (= main@%_7_0 main@%_11_0))
                (= main@%_13_0 (ite main@%.not.i_0 main@%_12_0 false))
                main@%_13_0
                (itp true false false main@%_7_0 main@%_9_0 main@%_14_0)
                (itp true false false main@%_7_0 main@%_9_0 main@%_15_0)
                main@%_15_0)))
  (=> a!1 (main@_16 @nd4_0 @nd5_0 @nd6_0))))
(rule (let ((a!1 (and (main@entry @nd4_0 @nd5_0 @nd6_0 @nd1_0 @nd2_0 @nd3_0)
                true
                (itp true false false main@%_0_0 main@%_1_0 main@%_2_0)
                (not main@%_3_0)
                (= main@%_4_0 @nd1_0)
                (= main@%_6_0 @nd2_0)
                (= main@%_8_0 @nd3_0)
                (= main@%.not.i_0 (not (= main@%_5_0 0)))
                (= main@%_10_0 (* main@%_9_0 2))
                (= main@%_11_0 (+ main@%_10_0 6))
                (= main@%_12_0 (= main@%_7_0 main@%_11_0))
                (= main@%_13_0 (ite main@%.not.i_0 main@%_12_0 false))
                main@%_13_0
                (itp true false false main@%_7_0 main@%_9_0 main@%_14_0)
                (itp true false false main@%_7_0 main@%_9_0 main@%_15_0)
                (not main@%_15_0))))
  (=> a!1 main@verifier.error)))
(rule (let ((a!1 (and (main@_16 @nd4_0 @nd5_0 @nd6_0)
                true
                (= main@%_17_0 @nd4_0)
                (= main@%_19_0 @nd5_0)
                (= main@%_21_0 @nd6_0)
                (itp true false false main@%_20_0 main@%_22_0 main@%_23_0)
                main@%_23_0
                (= main@%_24_0 (> main@%_18_0 6))
                (= main@%_25_0 (* main@%_22_0 (- 4)))
                (= main@%_26_0 (not (= main@%_20_0 main@%_25_0)))
                (= main@%or.cond.i_0 (ite main@%_24_0 true main@%_26_0))
                (= main@%_27_0 (= main@%_20_0 4))
                (= main@%spec.select.i_0
                   (ite main@%or.cond.i_0 true main@%_27_0))
                (not main@%spec.select.i_0))))
  (=> a!1 main@verifier.error)))
(rule (=> main@verifier.error main@verifier.error.split))
(rule (let ((a!1 (and (main@entry @nd4_0 @nd5_0 @nd6_0 @nd1_0 @nd2_0 @nd3_0)
                true
                (itp true false false main@%_0_0 main@%_1_0 main@%_2_0)
                (not main@%_3_0)
                (= main@%.not.i_0 (not (= main@%_5_0 0)))
                (= main@%_10_0 (* main@%_9_0 2))
                (= main@%_11_0 (+ main@%_10_0 6))
                (= main@%_12_0 (= main@%_7_0 main@%_11_0))
                (= main@%_13_0 (ite main@%.not.i_0 main@%_12_0 false))
                main@%_13_0
                (= main@%_14_0 true))))
  (=> a!1 (itp true false false main@%_7_0 main@%_9_0 main@%_14_0))))
(query main@verifier.error.split)

