{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Alpaca.View as V
import Text.Blaze.Html (Html)
import qualified Text.Blaze.Html.Renderer.Text as R
import Web.Scotty

main :: IO ()
main = scotty 3000 $
  get "/" $ do
    name <- param "name" `rescue` (\_ -> return "haskell")
    renderHtml $ V.hello name

renderHtml :: Html -> ActionM ()
renderHtml = html . R.renderHtml
