module Text.Po.Token
  ( Token (..)
  , Tokens
  ) where

data Token = BOF
           | EOF
           | EOL
           | ExtractedComment {comment :: String}
           | Flag {flag :: String}
           | Reference {reference :: String}
           | TranslatorComment {comment :: String}
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
