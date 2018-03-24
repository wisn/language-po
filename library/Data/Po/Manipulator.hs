module Data.Po.Manipulator
  ( addEOF
  , addEOL
  , addExtractedComment
  , addFlag
  , addReference
  , addTranslatorComment
  , addWhiteSpace
  , initYAML
  ) where

import Data.Po.Token
import Data.Text (Text)

initYAML :: Tokens
initYAML = [BOF]

addEOF :: Tokens -> Tokens
addEOF po = po ++ [EOF]

addEOL :: Tokens -> Tokens
addEOL po = po ++ [EOL]

addExtractedComment :: Tokens -> Text -> Tokens
addExtractedComment po co = po ++ [ExtractedComment {comment = co}]

addFlag :: Tokens -> Text -> Tokens
addFlag po fl = po ++ [Flag { flag = fl}]

addReference :: Tokens -> Text -> Tokens
addReference po ref = po ++ [Reference {reference = ref}]

addTranslatorComment :: Tokens -> Text -> Tokens
addTranslatorComment po co = po ++ [TranslatorComment {comment = co}]

addWhiteSpace :: Tokens -> Int -> Tokens
addWhiteSpace po ln = po ++ [WhiteSpace {long = ln}]
