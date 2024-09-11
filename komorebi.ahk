#Requires AutoHotkey v2.0.2
#SingleInstance Force


g_keyName := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System"
g_valueName := "DisableLockWorkstation"
Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

; Stop exsiting yasb
;for process in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process Where Name = 'Python.exe' AND CommandLine LIKE '%yasb%'"){
;  ProcessClose(process.ProcessId)
;  break
;}
;RunWait("D:\Repos\.venv\Scripts\python.exe D:\Repos\yasb\src\main.py", ,"Hide")

#q::Komorebic("close")
#+m::Komorebic("minimize")
#m::Komorebic("toggle-maximize")

; Focus windows
#h::Komorebic("focus left")
#j::Komorebic("focus down")
#k::Komorebic("focus up")
#HotIf RegRead(g_keyName, g_valueName) = 1
#l::Komorebic("focus right")
#HotIf RegRead(g_keyName, g_valueName) = 0
#'::Komorebic("focus right")
#HotIf
#+[::Komorebic("cycle-focus previous")
#+]::Komorebic("cycle-focus next")

; Move windows
#+h::Komorebic("move left")
#+j::Komorebic("move down")
#+k::Komorebic("move up")
#+l::Komorebic("move right")

; Stack windows
#Left::Komorebic("stack left")
#Down::Komorebic("stack down")
#Up::Komorebic("stack up")
#Right::Komorebic("stack right")
#;::Komorebic("unstack")
#[::Komorebic("cycle-stack previous")
#]::Komorebic("cycle-stack next")

; Resize
#=::Komorebic("resize-axis horizontal increase")
#-::Komorebic("resize-axis horizontal decrease")
#+=::Komorebic("resize-axis vertical increase")
#+_::Komorebic("resize-axis vertical decrease")

; Manipulate windows
#t::Komorebic("toggle-float")
#f::Komorebic("toggle-monocle")

; Window manager options
#+r::Komorebic("retile")
#p::Komorebic("toggle-pause")

; Layouts
#x::Komorebic("flip-layout horizontal")
#y::Komorebic("flip-layout vertical")
#w::Komorebic("cycle-layout next")
#+w::Komorebic("cycle-layout previous")

; Workspaces
#1::Komorebic("focus-workspace 0")
#2::Komorebic("focus-workspace 1")
#3::Komorebic("focus-workspace 2")
#4::Komorebic("focus-workspace 3")
#5::Komorebic("focus-workspace 4")
#6::Komorebic("focus-workspace 5")
#7::Komorebic("focus-workspace 6")
#8::Komorebic("focus-workspace 7")

#,::Komorebic("cycle-workspace previous")
#.::Komorebic("cycle-workspace next")

#+,::Komorebic("cycle-move-to-workspace previous")
#+.::Komorebic("cycle-move-to-workspace next")

; Move windows across workspaces
#+1::Komorebic("move-to-workspace 0")
#+2::Komorebic("move-to-workspace 1")
#+3::Komorebic("move-to-workspace 2")
#+4::Komorebic("move-to-workspace 3")
#+5::Komorebic("move-to-workspace 4")
#+6::Komorebic("move-to-workspace 5")
#+7::Komorebic("move-to-workspace 6")
#+8::Komorebic("move-to-workspace 7")
#F5::Komorebic("reload-configuration")
#F6::Komorebic("gui")
