#!/bin/bash

: '
Read contents of C:\Users\Administrator\Desktop\root.txt.
'

paste_command "get-content C:\\Users\\Administrator\\Desktop\\root.txt"
xdotool key Return
