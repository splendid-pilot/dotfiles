#SingleInstance Force
; Remember to change the permission in registry editor.
g_keyName := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System"
g_valueName := "DisableLockWorkstation"

; Toggle lock workstatoin
#F1:: {
    if (RegRead(g_keyName, g_valueName) == 1) {
        RegWrite 0, "REG_DWORD", g_keyName, g_valueName
    } else {
        RegWrite 1, "REG_DWORD", g_keyName, g_valueName
    }
}

; Run windows terminal with Ubuntu
#Enter:: {
    Run "wt nt -p Ubuntu"
}

; Run windows terminal with PowerShell
#+Enter:: {
    Run "wt nt -p PowerShell"
}

; Run default browser
#b:: {
    Run "https:"
}

; Start tiling WM
#c:: {
    Run "komorebic start --ahk"
}

; Start stop WM
#+c:: {
    Run "komorebic stop"
}

; Lock Windows regardless LockWorkStation stsatus
#F2:: {
    if (RegRead(g_keyName, g_valueName) == 1) {
        RegWrite 0, "REG_DWORD", g_keyName, g_valueName
    }
    DllCall("LockWorkStation")
}

