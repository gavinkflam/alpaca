{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}

module AlpacaExe.Data.Article.Y2018.DummyArticle
  ( dummyArticle
  ) where

import Alpaca.Data.Article
import Alpaca.Data.Section
import Data.String.Here (here)
import Data.Time.Calendar (fromGregorian)

dummyArticle :: Article
dummyArticle = Article
  { _title         = "Dummy Article"
  , _slug          = "dummy-article"
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
    , DivisionHeader "Etiam erat velit"
    , SubdivisionHeader "Tellus id"
    , Paragraph [here|
Hendrerit gravida rutrum quisque non tellus orci ac auctor augue.
Bibendum enim facilisis gravida neque convallis a cras.
Pharetra et ultrices neque ornare aenean.
Nec ultrices dui sapien eget mi. Sodales ut etiam sit amet nisl purus in.
|]
    , ParagraphHeader "Porta nibh"
    , Snippet "ruby" [here|
def query
  params[:q]
end
|]
    , ParagraphHeader "Ornare lectus"
    , Snippet "haskell" [here|
-- Quicksort
-- https://learnxinyminutes.com/docs/haskell/
qsort [] = []
qsort (p:xs) = qsort lesser ++ [p] ++ qsort greater
    where lesser  = filter (< p) xs
          greater = filter (>= p) xs
|]
    , DivisionHeader "Tortor aliquam nulla"
    , SubdivisionHeader "Sagittis id"
    , Console [here|
% ls -lA | grep 'zsh'
-rw-r--r--  1 gavin gavin    346 Aug 31 23:50 .zshenv
-rw-------  1 gavin gavin  38494 Sep  1 12:19 .zsh_history
-rw-r--r--  1 gavin gavin    591 Aug  5 03:08 .zsh_plugins
-rw-r--r--  1 gavin gavin   2320 Aug 31 23:50 .zshrc
-rw-r--r--  1 gavin gavin   4128 Aug  5 03:08 .zsh_theme
|]
    , SubdivisionHeader "Urna et pharetra"
    , Image "https://www.haskell.org/static/img/haskell-logo.svg"
    ]
  , _datePublished = fromGregorian 2018 8 29
  , _dateModified  = fromGregorian 2018 8 29
  }
