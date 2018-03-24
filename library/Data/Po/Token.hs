module Data.Po.Token
  ( Token (..)
  , Tokens
  ) where

import Data.Text (Text)

data Token = BOF
           | EOF
           | EOL
           | ExtractedComment {comment :: Text}
           | Flag {flag :: Text}
           | Reference {reference :: Text}
           | TranslatorComment {comment :: Text}
           | WhiteSpace {long :: Int}
           deriving (Eq, Ord)

instance Show Token where
  show BOF = "BOF"
  show EOF = "EOF"
  show EOL = "EOL"
  show (ExtractedComment _) = "ExtractedComment"
  show (Flag _) = "Flag"
  show (Reference _) = "Reference"
  show (TranslatorComment _) = "TranslatorComment"
  show (WhiteSpace {long = ln}) = "WhiteSpace (" ++ show ln ++ ")"

type Tokens = [Token]
