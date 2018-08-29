{-# LANGUAGE OverloadedStrings #-}

module Main where

import Alpaca.Data.Article
import Alpaca.View.Article (renderArticle)
import Text.Blaze.Html (Html)
import Data.Time.Calendar (fromGregorian)
import qualified Text.Blaze.Html.Renderer.Text as R
import Web.Scotty

main :: IO ()
main = scotty 3000 $
  get "/article/dummy" $ do
    renderHtml $ renderArticle dummyArticle

-- Articles
dummyArticle :: Article
dummyArticle = Article
  { _title         = "Dummy article"
  , _slug          = "dummy"
  , _coverImage    = "N/A"
  , _sections      = []
  , _datePublished = fromGregorian 2018 8 29
  , _dateModified  = fromGregorian 2018 8 29
  }

-- Utils
renderHtml :: Html -> ActionM ()
renderHtml = html . R.renderHtml
