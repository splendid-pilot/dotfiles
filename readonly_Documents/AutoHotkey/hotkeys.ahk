#SingleInstance Force
; Remember to change the permission in registry editor.
g_keyName := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System"
g_valueName := "DisableLockWorkstation"

g_isUnlocked := true

; Toggle lock workstatoin
#F1:: {
    if (RegRead(g_keyName, g_valueName) == 1) {
        RegWrite 0, "REG_DWORD", g_keyName, g_valueName
        MsgBox "LockWorkStation is enabled"
    } else {
        RegWrite 1, "REG_DWORD", g_keyName, g_valueName
        MsgBox "LockWorkStation is disabled"
    }
}

#Enter:: {
    ;    Run "wezterm-gui connect unix"
    Run "wezterm-gui ssh 127.0.0.1"
}


#+Enter:: {
    Run "wezterm-gui"
}

; Run default browser
#b:: {
    Run "https:"
}

; Start tiling WM
#c:: {
    RunWait("komorebic start --ahk", , "Hide")
}

; Stop WM
#+c:: {
    RunWait("komorebic stop", , "Hide")
}
#v:: {
    Run("copyq show")
}
; Lock Windows regardless LockWorkStation stsatus
#F2:: {
    if (RegRead(g_keyName, g_valueName) == 1) {
        RegWrite 0, "REG_DWORD", g_keyName, g_valueName
    }
    Sleep 1000
    DllCall("LockWorkStation")
    SendMessage 0x0112, 0xF170, 2, , "Program Manager"
}

; Oil like navigation in explorer
#HotIf WinActive("ahk_class CabinetWClass") or WinActive("ahk_class ExploreWClass")
{
    `:: {
        Send "!{Up}"
    }
}
#HotIf


Loop
{
    Sleep 5000
    if (!WinExist("A"))
    {
        g_isUnlocked := true
        continue
    }
    if (WinGetProcessName("A") == "LockApp.exe")
    {
        g_isUnlocked := true
        continue
    }
    if (g_isUnlocked)
    {
        RegWrite 1, "REG_DWORD", g_keyName, g_valueName
        g_isUnlocked := false
    }
}