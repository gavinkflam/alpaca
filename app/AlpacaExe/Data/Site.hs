{-# LANGUAGE OverloadedStrings #-}

module AlpacaExe.Data.Site
  ( site
  ) where

import Alpaca.Data.Site
import AlpacaExe.Data.Article.Y2018.DummyArticle (dummyArticle)

site :: Site
site = Site
  { _name     = "gavin.hk"
  , _articles =
    [ dummyArticle
    ]
  }
