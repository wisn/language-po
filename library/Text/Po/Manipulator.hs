module Text.Po.Manipulator
  ( addEOF
  , addEOL
  , addExtractedComment
  , addFlag
  , addReference
  , addTranslatorComment
  , addWhiteSpace
  , initYAML
  ) where

import Text.Po.Token

initYAML :: Tokens
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
