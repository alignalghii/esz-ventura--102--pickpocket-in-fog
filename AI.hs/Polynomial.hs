module Polynomial where

import Q
import Data.List (inits)

nat0, natP :: [Int]
natP = [1..]
nat0 = 0: natP

simplestPowerStream :: Num x =>  x -> [x]
simplestPowerStream x = map (x^) nat0

generalizedGaussSeriesStream :: Int -> [Int]
generalizedGaussSeriesStream n = streamToSeriesStream $ map (^ n) natP

-- powSeries2 :: Int -> Int
-- powSeries2 n = powSeriesStream2 !! n

type Seq a = Int -> a

polynomFun  :: [Q] -> Q   -> Q
polynomFun coeffs x = sum $ zipWith (*) coeffs (simplestPowerStream x)

polynomSeq :: [Q] -> Seq Q
polynomSeq qs = polynomFun qs . fromIntegral

polynomStream :: [Q] -> [Q]
polynomStream = seqToStream . polynomSeq

seqToStream :: (Seq a) -> [a]
seqToStream = flip map [0 ..]

streamToSeriesStream :: Num a => [a] -> [a]
streamToSeriesStream (a:as) = 0 : (map (a +) (streamToSeriesStream as))
--streamToSeriesStream = map sum . inits


compareStreams :: Eq a => [a] -> [a] -> Bool
compareStreams (a1:a2:a3:a4:a5:a6:a7:_) (b1:b2:b3:b4:b5:b6:b7:_) = a1 == b1 && a2 == b2 && a3 == b3 && a4 == b4 && a5 == b5 && a6 == b6 && a7 == b7 
--compareStreams as bs = and $ take 7 $ zipWith (==) as bs

compareSeqAndSeriesStreams :: [Q] -> [Int] -> Bool
compareSeqAndSeriesStreams seqStream seriesStream = compareStreams (seqStream) (map fromIntegral seriesStream)

-- compareSeqFuns :: Eq a => (Int -> a) -> (Int -> a) -> Bool
-- compareSeqFuns f g = compareStreams (toStream f) (toStream g)

