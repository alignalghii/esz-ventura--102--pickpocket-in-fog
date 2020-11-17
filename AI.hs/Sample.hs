{-# LANGUAGE NPlusKPatterns #-}

module Sample where

import Q
import Data.List (nub)
import Control.Monad (liftM2)

small, small0 :: [Int]
small = [1..12]
small0 = 0 : small

smallQ :: [Q]
smallQ =
    [
        0, 1, 2, 3, 4, 5, 6,-- 7, 8, 9, 10, 11, 12,
        1%2, 3%2, 5%2,-- 7%2, 9%2, 11%2,
        1%3, 2%3, 4%3, 5%3,-- 7%3, 8%3, 10%3, 11%3,
        1%4, 3%4, 5%4,-- 7%4, 9%4, 11%4,
        1%5, 2%5, 3%5, 4%5,-- 6%5, 7%5, 8%5, 9%5, 11%5, 12%5,
        1%6, 5%6--, 7%6, 11%6,
        --1%7, 2%7, 3%7, 4%7, 5%7, 6%7,-- 8%7, 9%7, 11%7, 12%7,
        --1%8, 3%8, 5%8,-- 7%8, 9%8, 11%8,
        --1%9, 2%9, 4%9, 5%9,-- 7%9, 8%9, 10%9, 11%9,
        --1%10, 3%10,-- 7%10, 9%10, 11%10,
        --1%11, 2%11, 3%11, 4%11, 5%11, 6%11,-- 7%11, 8%11, 9%11, 10%11, 11%11, 12%11,
        --1%12, 5%12,-- 7%12, 11%12
    ] -- nub [m % n | m <- small0, n <- small]

sample :: Int -> [[Q]]
sample 0       = [[]]
sample (n + 1) = liftM2 (:) smallQ (sample n)
