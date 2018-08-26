{-# LANGUAGE OverloadedStrings #-}

module Main where

import Alpaca
import Web.Scotty

main :: IO ()
main = scotty 3000 $
  get "/" $ do
    name <- param "name" `rescue` (\_ -> return "haskell")
    html $ helloView name
