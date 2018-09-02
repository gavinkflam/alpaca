{-# LANGUAGE OverloadedStrings #-}

module Alpaca.Utils.Article
  ( articleHashMap
  ) where

import Alpaca.Data.Article (Article, slug, datePublished)
import Alpaca.Utils.Time (yearText)
import Control.Lens ((^.))
import Data.HashMap.Strict (HashMap, fromList)
import Data.Monoid (mconcat)
import Data.Time.Format (defaultTimeLocale, formatTime)
import Data.Text.Lazy (Text)

articleHashMap :: [Article] -> HashMap Text Article
articleHashMap as = fromList $ map keyValue as

keyValue :: Article -> (Text, Article)
keyValue a = (fullSlug a, a)

fullSlug :: Article -> Text
fullSlug a = mconcat [yearText $ a ^. datePublished, "-", a ^. slug]
