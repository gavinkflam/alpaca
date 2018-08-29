module Alpaca.View.Article
  ( renderArticle
  ) where

import Alpaca.Data.Article as C
import Alpaca.View.Layout (renderWithLayout)
import Control.Lens (view)
import Data.Time.Calendar (toGregorian, showGregorian)
import Data.Text.Lazy (Text)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A

renderArticle :: Article -> Html
renderArticle article = docTypeHtml $ do
  let t = view C.title article
  renderWithLayout
    t $
    section $ do
      h1 $ toHtml t
      time $ toHtml $ showGregorian $ view C.datePublished article
