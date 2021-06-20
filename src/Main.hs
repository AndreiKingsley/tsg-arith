module Main where

import TSGInt
import Arith

tsgSum :: Int -> Int -> Int
tsgSum x y = toInt (int sumProg [(fromInt x), (fromInt y)])

tsgMult :: Int -> Int -> Int
tsgMult x y = toInt (int multProg [(fromInt x), (fromInt y)])


