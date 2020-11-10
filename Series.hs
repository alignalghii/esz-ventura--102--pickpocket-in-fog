module Series where

series, formula :: Float -> Float
series  p = sum $ take infinity $ zipWith (*) naturals (map (p **) naturals)
formula p = p / ((1-p)**2)

equality :: Float -> Bool
equality p = series p =~= formula p

theorem :: Bool
theorem = all equality sample

sample :: [Float]
sample = map (1 /) [2..10]

naturals :: (Num n, Enum n) => [n]
naturals = [0..]

infinity :: Int
infinity = 100

infinitesimal :: Float
infinitesimal = 0.01

infix 1 =~=
(=~=) :: Float -> Float -> Bool
a =~= b = abs (a - b) < infinitesimal

