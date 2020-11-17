module AI where

import Polynomial
import Sample
import Q 

-- parCheck q4 = compareStreams (parSeqFun qtpl) ((%1) . sumsquareSeqFun)
check :: [Q] -> Bool
check qs = compareSeqAndSeriesStreams (polynomStream qs) (generalizedGaussSeriesStream $ powerFor qs)


ai :: Int -> [[Q]]
ai n = filter check (sample $ (+ 2) n) 

powerFor :: [a] -> Int
powerFor = flip (-) 2 . length
