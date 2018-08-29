module Alpaca.View.Layout
  ( renderWithLayout
  ) where

import Data.Text.Lazy (Text)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

renderWithLayout :: Text -> Html -> Html
renderWithLayout title body =
  docTypeHtml $ do
    H.head $ do
      H.title $ toHtml title
    H.body body
