{-# LANGUAGE OverloadedStrings #-}

module Alpaca
  ( helloView
  ) where

import Data.Text.Lazy (Text)

helloView :: Text -> Text
helloView s = "<h1>hello " <> s <> "</h1>"
