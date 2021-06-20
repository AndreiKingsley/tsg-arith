module Arith where

import TSGInt

zero' :: Exp
zero' = ATOM "0"

one' :: Exp
one' = ATOM "1"

four' :: Exp
four' = CONS one' $ CONS one' $ CONS one' $ CONS one' zero'

toInt :: Exp -> Int
toInt (ATOM "0") = 0
toInt (CONS (ATOM "1") tail) = 1 + (toInt tail)
toInt _ = undefined

fromInt :: Int -> Exp
fromInt 0 = zero'
fromInt n = CONS one' $ fromInt (n - 1)

sumNotNeg :: FDef
sumNotNeg =
   DEFINE 
      "sumNotNeg"
      [num1, num2]
      (ALT 
         (CONS' num1 num_head num_tail zer_atom)
            (CALL "sumNotNeg" [num_tail, CONS one' num2])
            (RETURN num2)
      )
   where
     num1 = PVE "num1"
     num2 = PVE "num2"
     num_head = PVE "num_head"
     num_tail = PVE "num_tail"
     zer_atom = PVA "zer_atom"
     
multStaff :: FDef
multStaff =
   DEFINE 
      "multStaff"
      [num1, num2, acc1, acc2, acc_res]
      (ALT 
         (CONS' acc1 acc1_head acc1_tail zer_atom1)
            (ALT
                  (CONS' acc2 acc2_head acc2_tail zer_atom2)
                     (CALL "multStaff" [num1, num2, acc1, acc2_tail, CONS one' acc_res])
                     (CALL "multStaff" [num1, num2, acc1_tail, num2, acc_res])
            )
         (RETURN acc_res)
      )
   where
     num1 = PVE "num1"
     num2 = PVE "num2"
     acc1 = PVE "acc1"
     acc2 = PVE "acc2"
     acc_res = PVE "acc_res"
     num_head = PVE "num_head"
     num_tail = PVE "num_tail"
     zer_atom = PVA "zer_atom"
     acc1_head = PVE "acc1_head"
     acc1_tail = PVE "acc1_tail"
     zer_atom1 = PVA "zer_atom1"
     acc2_head = PVE "acc2_head"
     acc2_tail = PVE "acc2_tail"
     zer_atom2 = PVA "zer_atom2"
     
multNotNeg :: FDef
multNotNeg = 
   DEFINE
      "multNotNeg"
      [num1, num2]
      (CALL "multStaff" [num1, num2, num1, num2, zero'])
      where
         num1 = PVE "num1"
         num2 = PVE "num2"

   
sumProg :: Prog
sumProg = [sumNotNeg]

multProg :: Prog
multProg = [multNotNeg, multStaff]

