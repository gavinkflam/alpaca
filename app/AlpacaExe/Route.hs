{-# LANGUAGE OverloadedStrings #-}

module AlpacaExe.Route
  ( articleRoutePattern
  ) where

import Alpaca.Utils.Article (ArticleRefs(..), articlePath)
import Data.String (fromString)
import Data.Text.Lazy (unpack)
import Web.Scotty (RoutePattern)

articleRoutePattern :: RoutePattern
articleRoutePattern = fromString $ unpack $
  articlePath $ ArticleFullSlugRef ":fullSlug"
