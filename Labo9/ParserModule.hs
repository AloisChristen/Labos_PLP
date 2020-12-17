{-# OPTIONS_GHC -w #-}
module ParserModule where 
import LexerModule
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,197) ([8960,41984,3,0,32,0,0,0,6144,0,0,0,16383,0,0,0,560,6720,8960,41984,12289,16386,26,0,128,0,0,512,0,12288,16386,26,8,0,65280,191,49152,1015,16384,16383,0,35,420,560,6720,8960,41984,12289,16386,26,35,420,560,6720,8960,41984,12289,16386,26,35,420,560,6720,8960,41984,12289,16386,26,35,420,560,6720,2048,0,8192,0,0,0,128,560,6720,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63424,3,0,63,0,1008,0,16128,0,61440,3,0,63,49152,1015,0,16252,0,0,0,560,6720,8960,41984,1,16383,64,4,0,0,0,8960,41984,1,16383,4,65520,19,65280,63,1024,0,0,0,64,0,128,128,0,8960,41984,12289,16386,26,0,0,65280,63,61440,1023,12288,16386,26,0,0,65280,63,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Line","Def","Exp","Exps","Params","Integer","\"(\"","\")\"","\"=\"","\"+\"","\"-\"","\"*\"","\"/\"","\"^\"","\"%\"","\"&&\"","\"||\"","\"==\"","\"!=\"","\"<\"","\"<=\"","\">\"","\">=\"","if","then","else","let","in","var","func","def","\",\"","%eof"]
        bit_start = st Prelude.* 36
        bit_end = (st Prelude.+ 1) Prelude.* 36
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..35]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (9) = happyShift action_6
action_0 (10) = happyShift action_7
action_0 (14) = happyShift action_8
action_0 (27) = happyShift action_9
action_0 (30) = happyShift action_10
action_0 (32) = happyShift action_11
action_0 (33) = happyShift action_12
action_0 (34) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_5
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (34) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (32) = happyShift action_32
action_3 (33) = happyShift action_33
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (36) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (13) = happyShift action_18
action_5 (14) = happyShift action_19
action_5 (15) = happyShift action_20
action_5 (16) = happyShift action_21
action_5 (17) = happyShift action_22
action_5 (18) = happyShift action_23
action_5 (19) = happyShift action_24
action_5 (20) = happyShift action_25
action_5 (21) = happyShift action_26
action_5 (22) = happyShift action_27
action_5 (23) = happyShift action_28
action_5 (24) = happyShift action_29
action_5 (25) = happyShift action_30
action_5 (26) = happyShift action_31
action_5 _ = happyReduce_2

action_6 _ = happyReduce_19

action_7 (9) = happyShift action_6
action_7 (10) = happyShift action_7
action_7 (14) = happyShift action_8
action_7 (27) = happyShift action_9
action_7 (30) = happyShift action_10
action_7 (32) = happyShift action_11
action_7 (33) = happyShift action_12
action_7 (6) = happyGoto action_17
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (9) = happyShift action_6
action_8 (10) = happyShift action_7
action_8 (14) = happyShift action_8
action_8 (27) = happyShift action_9
action_8 (30) = happyShift action_10
action_8 (32) = happyShift action_11
action_8 (33) = happyShift action_12
action_8 (6) = happyGoto action_16
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (9) = happyShift action_6
action_9 (10) = happyShift action_7
action_9 (14) = happyShift action_8
action_9 (27) = happyShift action_9
action_9 (30) = happyShift action_10
action_9 (32) = happyShift action_11
action_9 (33) = happyShift action_12
action_9 (6) = happyGoto action_15
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (32) = happyShift action_14
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_23

action_12 (10) = happyShift action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (9) = happyShift action_6
action_13 (10) = happyShift action_7
action_13 (14) = happyShift action_8
action_13 (27) = happyShift action_9
action_13 (30) = happyShift action_10
action_13 (32) = happyShift action_11
action_13 (33) = happyShift action_12
action_13 (6) = happyGoto action_53
action_13 (7) = happyGoto action_54
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (12) = happyShift action_52
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (13) = happyShift action_18
action_15 (14) = happyShift action_19
action_15 (15) = happyShift action_20
action_15 (16) = happyShift action_21
action_15 (17) = happyShift action_22
action_15 (18) = happyShift action_23
action_15 (19) = happyShift action_24
action_15 (20) = happyShift action_25
action_15 (21) = happyShift action_26
action_15 (22) = happyShift action_27
action_15 (23) = happyShift action_28
action_15 (24) = happyShift action_29
action_15 (25) = happyShift action_30
action_15 (26) = happyShift action_31
action_15 (28) = happyShift action_51
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (15) = happyShift action_20
action_16 (16) = happyShift action_21
action_16 (17) = happyShift action_22
action_16 (18) = happyShift action_23
action_16 (19) = happyShift action_24
action_16 (21) = happyShift action_26
action_16 (22) = happyShift action_27
action_16 (23) = happyShift action_28
action_16 (24) = happyShift action_29
action_16 (25) = happyShift action_30
action_16 (26) = happyShift action_31
action_16 _ = happyReduce_25

