{-# LANGUAGE OverloadedStrings #-}

module Alpaca.Utils.Article
  ( ArticleRefs(..)
  , articleHashMap
  , articlePath
  ) where

import Alpaca.Data.Article (Article, slug, datePublished)
import Alpaca.Utils.Time (yearText)
import Control.Lens ((^.))
import Data.HashMap.Strict (HashMap, fromList)
import Data.Monoid (mconcat)
import Data.Time.Format (defaultTimeLocale, formatTime)
import Data.Text.Lazy (Text)

data ArticleRefs = ArticleFullSlugRef Text | ArticleRef Article

articleHashMap :: [Article] -> HashMap Text Article
articleHashMap as = fromList $ map keyValue as

articlePath :: ArticleRefs -> Text
articlePath (ArticleFullSlugRef fullSlug) = mconcat ["/articles/", fullSlug]
articlePath (ArticleRef article) = articlePath $
  ArticleFullSlugRef $ fullSlug article

keyValue :: Article -> (Text, Article)
keyValue a = (fullSlug a, a)

fullSlug :: Article -> Text
fullSlug a = mconcat [yearText $ a ^. datePublished, "-", a ^. slug]
