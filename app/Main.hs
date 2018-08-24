{-# LANGUAGE OverloadedStrings #-}

module Main where

import Alpaca
import Data.Monoid (mconcat)
import Web.Scotty

main :: IO ()
main = scotty 3000 $
  get "/" $ do
    name <- param "name" `rescue` (\_ -> return "haskell")
    html $ mconcat ["<h1>hello ", name, "</h1>"]
