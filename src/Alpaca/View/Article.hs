{-# LANGUAGE OverloadedStrings #-}

module Alpaca.View.Article
  ( renderArticle
  , renderArticleList
  ) where

import Alpaca.Data.Article
import Alpaca.View.Layout (renderWithLayout)
import Alpaca.View.Section (renderSections)
import Control.Lens ((^.))
import Data.Time.Calendar (toGregorian, showGregorian)
import Data.Text.Lazy (Text)
import Text.Blaze.Html5 as H hiding (title, map)
import Text.Blaze.Html5.Attributes as A hiding (title)

renderArticle :: Article -> Html
renderArticle article = docTypeHtml $
  renderWithLayout (article ^. title) $ section $ do
    h1 $ toHtml $ article ^. title
    renderArticlePublishedDate article
    renderSections $ article ^. sections

renderArticleList :: [Article] -> Html
renderArticleList articles = docTypeHtml $
  renderWithLayout "Articles" $ toHtml $ map renderArticleListItem articles

renderArticlePublishedDate :: Article -> Html
renderArticlePublishedDate article = time $ toHtml $
  showGregorian $ article ^. datePublished

renderArticleListItem :: Article -> Html
renderArticleListItem article = H.article $ do
  h1 $ toHtml $ article ^. title
  renderArticlePublishedDate article
