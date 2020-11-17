module Main where

import AI
import System.Environment (getArgs)

main :: IO ()
main = fmap head getArgs >>= (print . ai . read)


-- getInt :: IO Int
-- getInt = fmap read getLine
