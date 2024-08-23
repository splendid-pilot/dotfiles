#SingleInstance Force
; Remember to change the permission in registry editor.
g_keyName := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System"
g_valueName := "DisableLockWorkstation"
#F1::{
  if (RegRead(g_keyName, g_valueName) == 1){
    RegWrite 0, "REG_DWORD", g_keyName, g_valueName
  }else{
    RegWrite 1, "REG_DWORD", g_keyName, g_valueName
  }
}
#Enter::{
  Run "wt nt -p Ubuntu"

}
#+Enter::{
  Run "wt nt -p PowerShell"
}

#b::{
  Run "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
}

#c::{
  Run "komorebic start --ahk"
}
#+c::{
  Run "komorebic stop --ahk"
}
