{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}

module Main where

import Alpaca.Data.Article
import Alpaca.Data.Section
import Alpaca.View.Article (renderArticle)
import Data.String.Here (here)
import Text.Blaze.Html (Html)
import Data.Time.Calendar (fromGregorian)
import qualified Text.Blaze.Html.Renderer.Text as R
import Web.Scotty

main :: IO ()
main = scotty 3000 $
  get "/article/dummy" $ do
    renderHtml $ renderArticle dummyArticle

-- Articles
dummyArticle :: Article
dummyArticle = Article
  { _title         = "Dummy article"
  , _slug          = "dummy"
  , _coverImage    = "N/A"
  , _sections      =
    [ Paragraph [here|
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
In ultrices urna vitae libero vulputate mollis.
In ornare sollicitudin urna vitae pharetra.
Aliquam laoreet pulvinar mi, in dictum massa congue vitae.
|]
    , DivisionHeader "Lorem Ipsum"
    , Paragraph [here|
Praesent id orci luctus, dictum lacus nec, posuere nunc.
Nunc tellus justo, tincidunt id velit sit amet, vulputate mattis ligula.
Duis iaculis sollicitudin tempor.
Donec imperdiet, est et suscipit consequat, dolor eros placerat ex,
in cursus dui nulla et quam.
Sed nec aliquam libero.  Nulla in leo bibendum, fermentum eros at, ornare mi.
Etiam sit amet sagittis mi.
Vestibulum fringilla elementum velit, consectetur dictum ipsum facilisis vel.
|]
    , Paragraph [here|
Mauris dapibus tortor erat, eget pharetra ipsum lacinia quis.
Vestibulum rhoncus turpis quis risus ultrices, vitae luctus mi viverra.
Fusce nec pretium libero.  In facilisis quis odio eu consectetur.
Mauris posuere euismod ligula aliquet auctor.
In ac tortor eget purus volutpat scelerisque.
Etiam condimentum lorem vitae mollis consectetur.
Sed a metus in nibh elementum tincidunt ut at nisl.
|]
    ]
  , _datePublished = fromGregorian 2018 8 29
  , _dateModified  = fromGregorian 2018 8 29
  }

-- Utils
renderHtml :: Html -> ActionM ()
renderHtml = html . R.renderHtml
