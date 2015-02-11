-- word count

import Data.ByteString (ByteString)
import qualified Data.ByteString as B
import Data.Encoding
import Data.Encoding.UTF8

-- ByteString uses Word8 as base, not Char8 (truncates to one byte)
-- but have to encode into utf8? This counts bytes, not char.
byteCount :: String -> Int
byteCount = B.length . encodeStrictByteString UTF8 

charCount :: String -> Int
charCount = length

wordCount :: String -> Int
wordCount = length . words

lineCount :: String -> Int
lineCount = length . lines

maxLineLength :: String -> Int
maxLineLength = maximum . map length . lines