action_17 (11) = happyShift action_50
action_17 (13) = happyShift action_18
action_17 (14) = happyShift action_19
action_17 (15) = happyShift action_20
action_17 (16) = happyShift action_21
action_17 (17) = happyShift action_22
action_17 (18) = happyShift action_23
action_17 (19) = happyShift action_24
action_17 (20) = happyShift action_25
action_17 (21) = happyShift action_26
action_17 (22) = happyShift action_27
action_17 (23) = happyShift action_28
action_17 (24) = happyShift action_29
action_17 (25) = happyShift action_30
action_17 (26) = happyShift action_31
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (9) = happyShift action_6
action_18 (10) = happyShift action_7
action_18 (14) = happyShift action_8
action_18 (27) = happyShift action_9
action_18 (30) = happyShift action_10
action_18 (32) = happyShift action_11
action_18 (33) = happyShift action_12
action_18 (6) = happyGoto action_49
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (9) = happyShift action_6
action_19 (10) = happyShift action_7
action_19 (14) = happyShift action_8
action_19 (27) = happyShift action_9
action_19 (30) = happyShift action_10
action_19 (32) = happyShift action_11
action_19 (33) = happyShift action_12
action_19 (6) = happyGoto action_48
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (9) = happyShift action_6
action_20 (10) = happyShift action_7
action_20 (14) = happyShift action_8
action_20 (27) = happyShift action_9
action_20 (30) = happyShift action_10
action_20 (32) = happyShift action_11
action_20 (33) = happyShift action_12
action_20 (6) = happyGoto action_47
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (9) = happyShift action_6
action_21 (10) = happyShift action_7
action_21 (14) = happyShift action_8
action_21 (27) = happyShift action_9
action_21 (30) = happyShift action_10
action_21 (32) = happyShift action_11
action_21 (33) = happyShift action_12
action_21 (6) = happyGoto action_46
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (9) = happyShift action_6
action_22 (10) = happyShift action_7
action_22 (14) = happyShift action_8
action_22 (27) = happyShift action_9
action_22 (30) = happyShift action_10
action_22 (32) = happyShift action_11
action_22 (33) = happyShift action_12
action_22 (6) = happyGoto action_45
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (9) = happyShift action_6
action_23 (10) = happyShift action_7
action_23 (14) = happyShift action_8
action_23 (27) = happyShift action_9
action_23 (30) = happyShift action_10
action_23 (32) = happyShift action_11
action_23 (33) = happyShift action_12
action_23 (6) = happyGoto action_44
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (9) = happyShift action_6
action_24 (10) = happyShift action_7
action_24 (14) = happyShift action_8
action_24 (27) = happyShift action_9
action_24 (30) = happyShift action_10
action_24 (32) = happyShift action_11
action_24 (33) = happyShift action_12
action_24 (6) = happyGoto action_43
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (9) = happyShift action_6
action_25 (10) = happyShift action_7
action_25 (14) = happyShift action_8
action_25 (27) = happyShift action_9
action_25 (30) = happyShift action_10
action_25 (32) = happyShift action_11
action_25 (33) = happyShift action_12
action_25 (6) = happyGoto action_42
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (9) = happyShift action_6
action_26 (10) = happyShift action_7
action_26 (14) = happyShift action_8
action_26 (27) = happyShift action_9
action_26 (30) = happyShift action_10
action_26 (32) = happyShift action_11
action_26 (33) = happyShift action_12
action_26 (6) = happyGoto action_41
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (9) = happyShift action_6
action_27 (10) = happyShift action_7
action_27 (14) = happyShift action_8
action_27 (27) = happyShift action_9
action_27 (30) = happyShift action_10
action_27 (32) = happyShift action_11
action_27 (33) = happyShift action_12
action_27 (6) = happyGoto action_40
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (9) = happyShift action_6
action_28 (10) = happyShift action_7
action_28 (14) = happyShift action_8
action_28 (27) = happyShift action_9
action_28 (30) = happyShift action_10
action_28 (32) = happyShift action_11
action_28 (33) = happyShift action_12
action_28 (6) = happyGoto action_39
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (9) = happyShift action_6
action_29 (10) = happyShift action_7
action_29 (14) = happyShift action_8
action_29 (27) = happyShift action_9
action_29 (30) = happyShift action_10
action_29 (32) = happyShift action_11
action_29 (33) = happyShift action_12
action_29 (6) = happyGoto action_38
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (9) = happyShift action_6
action_30 (10) = happyShift action_7
action_30 (14) = happyShift action_8
action_30 (27) = happyShift action_9
action_30 (30) = happyShift action_10
action_30 (32) = happyShift action_11
action_30 (33) = happyShift action_12
action_30 (6) = happyGoto action_37
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (9) = happyShift action_6
action_31 (10) = happyShift action_7
action_31 (14) = happyShift action_8
action_31 (27) = happyShift action_9
action_31 (30) = happyShift action_10
action_31 (32) = happyShift action_11
action_31 (33) = happyShift action_12
action_31 (6) = happyGoto action_36
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (12) = happyShift action_35
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (10) = happyShift action_34
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (32) = happyShift action_61
action_34 (8) = happyGoto action_60
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (9) = happyShift action_6
action_35 (10) = happyShift action_7
action_35 (14) = happyShift action_8
action_35 (27) = happyShift action_9
action_35 (30) = happyShift action_10
action_35 (32) = happyShift action_11
action_35 (33) = happyShift action_12
action_35 (6) = happyGoto action_59
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_17

