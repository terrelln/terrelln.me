module Handler.Euler where

import Import
import Yesod.Form.Bootstrap3

getEulerR :: Handler Html
getEulerR = error "Not yet implemented: getEulerR"

postEulerR :: Handler Html
postEulerR = error "Not yet implemented: postEulerR"

getEulerSolutionR :: ProblemNumber -> Handler Html
getEulerSolutionR = error "Not yet implemented: getEulerSolutionR"

postEulerSolutionR :: ProblemNumber -> Handler Html
postEulerSolutionR num = error "Not yet implemented: postEulerSolutionR"

solutionForm :: UserId -> Form EulerSolution
solutionForm userId = renderBootstrap3 BootstrapBasicForm $ EulerSolution
    <$> pure userId
    <*> (ProblemNumber <$> areq intField "Problem Number" Nothing)
    <*> areq intField "Solution" Nothing
    <*> (unTextarea <$> areq textareaField "Markdown" Nothing)
    <*> pure Nothing
