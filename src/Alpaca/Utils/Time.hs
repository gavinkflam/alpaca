module Alpaca.Utils.Time
  ( yearText
  ) where

import Data.Time.Calendar (Day)
import Data.Time.Format (defaultTimeLocale, formatTime)
import Data.Text.Lazy (Text, pack)

yearText :: Day -> Text
yearText d = pack $ formatTime defaultTimeLocale "%Y" d