action_37 _ = happyReduce_16

action_38 _ = happyReduce_18

action_39 _ = happyReduce_15

action_40 _ = happyReduce_14

action_41 _ = happyReduce_13

action_42 (15) = happyShift action_20
action_42 (16) = happyShift action_21
action_42 (17) = happyShift action_22
action_42 (18) = happyShift action_23
action_42 (19) = happyShift action_24
action_42 (21) = happyShift action_26
action_42 (22) = happyShift action_27
action_42 (23) = happyShift action_28
action_42 (24) = happyShift action_29
action_42 (25) = happyShift action_30
action_42 (26) = happyShift action_31
action_42 _ = happyReduce_12

action_43 (21) = happyShift action_26
action_43 (22) = happyShift action_27
action_43 (23) = happyShift action_28
action_43 (24) = happyShift action_29
action_43 (25) = happyShift action_30
action_43 (26) = happyShift action_31
action_43 _ = happyReduce_11

action_44 (21) = happyShift action_26
action_44 (22) = happyShift action_27
action_44 (23) = happyShift action_28
action_44 (24) = happyShift action_29
action_44 (25) = happyShift action_30
action_44 (26) = happyShift action_31
action_44 _ = happyReduce_9

action_45 (21) = happyShift action_26
action_45 (22) = happyShift action_27
action_45 (23) = happyShift action_28
action_45 (24) = happyShift action_29
action_45 (25) = happyShift action_30
action_45 (26) = happyShift action_31
action_45 _ = happyReduce_10

action_46 (21) = happyShift action_26
action_46 (22) = happyShift action_27
action_46 (23) = happyShift action_28
action_46 (24) = happyShift action_29
action_46 (25) = happyShift action_30
action_46 (26) = happyShift action_31
action_46 _ = happyReduce_8

action_47 (21) = happyShift action_26
action_47 (22) = happyShift action_27
action_47 (23) = happyShift action_28
action_47 (24) = happyShift action_29
action_47 (25) = happyShift action_30
action_47 (26) = happyShift action_31
action_47 _ = happyReduce_7

action_48 (15) = happyShift action_20
action_48 (16) = happyShift action_21
action_48 (17) = happyShift action_22
action_48 (18) = happyShift action_23
action_48 (19) = happyShift action_24
action_48 (21) = happyShift action_26
action_48 (22) = happyShift action_27
action_48 (23) = happyShift action_28
action_48 (24) = happyShift action_29
action_48 (25) = happyShift action_30
action_48 (26) = happyShift action_31
action_48 _ = happyReduce_6

action_49 (15) = happyShift action_20
action_49 (16) = happyShift action_21
action_49 (17) = happyShift action_22
action_49 (18) = happyShift action_23
action_49 (19) = happyShift action_24
action_49 (21) = happyShift action_26
action_49 (22) = happyShift action_27
action_49 (23) = happyShift action_28
action_49 (24) = happyShift action_29
action_49 (25) = happyShift action_30
action_49 (26) = happyShift action_31
action_49 _ = happyReduce_5

action_50 _ = happyReduce_24

