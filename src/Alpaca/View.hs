{-# LANGUAGE OverloadedStrings #-}

module Alpaca.View
  ( hello
  ) where

import Data.Text.Lazy (Text)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

hello :: Text -> Html
hello name = docTypeHtml $ do
  let greeting = toHtml $ "hello " <> name
  H.head $ do
    H.title greeting
  body $ do
    h1 greeting
