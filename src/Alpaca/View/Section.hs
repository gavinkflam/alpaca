module Alpaca.View.Section
  ( renderSection
  , renderSections
  ) where

import Alpaca.Data.Section
import Data.Text.Lazy (Text)
import Text.Blaze.Html5 as H hiding (map)
import Text.Blaze.Html5.Attributes as A

renderSection :: Section -> Html

renderSection (DivisionHeader t)    = h2 $ toHtml t
renderSection (SubdivisionHeader t) = h3 $ toHtml t
renderSection (ParagraphHeader t)   = h4 $ toHtml t
renderSection (Paragraph h)         = p h
renderSection (Snippet _lang t)     = pre $ toHtml t
renderSection (Console t)           = pre $ toHtml t
renderSection (Image t)             = img ! src (toValue t)

renderSections :: [Section] -> Html
renderSections xs = toHtml $ map renderSection xs
