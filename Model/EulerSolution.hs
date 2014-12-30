-- @Model/EulerSolution.hs
module Model.EulerSolution where

import Database.Persist.TH
import qualified Data.Text as T
import Prelude
import Data.Int (Int64)
import Yesod

newtype ProblemNumber = ProblemNumber Int64
    deriving (Show, Read, Eq)
derivePersistField "ProblemNumber"

instance PathPiece ProblemNumber where
    toPathPiece (ProblemNumber i) = T.pack $ show i
    fromPathPiece s =
        case reads $ T.unpack s of
            (i, ""):_
                | i < 1 -> Nothing
                | otherwise -> Just $ ProblemNumber i
            [] -> Nothing
            _ -> Nothing
