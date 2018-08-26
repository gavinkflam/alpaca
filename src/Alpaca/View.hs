{-# LANGUAGE OverloadedStrings #-}

module Alpaca.View
  ( hello
  ) where

import Data.Text.Lazy (Text)

hello :: Text -> Text
hello s = "<h1>hello " <> s <> "</h1>"
