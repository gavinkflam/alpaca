module AlpacaProp where

import Alpaca
import Test.QuickCheck

prop_hello :: [Char] -> Bool
prop_hello s = drop (length "hello ") (hello s) == id s