action_51 (9) = happyShift action_6
action_51 (10) = happyShift action_7
action_51 (14) = happyShift action_8
action_51 (27) = happyShift action_9
action_51 (30) = happyShift action_10
action_51 (32) = happyShift action_11
action_51 (33) = happyShift action_12
action_51 (6) = happyGoto action_58
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (9) = happyShift action_6
action_52 (10) = happyShift action_7
action_52 (14) = happyShift action_8
action_52 (27) = happyShift action_9
action_52 (30) = happyShift action_10
action_52 (32) = happyShift action_11
action_52 (33) = happyShift action_12
action_52 (6) = happyGoto action_57
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (13) = happyShift action_18
action_53 (14) = happyShift action_19
action_53 (15) = happyShift action_20
action_53 (16) = happyShift action_21
action_53 (17) = happyShift action_22
action_53 (18) = happyShift action_23
action_53 (19) = happyShift action_24
action_53 (20) = happyShift action_25
action_53 (21) = happyShift action_26
action_53 (22) = happyShift action_27
action_53 (23) = happyShift action_28
action_53 (24) = happyShift action_29
action_53 (25) = happyShift action_30
action_53 (26) = happyShift action_31
action_53 (35) = happyShift action_56
action_53 _ = happyReduce_26

action_54 (11) = happyShift action_55
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_22

action_56 (9) = happyShift action_6
action_56 (10) = happyShift action_7
action_56 (14) = happyShift action_8
action_56 (27) = happyShift action_9
action_56 (30) = happyShift action_10
action_56 (32) = happyShift action_11
action_56 (33) = happyShift action_12
action_56 (6) = happyGoto action_53
action_56 (7) = happyGoto action_66
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (13) = happyShift action_18
action_57 (14) = happyShift action_19
action_57 (15) = happyShift action_20
action_57 (16) = happyShift action_21
action_57 (17) = happyShift action_22
action_57 (18) = happyShift action_23
action_57 (19) = happyShift action_24
action_57 (20) = happyShift action_25
action_57 (21) = happyShift action_26
action_57 (22) = happyShift action_27
action_57 (23) = happyShift action_28
action_57 (24) = happyShift action_29
action_57 (25) = happyShift action_30
action_57 (26) = happyShift action_31
action_57 (31) = happyShift action_65
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (13) = happyShift action_18
action_58 (14) = happyShift action_19
action_58 (15) = happyShift action_20
action_58 (16) = happyShift action_21
action_58 (17) = happyShift action_22
action_58 (18) = happyShift action_23
action_58 (19) = happyShift action_24
action_58 (20) = happyShift action_25
action_58 (21) = happyShift action_26
action_58 (22) = happyShift action_27
action_58 (23) = happyShift action_28
action_58 (24) = happyShift action_29
action_58 (25) = happyShift action_30
action_58 (26) = happyShift action_31
action_58 (29) = happyShift action_64
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (13) = happyShift action_18
action_59 (14) = happyShift action_19
action_59 (15) = happyShift action_20
action_59 (16) = happyShift action_21
action_59 (17) = happyShift action_22
action_59 (18) = happyShift action_23
action_59 (19) = happyShift action_24
action_59 (20) = happyShift action_25
action_59 (21) = happyShift action_26
action_59 (22) = happyShift action_27
action_59 (23) = happyShift action_28
action_59 (24) = happyShift action_29
action_59 (25) = happyShift action_30
action_59 (26) = happyShift action_31
action_59 _ = happyReduce_4

action_60 (11) = happyShift action_63
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (35) = happyShift action_62
action_61 _ = happyReduce_28

action_62 (32) = happyShift action_61
action_62 (8) = happyGoto action_70
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (12) = happyShift action_69
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (9) = happyShift action_6
action_64 (10) = happyShift action_7
action_64 (14) = happyShift action_8
action_64 (27) = happyShift action_9
action_64 (30) = happyShift action_10
action_64 (32) = happyShift action_11
action_64 (33) = happyShift action_12
action_64 (6) = happyGoto action_68
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (9) = happyShift action_6
action_65 (10) = happyShift action_7
action_65 (14) = happyShift action_8
action_65 (27) = happyShift action_9
action_65 (30) = happyShift action_10
action_65 (32) = happyShift action_11
action_65 (33) = happyShift action_12
action_65 (6) = happyGoto action_67
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_27

action_67 (13) = happyShift action_18
action_67 (14) = happyShift action_19
action_67 (15) = happyShift action_20
action_67 (16) = happyShift action_21
action_67 (17) = happyShift action_22
action_67 (18) = happyShift action_23
action_67 (19) = happyShift action_24
action_67 (20) = happyShift action_25
action_67 (21) = happyShift action_26
action_67 (22) = happyShift action_27
action_67 (23) = happyShift action_28
action_67 (24) = happyShift action_29
action_67 (25) = happyShift action_30
action_67 (26) = happyShift action_31
action_67 _ = happyReduce_21

