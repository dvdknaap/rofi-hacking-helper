#!/bin/bash

: '
Read contents of C:\Users\Administrator\Desktop\proof.txt.
'

paste_command "get-content C:\\Users\\Administrator\\Desktop\\proof.txt"
xdotool key Return
