#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
CoordMode, Tooltip, screen
try{
	Menu, Tray, Icon, cross.ico
}
; close time
settimer, auto_close, -30000
DetectHiddenWindows, Off
gui, color, black
gui, font, s12, KaiTi
gui, add, button, w80 x10 y10 gedit_, &Edit
gui, add, button, w80 x+10 gclose_sleep, &Sleep
gui, add, button, w80 x10 gclose_hibernate, &Hibernate
gui, add, button, w80 x+10 gclose_shutdown, Shut&down
gui, add, button, w80 x10 gclose_reboot, &Reboot
gui, add, button, w80 x+10 gclose_, &Close All
gui, add, button, w80 x10 gclose_except_win, Exce&pt
gui, add, button, w80 x+10 gclose_cancel Default, Cance&l
;guicontrol, +BackgroundWhite, Button
gui,-Caption
gui, show,,Quick Setting

;--------------------   except close

except := []
return




close_except_win:
	settimer, auto_close, delete
	gui, hide
	except_win := 1
	loop{
		tooltip, p to push`nshift p to exit
		if(except_win==0){
			break
		}
		sleep, 50
	}
	tooltip, closing windows
	WinGet, mylist, list
	;;;;;;;;;;;;;;;;;;; except
	WinGet, mylist_except, list, Backup and Sync
	Loop % mylist_except {
		except.Push(mylist_except%A_Index%)
	}
	;;;;;;;;;;;;;;;;;;;
	Loop % mylist {
		hwnd := mylist%A_Index%
		;msgbox % "Found window with HWND " hwnd
		;find except
		for index, element in except
		{
			if(element==hwnd)
				break
		}
		;;;;;;;;;;;;;;
		if(element==hwnd){ ;except
			continue
		}
		else{
			WinClose % "ahk_id" hwnd
		}
	}
	tooltip,Finish!!!
	shutdown()
	sleep, 2000
	shutdown()
	goto, auto_close
	return
#if except_win = 1
p::
	WinGetTitle, getTitle, A
	showstr = %showstr%%getTitle%`n
	tooltip,%showstr%,0,0,2
	WinGet, mylist_except, list, %getTitle%
	Loop % mylist_except {
		except.Push(mylist_except%A_Index%)
	}
	return
+p::
	except_win := 0
	tooltip,,,,2
	tooltip,
	return
#if
;--------------------   Hibernate
close_hibernate:
	gui, destroy
	DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
	exitapp
	return
edit_:
	try{
		run, ".\"
	}
	if WinExist("close_all_program.ahk"){
		WinActivate, close_all_program.ahk
	}
	else{
		try{
			run, gVim.exe "close_all_program.ahk", ,Max
		}
		catch{
			run, notepad.exe "close_all_program.ahk", ,Max
		}
	}
	exitapp
	return
close_:
	Menu, Tray, NoIcon
	close_all()
	;gosub, close_all
	exitapp
	return

close_shutdown:
	;Menu, Tray, NoIcon
	close_all_all()
	;gosub, close_all
	loop 10
	{
		Count_down := 10-A_Index
		tooltip, After %Count_down%s shutdown
		sleep, 1000
	}
	shutdown, 1
	return

close_reboot:
	Menu, Tray, NoIcon
	close_all_all()
	;gosub, close_all
	sleep, 10000
	shutdown, 2
	return
close_sleep:
	Menu, Tray, NoIcon
	DllCall("PowrProf\SetSuspendState", "int", 0, "int", 1, "int", 0)
	exitapp
	return
close_cancel:
	Menu, Tray, NoIcon
	gui, destroy
	tooltip, Bye
	sleep, 200
	keywait, l
	exitapp
	return
auto_close:
	exitapp
	return
	
close_all:
	WinGet, mylist, list
	;;;;;;;;;;;;;;;;;;; except
	WinGet, mylist_except, list, Backup and Sync
	except := []
	Loop % mylist_except {
		except.Push(mylist_except%A_Index%)
	}
	;;;;;;;;;;;;;;;;;;;
	Loop % mylist {
		hwnd := mylist%A_Index%
		;msgbox % "Found window with HWND " hwnd
		;find except
		for index, element in except
		{
			if(element==hwnd)
				break
		}
		;;;;;;;;;;;;;;
		if(element==hwnd){ ;except
			continue
		}
		else{
			WinClose % "ahk_id" hwnd
		}
	}
	tooltip,Finish!!!
	shutdown()
	sleep, 2000
	shutdown()
	return


shutdown()
{
	if WinExist("Shut Down Windows"){
		WinClose,Shut Down Windows 
	}
}


close_all(){
		WinGet, mylist, list
		;;;;;;;;;;;;;;;;;;; except
		WinGet, mylist_except, list, Backup and Sync
		except := []
		Loop % mylist_except {
			except.Push(mylist_except%A_Index%)
		}
		;;;;;;;;;;;;;;;;;;;
		Loop % mylist {
			hwnd := mylist%A_Index%
			;msgbox % "Found window with HWND " hwnd
			;find except
			for index, element in except
			{
				if(element==hwnd)
					break
			}
			;;;;;;;;;;;;;;
			if(element==hwnd){ ;except
				continue
			}
			else{
				WinClose % "ahk_id" hwnd
			}
		}
		tooltip,Finish!!!
		shutdown()
		sleep, 2000
		shutdown()
	
}

close_all_all(){
		WinGet, mylist, list
		Loop % mylist {
			hwnd := mylist%A_Index%
			WinClose % "ahk_id" hwnd
		}
		tooltip,Finish!!!
		shutdown()
		sleep, 2000
		shutdown()
	
}
