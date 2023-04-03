#SingleInstance, Force
#NoEnv
SetBatchLines, -1
SendMode Input
SetKeyDelay, -1, -1
SetWinDelay, -1
SetControlDelay, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0

display_info_count(desc, var, valCount) {
    GuiControl, ,%var%, %desc% %valCount%
}

dota_is_active() {
    if (WinActive("ahk_exe dota2.exe")) {
        return True
    } else {
        return False
    }
}

t_interval = 10
script := true
rearm_level := 1

global button_ult_q := False
global button_ult_w := False
global button_ult_e := False
global button_ult_r := False
global button_ult_d := False
global button_ult_f := False

global button_ult_z := False
global button_ult_x := False
global button_ult_c := False
global button_ult_v := False
global button_ult_b := False
global button_ult_Space := False

global button_ult_self_q := False
global button_ult_self_w := False
global button_ult_self_e := False
global button_ult_self_r := False
global button_ult_self_d := False
global button_ult_self_f := False

global button_ult_self_z := False
global button_ult_self_x := False
global button_ult_self_c := False
global button_ult_self_v := False
global button_ult_self_b := False
global button_ult_self_Space := False

dota_active := dota_is_active()

Gui, Color, FF0000
Gui, Font, S11, Jetbrains Mono
Gui, Add, Text, BackgroundTrans vInfo1, script on
; Gui, Add, Text, BackgroundTrans vInfo2, rearm_level 1
Gui +LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, FFFFFF 130
Gui -Caption
Gui, Show, x1 y1

show_gui() {
    Gui, Color, FF0000
    Gui, Font, S11, Jetbrains Mono
    Gui, Add, Text, BackgroundTrans vInfo1, script on
    ; Gui, Add, Text, BackgroundTrans vInfo2, rearm_level 1
    Gui +LastFound +AlwaysOnTop +ToolWindow
    WinSet, TransColor, FFFFFF 130
    Gui -Caption
    Gui, Show, x1 y1
}

; First GUI window
Gui, New, +AlwaysOnTop

Gui, Add, Tab3,, Rearm|Laser

Gui, Add, Checkbox, gUlt_q vCh_ult_q, q
Gui, Add, Checkbox, gUlt_w vCh_ult_w, w
Gui, Add, Checkbox, gUlt_e vCh_ult_e, e
Gui, Add, Checkbox, gUlt_d vCh_ult_d, d
Gui, Add, Checkbox, gUlt_f vCh_ult_f, f
Gui, Add, Checkbox, gUlt_z vCh_ult_z, z
Gui, Add, Checkbox, gUlt_x vCh_ult_x, x
Gui, Add, Checkbox, gUlt_c vCh_ult_c, c
Gui, Add, Checkbox, gUlt_v vCh_ult_v, v
Gui, Add, Checkbox, gUlt_b vCh_ult_b, b
Gui, Add, Checkbox, gUlt_Space vCh_ult_Space, space

Gui, Add, Checkbox, x80 y36 gUlt_self_q vCh_ult_self_q, self
Gui, Add, Checkbox, gUlt_self_w vCh_ult_self_w, self
Gui, Add, Checkbox, gUlt_self_e vCh_ult_self_e, self
Gui, Add, Checkbox, gUlt_self_d vCh_ult_self_d, self
Gui, Add, Checkbox, gUlt_self_f vCh_ult_self_f, self
Gui, Add, Checkbox, gUlt_self_z vCh_ult_self_z, self
Gui, Add, Checkbox, gUlt_self_x vCh_ult_self_x, self
Gui, Add, Checkbox, gUlt_self_c vCh_ult_self_c, self
Gui, Add, Checkbox, gUlt_self_v vCh_ult_self_v, self
Gui, Add, Checkbox, gUlt_self_b vCh_ult_self_b, self
Gui, Add, Checkbox, gUlt_self_Space vCh_ult_self_Space, self

Gui, Tab, 2

Gui, Add, Checkbox, gLaser_q, q
Gui, Add, Checkbox, gLaser_w, w
Gui, Add, Checkbox, gLaser_e, e
Gui, Add, Checkbox, gLaser_d, d
Gui, Add, Checkbox, gLaser_f, f
Gui, Add, Checkbox, gLaser_z, z
Gui, Add, Checkbox, gLaser_x, x
Gui, Add, Checkbox, gLaser_c, c
Gui, Add, Checkbox, gLaser_v, v
Gui, Add, Checkbox, gLaser_b, b
Gui, Add, Checkbox, gLaser_Space, space

Gui, Add, Checkbox, x80 y36 gLaser_self_q, self
Gui, Add, Checkbox, gLaser_self_w, self
Gui, Add, Checkbox, gLaser_self_e, self
Gui, Add, Checkbox, gLaser_self_d, self
Gui, Add, Checkbox, gLaser_self_f, self
Gui, Add, Checkbox, gLaser_self_z, self
Gui, Add, Checkbox, gLaser_self_x, self
Gui, Add, Checkbox, gLaser_self_c, self
Gui, Add, Checkbox, gLaser_self_v, self
Gui, Add, Checkbox, gLaser_self_b, self
Gui, Add, Checkbox, gLaser_self_Space, self

