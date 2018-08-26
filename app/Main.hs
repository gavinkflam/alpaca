{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Alpaca.View as V
import Web.Scotty

main :: IO ()
main = scotty 3000 $
  get "/" $ do
    name <- param "name" `rescue` (\_ -> return "haskell")
    html $ V.hello name
