{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_Presley (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/fostyr/.cabal/bin"
libdir     = "/home/fostyr/.cabal/lib/x86_64-linux-ghc-9.0.2/Presley-0.1.0.0-inplace-presley"
dynlibdir  = "/home/fostyr/.cabal/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/fostyr/.cabal/share/x86_64-linux-ghc-9.0.2/Presley-0.1.0.0"
libexecdir = "/home/fostyr/.cabal/libexec/x86_64-linux-ghc-9.0.2/Presley-0.1.0.0"
sysconfdir = "/home/fostyr/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Presley_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Presley_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Presley_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Presley_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Presley_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Presley_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