Gui, Show, x1 y36
return

Ult_q() {
    Gui, Submit, NoHide
    GuiControlGet, Ch_ult_q
    (Ch_ult_q) ? button_ult_q := True : button_ult_q := False
}

Ult_w() {
    Gui, Submit, NoHide
    GuiControlGet, Ch_ult_w
    (Ch_ult_w) ? button_ult_w := True : button_ult_w := False
}

Ult_e() {
    Gui, Submit, NoHide
    button_ult_e := !button_ult_e
}

Ult_d() {
    Gui, Submit, NoHide
    button_ult_d := !button_ult_d
}

Ult_f() {
    Gui, Submit, NoHide
    button_ult_f := !button_ult_f
}

Ult_z() {
    Gui, Submit, NoHide
    button_ult_z := !button_ult_z
}

Ult_x() {
    Gui, Submit, NoHide
    button_ult_x := !button_ult_x
}

Ult_c() {
    Gui, Submit, NoHide
    button_ult_c := !button_ult_c
}

Ult_v() {
    Gui, Submit, NoHide
    button_ult_v := !button_ult_v
}

Ult_b() {
    Gui, Submit, NoHide
    button_ult_b := !button_ult_b
}

Ult_Space() {
    Gui, Submit, NoHide
    button_ult_Space := !button_ult_Space
}

Ult_self_q() {
    GuiControlGet, Ch_ult_self_q
    
    if (Ch_ult_self_q == True) {
        GuiControl, , Ch_ult_q, 1
        GuiControl, Disable, Ch_ult_q
    } else {
        GuiControl, , Ch_ult_q, 0
        GuiControl, Enable, Ch_ult_q
    }

    Gui, Submit, NoHide
    button_ult_self_q := !button_ult_self_q
}

Ult_self_w() {
    Gui, Submit, NoHide
    button_ult_self_w := !button_ult_self_w
}

Ult_self_e() {
    Gui, Submit, NoHide
    button_ult_self_e := !button_ult_self_e
}

Ult_self_d() {
    Gui, Submit, NoHide
    button_ult_self_d := !button_ult_self_d
}

Ult_self_f() {
    Gui, Submit, NoHide
    button_ult_self_f := !button_ult_self_f
}

Ult_self_z() {
    Gui, Submit, NoHide
    button_ult_self_z := !button_ult_self_z
}

Ult_self_x() {
    Gui, Submit, NoHide
    button_ult_self_x := !button_ult_self_x
}

Ult_self_c() {
    Gui, Submit, NoHide
    button_ult_self_c := !button_ult_self_c
}

Ult_self_v() {
    Gui, Submit, NoHide
    button_ult_self_v := !button_ult_self_v
}

Ult_self_b() {
    Gui, Submit, NoHide
    button_ult_self_b := !button_ult_self_b
}

Ult_self_Space() {
    Gui, Submit, NoHide
    button_ult_self_Space := !button_ult_self_Space
}

Laser_q() {
    Gui, Submit, NoHide
    button_laser_z := !button_laser_z
}

Laser_w() {
    Gui, Submit, NoHide
    button_laser_w := !button_laser_w
}

Laser_e() {
    Gui, Submit, NoHide
    button_laser_e := !button_laser_e
}

Laser_d() {
    Gui, Submit, NoHide
    button_laser_d := !button_laser_d
}

Laser_f() {
    Gui, Submit, NoHide
    button_laser_f := !button_laser_f
}

Laser_z() {
    Gui, Submit, NoHide
    button_laser_z := !button_laser_z
}

Laser_x() {
    Gui, Submit, NoHide
    button_laser_x := !button_laser_x
}

Laser_c() {
    Gui, Submit, NoHide
    button_laser_c := !button_laser_c
}

Laser_v() {
    Gui, Submit, NoHide
    button_laser_v := !button_laser_v
}

Laser_b() {
    Gui, Submit, NoHide
    button_laser_b := !button_laser_b
}

Laser_Space() {
    Gui, Submit, NoHide
    button_laser_Space := !button_laser_Space
}

Laser_self_q() {
    Gui, Submit, NoHide
    button_laser_self_q := !button_laser_self_q
}

Laser_self_w() {
    Gui, Submit, NoHide
    button_laser_self_w := !button_laser_self_w
}

Laser_self_e() {
    Gui, Submit, NoHide
    button_laser_self_e := !button_laser_self_e
}

Laser_self_d() {
    Gui, Submit, NoHide
    button_laser_self_d := !button_laser_self_d
}

Laser_self_f() {
    Gui, Submit, NoHide
    button_laser_self_f := !button_laser_self_f
}

Laser_self_z() {
    Gui, Submit, NoHide
    button_laser_self_z := !button_laser_self_z
}

Laser_self_x() {
    Gui, Submit, NoHide
    button_laser_self_x := !button_laser_self_x
}

