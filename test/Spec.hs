module Main where

import Alpaca
import AlpacaProp
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
  describe "hello" $ do
    it "says hello me for hello me" $
      hello "me" `shouldBe` "hello me"
    it "adds hello before any names" $
      property $ prop_hello
