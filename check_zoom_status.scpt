on update_status(status,filename) -- this_data, target_file, append_data) -- (string, file path as string, boolean)
   --  set myFile to open for access "/Users/mcfayden/Play/TouchPortal/zoom_mic_state.txt" with write permission
   set myFile to open for access filename with write permission
   set eof of myFile to 0
   write status to myFile
   close access myFile
end update_status



if application "zoom.us" is not running then
    update_status("0","/Users/mcfayden/Play/TouchPortal/zoom_mic_state.txt")
    update_status("0","/Users/mcfayden/Play/TouchPortal/zoom_vid_state.txt")
    return
else
    set isOnAir_mic to false
    set isOnAir_vid to false
    set isHandRaised to false	
    tell application "System Events"
        tell application process "zoom.us"
            if (menu item "Mute Audio" of menu 1 of menu bar item "Meeting" of menu bar 1 exists) then
	        set isOnAir_mic to true
            else if (menu item "Unmute Audio" of menu 1 of menu bar item "Meeting" of menu bar 1 exists) then
	        set isOnAir_mic to false
            end if
            if (menu item "Stop Video" of menu 1 of menu bar item "Meeting" of menu bar 1 exists) then
	        set isOnAir_vid to true
            else if (menu item "Start Video" of menu 1 of menu bar item "Meeting" of menu bar 1 exists) then
	        set isOnAir_vid to false	        
            end if
            if (menu item "Stop Video" of menu 1 of menu bar item "Meeting" of menu bar 1 exists) then
	        set isOnAir_vid to true
            else if (menu item "Start Video" of menu 1 of menu bar item "Meeting" of menu bar 1 exists) then
	        set isOnAir_vid to false	        
            end if
        end tell
    end tell

   
    if isOnAir_mic then
        update_status("1","/Users/mcfayden/Play/TouchPortal/zoom_mic_state.txt") 
    else
	update_status("0","/Users/mcfayden/Play/TouchPortal/zoom_mic_state.txt")
    end if

    if isOnAir_vid then
        update_status("1","/Users/mcfayden/Play/TouchPortal/zoom_vid_state.txt") 
    else
	update_status("0","/Users/mcfayden/Play/TouchPortal/zoom_vid_state.txt")
    end if

end if
