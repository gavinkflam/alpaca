module Alpaca.Data.Section
  ( Section (..)
  ) where

import Data.Text.Lazy (Text)
import Text.Blaze.Html5 (Html)

data Section = DivisionHeader Text
             | SubdivisionHeader Text
             | ParagraphHeader Text
             | Paragraph Html
             | Snippet Text Text
             | Console Text
             | Image Text
