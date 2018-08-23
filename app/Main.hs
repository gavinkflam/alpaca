module Main where

import System.Environment
import Alpaca

main :: IO ()
main = getArgs >>= print . hello . head
