{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes        #-}

module Web.Spock.Shpadoinkle ( spockShpadoinkle ) where

import Control.Monad.IO.Class
import Data.Text.Encoding (encodeUtf8)
import Shpadoinkle
import Shpadoinkle.Backend.Static
import Web.Spock.Action

spockShpadoinkle :: forall m h p a e ctx b. MonadIO m => IsHtml h p => IsProp p e => h a -> ActionCtxT ctx m b
spockShpadoinkle x = do
  setHeader "Content-Type" "text/html; charset=utf-8"
  bytes (encodeUtf8 (renderStatic x))