action_68 (13) = happyShift action_18
action_68 (14) = happyShift action_19
action_68 (15) = happyShift action_20
action_68 (16) = happyShift action_21
action_68 (17) = happyShift action_22
action_68 (18) = happyShift action_23
action_68 (19) = happyShift action_24
action_68 (20) = happyShift action_25
action_68 (21) = happyShift action_26
action_68 (22) = happyShift action_27
action_68 (23) = happyShift action_28
action_68 (24) = happyShift action_29
action_68 (25) = happyShift action_30
action_68 (26) = happyShift action_31
action_68 _ = happyReduce_20

action_69 (9) = happyShift action_6
action_69 (10) = happyShift action_7
action_69 (14) = happyShift action_8
action_69 (27) = happyShift action_9
action_69 (30) = happyShift action_10
action_69 (32) = happyShift action_11
action_69 (33) = happyShift action_12
action_69 (6) = happyGoto action_71
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_29

action_71 (13) = happyShift action_18
action_71 (14) = happyShift action_19
action_71 (15) = happyShift action_20
action_71 (16) = happyShift action_21
action_71 (17) = happyShift action_22
action_71 (18) = happyShift action_23
action_71 (19) = happyShift action_24
action_71 (20) = happyShift action_25
action_71 (21) = happyShift action_26
action_71 (22) = happyShift action_27
action_71 (23) = happyShift action_28
action_71 (24) = happyShift action_29
action_71 (25) = happyShift action_30
action_71 (26) = happyShift action_31
action_71 _ = happyReduce_3

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Def happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (Exp happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happyReduce 7 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn6  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TFct happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (DefFunc happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 4 5 happyReduction_4
happyReduction_4 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (DefVar happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "+" happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "-" happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "*" happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "/" happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "%" happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "^" happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "&&" happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "||" happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  6 happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "==" happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "!=" happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "<" happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin ">" happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  6 happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin ">=" happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  6 happyReduction_18
happyReduction_18 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Bin "<=" happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  6 happyReduction_19
happyReduction_19 (HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn6
		 (Cst happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happyReduce 6 6 happyReduction_20
happyReduction_20 ((HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 6 6 happyReduction_21
happyReduction_21 ((HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 4 6 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TFct happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (App happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_1  6 happyReduction_23
happyReduction_23 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn6
		 (Var happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  6 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Par happy_var_2
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_2  6 happyReduction_25
happyReduction_25 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Neg happy_var_2
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  7 happyReduction_26
happyReduction_26 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  7 happyReduction_27
happyReduction_27 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1:happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  8 happyReduction_28
happyReduction_28 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  8 happyReduction_29
happyReduction_29 (HappyAbsSyn8  happy_var_3)
	_
	(HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn8
		 (happy_var_1:happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 36 36 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TInt happy_dollar_dollar -> cont 9;
	TLeftParenthesis -> cont 10;
	TRightParenthesis -> cont 11;
	TSym "=" -> cont 12;
	TSym "+" -> cont 13;
	TSym "-" -> cont 14;
	TSym "*" -> cont 15;
	TSym "/" -> cont 16;
	TSym "^" -> cont 17;
	TSym "%" -> cont 18;
	TSym "&&" -> cont 19;
	TSym "||" -> cont 20;
	TComp "==" -> cont 21;
	TComp "!=" -> cont 22;
	TComp "<" -> cont 23;
	TComp "<=" -> cont 24;
	TComp ">" -> cont 25;
	TComp ">=" -> cont 26;
	TIf -> cont 27;
	TThen -> cont 28;
	TElse -> cont 29;
	TLet -> cont 30;
	TIn -> cont 31;
	TVar happy_dollar_dollar -> cont 32;
	TFct happy_dollar_dollar -> cont 33;
	TDef -> cont 34;
	TSym "," -> cont 35;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 36 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

type Exps = [Exp]
type Params = [Name]
data Line = 
    Def Def | 
    Exp Exp 
    deriving Show
data Def = 
    DefVar Name Exp |
    DefFunc Name Params Exp
    deriving Show
data Exp =
    App Name Exps     |
    Let Name Exp Exp  |
    Par Exp           |
    Neg Exp         |
    Bin Op Exp Exp  | 
    If Exp Exp Exp |
    Var Name | 
    Cst Int 
    deriving Show
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
