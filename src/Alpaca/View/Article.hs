{-# LANGUAGE OverloadedStrings #-}

module Alpaca.View.Article
  ( renderArticle
  , renderArticleList
  ) where

import Alpaca.Data.Article
import Alpaca.View.Layout (renderWithLayout)
import Alpaca.View.Section (renderSections)
import Control.Lens (view)
import Data.Time.Calendar (toGregorian, showGregorian)
import Data.Text.Lazy (Text)
import Text.Blaze.Html5 as H hiding (title, map)
import Text.Blaze.Html5.Attributes as A hiding (title)

renderArticle :: Article -> Html
renderArticle article = docTypeHtml $ do
  let t = view title article
  renderWithLayout t $ section $ do
    h1 $ toHtml t
    time $ toHtml $ showGregorian $ view datePublished article
    renderSections $ view sections article

renderArticleList :: [Article] -> Html
renderArticleList articles = docTypeHtml $
  renderWithLayout "Articles" $ toHtml $ map renderArticleListItem articles

renderArticleListItem :: Article -> Html
renderArticleListItem article = H.article $ do
  let t = view title article
  h1 $ toHtml t
