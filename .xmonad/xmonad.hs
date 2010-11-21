import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Scratchpad
import System.IO

modKey = mod4Mask

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]

myTerminal :: String
myTerminal = "terminator"

main = do
    xmproc <- spawnPipe "xmobar"
    trayproc <- spawnPipe "killall trayer; trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --alpha 0 --tint 0x000000 --height 12"
    nmappletproc <- spawnPipe "killall NetworkManager; nm-applet --sm-disable"
    powermanagerproc <- spawnPipe "gnome-power-manager"
    xmonad $ defaultConfig
        { terminal = myTerminal
        , manageHook = manageHook defaultConfig <+> manageDocks <+> myManageHook <+> scratchpadManageHookDefault
        , layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
          { ppOutput = hPutStrLn xmproc
          , ppTitle = xmobarColor "green" "" . shorten 50
          }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((mod4Mask, xK_s), scratchpadSpawnActionTerminal "urxvt")
        , ((0, xK_Print), spawn "scrot")
        ]
