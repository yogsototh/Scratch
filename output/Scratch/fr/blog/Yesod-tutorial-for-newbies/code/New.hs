
module Handler.New where

import Import

getNewR :: Handler RepHtml
getNewR = do
    defaultLayout $ do
        $(widgetFile "new")

postNewR :: Handler RepHtml
postNewR =  do
    postedText <- runInputPost $ ireq textField "content"
    defaultLayout $ do
        $(widgetFile "posted")
