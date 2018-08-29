{-# LANGUAGE TemplateHaskell #-}

module Alpaca.Data.Article
  ( Article (..)
  -- Lenses
  , title
  , slug
  , coverImage
  , sections
  , datePublished
  , dateModified
  ) where

import Alpaca.Data.Section (Section)
import Control.Lens (makeLenses)
import Data.Time.Calendar (Day)
import Data.Text.Lazy (Text)

data Article = Article
  { _title         :: Text
  , _slug          :: Text
  , _coverImage    :: Text
  , _sections      :: [Section]
  , _datePublished :: Day
  , _dateModified  :: Day
  }

makeLenses ''Article
