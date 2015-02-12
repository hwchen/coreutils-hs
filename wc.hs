-- word count

import Data.ByteString (ByteString)
import qualified Data.ByteString as B
import Data.Encoding
import Data.Encoding.UTF8
import System.Environment
import System.Exit

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

parse ["-h"] = usage >> exit
parse ["-v"] = version >> exit
parse []     = getContents
parse fs     = concat `fmap` mapM readFile fs

usage = putStrLn "Usage: wc [-vh] [file..]"
version = putStrLn "wc in Haskell version 0.1"
exit = exitWith ExitSuccess
die = exitWith (ExitFailure 1)

main = getArgs >>= parse >>= putStrLn . show . wordCount
-- may need a library or monads to parse the different options.
