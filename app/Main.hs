{-# LANGUAGE OverloadedStrings #-}

module Main where

import Alpaca.Data.Site (articles)
import Alpaca.View.Article (renderArticle, renderArticleList)
import Alpaca.Utils.Article (articleHashMap)
import AlpacaExe.Data.Site (site)
import Control.Lens ((^.))
import Data.HashMap.Strict ((!))
import Text.Blaze.Html (Html)
import qualified Text.Blaze.Html.Renderer.Text as R
import Web.Scotty

main :: IO ()
main = scotty 3000 $ do
  let am = articleHashMap $ site ^. articles

  get "/articles" $
    renderHtml $ renderArticleList $ site ^. articles

  get "/articles/:fullSlug" $ do
    fullSlug <- param "fullSlug" `rescue` (\_ -> return "not-found")
    renderHtml $ renderArticle $ am ! fullSlug

-- Utils
renderHtml :: Html -> ActionM ()
renderHtml = html . R.renderHtml
