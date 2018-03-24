module Text.Po.Token
  ( Token (..)
  , Tokens
  , addEOF
  , addEOL
  , addWhiteSpace
  , addExtractedComment
  , initYAML
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

initYAML :: [Token]
initYAML = [BOF]

addEOF :: Tokens -> Tokens
addEOF po = po ++ [EOF]

addEOL :: Tokens -> Tokens
addEOL po = po ++ [EOL]

addExtractedComment :: Tokens -> String -> Tokens
addExtractedComment po co = po ++ [ExtractedComment {comment = co}]

addFlag :: Tokens -> String -> Tokens
addFlag po fl = po ++ [Flag { flag = fl}]

addReference :: Tokens -> String -> Tokens
addReference po ref = po ++ [Reference {reference = ref}]

addTranslatorComment :: Tokens -> String -> Tokens
addTranslatorComment po co = po ++ [TranslatorComment {comment = co}]

addWhiteSpace :: Tokens -> Int -> Tokens
addWhiteSpace po ln = po ++ [WhiteSpace {long = ln}]
