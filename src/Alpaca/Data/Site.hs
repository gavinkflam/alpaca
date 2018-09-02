{-# LANGUAGE TemplateHaskell #-}

module Alpaca.Data.Site
  ( Site (..)
  -- Lenses
  , name
  , articles
  ) where

import Alpaca.Data.Article (Article)
import Control.Lens (makeLenses)
import Data.Text.Lazy (Text)

data Site = Site
  { _name     :: Text
  , _articles :: [Article]
  }

makeLenses ''Site