Laser_self_c() {
    Gui, Submit, NoHide
    button_laser_self_c := !button_laser_self_c
}

Laser_self_v() {
    Gui, Submit, NoHide
    button_laser_self_v := !button_laser_self_v
}

Laser_self_b() {
    Gui, Submit, NoHide
    button_laser_self_b := !button_laser_self_b
}

Laser_self_Space() {
    Gui, Submit, NoHide
    button_laser_self_Space := !button_laser_self_Space
}

on_rearm() {
    Send, {r}

    if (rearm_level == 1) {
        Sleep, 3500
    }

    else if (rearm_level == 2) {
        Sleep, 2000
    }

    else if (rearm_level == 3) {
        Sleep, 1250
    }
}

restore_mana() {
    if (button_v = 1) {
        Send, {v}
        Sleep, t_interval
    }

    if (button_b = 1) {
        Send, {b}
        Sleep, t_interval
    }
}

$q up::
     if (dota_is_active() and script) {

        if (button_q = 1) {
            Send, {q}
            Sleep, t_interval
        }

     } else {
        Send {q}
     }
return

$r up::
     if (dota_is_active() and script) {

        if (button_ult_q) {
            Send, {q}
            Sleep, t_interval
        } else if (button_ult_q && button_ult_self_q) {
            Send, ^{q}
            Sleep, t_interval
        }

         if (button_ult_w) {
            Send, {w}
            Sleep, t_interval
        } else if (button_ult_w && button_ult_self_w) {
            Send, ^{w}
            Sleep, t_interval
        }

        if (button_ult_e) {
            Send, {e}
            Sleep, t_interval
        } else if (button_ult_e && button_ult_self_e) {
            Send, ^{e}
            Sleep, t_interval
        }

        if (button_ult_d) {
            Send, {d}
            Sleep, t_interval
        } else if (button_ult_d && button_ult_self_d) {
            Send, ^{d}
            Sleep, t_interval
        }

	    if (button_ult_f) {
            Send, {f}
            Sleep, t_interval
        } else if (button_ult_f && button_ult_self_f) {
            Send, ^{f}
            Sleep, t_interval
        }

        if (button_ult_x) {
            Send, {x}
            Sleep, t_interval
        } else if (button_ult_x && button_ult_self_x) {
            Send, ^{x}
            Sleep, t_interval
        }

        if (button_ult_c) {
            Send, {c}
            Sleep, t_interval
        } else if (button_ult_c && button_ult_self_c) {
            Send, ^{c}
            Sleep, t_interval
        }

        if (button_ult_v) {
            Send, {v}
            Sleep, t_interval
        } else if (button_ult_v && button_ult_self_v) {
            Send, ^{v}
            Sleep, t_interval
        }

        if (button_ult_b) {
            Send, {b}
            Sleep, t_interval
        } else if (button_ult_b && button_ult_self_b) {
            Send, ^{b}
            Sleep, t_interval
        }

        if (button_ult_Space) {
            Send, {Space}
            Sleep, t_interval
        } else if (button_ult_Space && button_ult_self_Space) {
            Send, ^{Space}
            Sleep, t_interval
        }

        on_rearm()
     } else {
        Send {r}
     }
return

Numpad1::Reload
Numpad0::
    script := !script
    if (script) {
        show_gui()
    } else {
        Gui, Destroy
    }
return

; $Space up::
;     if (dota_is_active() and script) {
;         Send, {Space}
;         Sleep, t_interval

;         Send, {x}
;         Sleep, t_interval

;         on_rearm()

;         Sleep 50

;         Send, {x}
;         Sleep 50
;     } else {
;         Send {Space}
;     }
; return


; $x up::
;      if (dota_is_active() and script) {

;         if (button_x = 1) {
;             Send, {x}
;             Sleep, t_interval
;         }

;         if (button_v = 0) {
;             Send, {v}
;             Sleep, t_interval
;         }

;         if (button_b = 0) {
;             Send, {b}
;             Sleep, t_interval
;         }

;         if (button_z = 0) {
;             Send, {z}
;             Sleep, 100
;         }


;         if (button_c = 0) {
;             Send, {c}
;             Sleep, t_interval
;         }

;         if (button_Space = 0) {
;             Send, {Space}
;             Sleep, t_interval
;         }


;         ; on_rearm()
;      } else {
;         Send {x}
;      }
; return

; $Up up::
;     if (dota_is_active() and script) {
;         rearm_level++

;         if (rearm_level > 3) {
;             rearm_level := 1
;         }
;         else if (rearm_level < 1) {
;             rearm_level := 3
;         }

;         display_info_count("rearm_level", "Info2", rearm_level)
;     } else {
;         Send {Up}
;     }
; return

; $Down up::
;     if (dota_is_active() and script) {
;         rearm_level--

;         if (rearm_level > 3) {
;             rearm_level := 1
;         }
;         else if (rearm_level < 1) {
;             rearm_level := 3
;         }

;         display_info_count("rearm_level", "Info2", rearm_level)
;     } else {
;         Send {Down}
;     }
; return