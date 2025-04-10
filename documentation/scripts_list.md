# Scripts Documentation

## Overview

This repository contains **711** scripts organized into **134** subdirectories.

## Table of Contents

- [Main Scripts](#main-scripts)
- [dynamicFields](#dynamicfields)
- [auditTools](#audittools)
- [crackPasswords](#crackpasswords)
- [customWordlist](#customwordlist)
- [decompile](#decompile)
- [fileTransfer](#filetransfer)
- [ftp](#ftp)
- [hydra](#hydra)
- [nmapScans](#nmapscans)
- [portListening](#portlistening)
- [python](#python)
- [reconnaissance](#reconnaissance)
- [shell](#shell)
- [smtp](#smtp)
- [snmp](#snmp)
- [sqlDatabase](#sqldatabase)
- [ssh](#ssh)
- [web](#web)

### Main Scripts

| Path | Description |
|------|-------------|
| 📜 `add_ip_domain_to_etc_hosts.sh` | add ip and domains to /etc/hosts |
| 📜 `documentation_folders.sh` | create the HTB documentation folder structure |
| 📜 `get_kali_ip.sh` | get Kali IP address |
| 📜 `get_kali_ssh_key.sh` | get SSH key |
| 📜 `save_ssh_key_to_authorized_keys.sh` | save SSH key to authorized_keys |
<br />

### dynamicFields

scripts to add, edit or remote dynamic fields

| Path | Description |
|------|-------------|
| 📜 `dynamicFields/add_dynamic_fields.sh` | add new dynamic fields |
| 📜 `dynamicFields/edit_dynamic_fields.sh` | show a list of dynamic fields so you can edit them |
| 📜 `dynamicFields/get_active_custom_field.sh` | get a current active dynamic field |
| 📜 `dynamicFields/get_active_domain.sh` | get current active dynamic field domain |
| 📜 `dynamicFields/get_active_ip.sh` | get current active dynamic field ip |
| 📜 `dynamicFields/get_active_password.sh` | get current active dynamic field password |
| 📜 `dynamicFields/get_active_username.sh` | get current active dynamic field username |
| 📜 `dynamicFields/get_active_website.sh` | get current active dynamic field website |
| 📜 `dynamicFields/remove_dynamic_fields.sh` | show a list of dynamic fields so you can remove them |
| 📜 `dynamicFields/set_active_dynamic_fields.sh` | show a list of dynamic fields and select one to use as default values |
| 📜 `dynamicFields/unset_active_dynamic_fields.sh` | remove active dynamic fields as default |
<br />

### auditTools

scripts to perform pentest audits

<br />

### auditTools/domainPasswordAuditTool_dpat

script to use Domain Password Audit Tool (DPAT)

| Path | Description |
|------|-------------|
| 📜 `auditTools/domainPasswordAuditTool_dpat/audit_ad_passwords_hashcat_profile.sh` | Domain Password Audit Tool (DPAT) |
<br />

### crackPasswords

Crack passwords with hashcat

<br />

### crackPasswords/hashcat

crack passwords with hashcat

| Path | Description |
|------|-------------|
| 📜 `crackPasswords/hashcat/crack_hash_and_find_format_automatically.sh` | crack hashes and find format automatically |
| 📜 `crackPasswords/hashcat/crack_jwt.sh` | Crack JWT (JSON Web Token) string |
| 📜 `crackPasswords/hashcat/crack_kerberos5_etype-23_as_rep_hash.sh` | Crack Kerberos 5, etype 23, AS-REP hashes with hashcat. |
| 📜 `crackPasswords/hashcat/crack_kerberos5_etype-23_tgs_rep_hash.sh` | Crack Kerberos 5, etype 23, TGS-REP hashes with hashcat. |
| 📜 `crackPasswords/hashcat/crack_md5_hashes.sh` | Crack md5 hashes |
| 📜 `crackPasswords/hashcat/crack_net_ntlm_hashes.sh` | Crack NTLM hashes with hashcat. |
| 📜 `crackPasswords/hashcat/crack_net_ntlmv2_hashes.sh` | Crack NetNTLMv2 hashes with hashcat. |
| 📜 `crackPasswords/hashcat/crack_spn_passwords.sh` | Crack SPN passwords with hashcat using rockyou.txt. |
| 📜 `crackPasswords/hashcat/crack_spn_passwords_with_OneRuleToRuleThemAll_rule.sh` | Crack SPN passwords with hashcat and OneRuleToRuleThemAll.rule. |
| 📜 `crackPasswords/hashcat/crack_spn_passwords_with_best64_rule.sh` | Crack SPN passwords with hashcat and best64.rule. |
| 📜 `crackPasswords/hashcat/create_rockyou_OneRuleToRuleThemAll_rule_custom_wordlist.sh` | Create sorted, unique wordlist: given wordlist + OneRuleToRuleThemAll.rule. |
| 📜 `crackPasswords/hashcat/create_rockyou_best64_rule_custom_wordlist.sh` | Create sorted, unique wordlist from given wordlist + best64.rule. |
| 📜 `crackPasswords/hashcat/format_ntlm_username_rid_lm_ntlm_hashes_to_hashcat.sh` | Format username:RID:LM:NTLM::: to hashcat format |
| 📜 `crackPasswords/hashcat/unshadow_passwords.sh` | unshadow /etc/passwords |
<br />

### crackPasswords/john

crack passwords with john the ripper

| Path | Description |
|------|-------------|
| 📜 `crackPasswords/john/crack_blowfish.sh` | crack Blowfish-based crypt(3) hashes |
| 📜 `crackPasswords/john/crack_crypt3.sh` | crack Traditional Unix crypt(3) hashes |
| 📜 `crackPasswords/john/crack_hmac_md5.sh` | crack hmac-md5 password hashes |
| 📜 `crackPasswords/john/crack_kerberos4.sh` | crack Kerberos 4 password hashes |
| 📜 `crackPasswords/john/crack_kerberos5.sh` | crack Kerberos 5 password hashes |
| 📜 `crackPasswords/john/crack_kerberost_5_as_rep.sh` | crack krb 5 as rep hashes |
| 📜 `crackPasswords/john/crack_md4.sh` | crack md4 hashes |
| 📜 `crackPasswords/john/crack_md5.sh` | crack md5 hashes |
| 📜 `crackPasswords/john/crack_mssql.sh` | crack mssql hashes |
| 📜 `crackPasswords/john/crack_mysql.sh` | crack mysql hashes |
| 📜 `crackPasswords/john/crack_mysql_sha1.sh` | crack mysql sha1 hashes |
| 📜 `crackPasswords/john/crack_ntlm.sh` | crack ntlm hashes |
| 📜 `crackPasswords/john/crack_pdf.sh` | crack pdf hashes |
| 📜 `crackPasswords/john/crack_rar.sh` | crack rar (winrar) hashes |
| 📜 `crackPasswords/john/crack_sha1.sh` | crack sha1 hashes |
| 📜 `crackPasswords/john/crack_sha224.sh` | crack sha224 hashes |
| 📜 `crackPasswords/john/crack_sha256.sh` | crack sha256 hashes |
| 📜 `crackPasswords/john/crack_sha384.sh` | crack sha384 hashes |
| 📜 `crackPasswords/john/crack_sha512.sh` | crack sha512 hashes |
| 📜 `crackPasswords/john/crack_ssh.sh` | crack ssh hashes |
| 📜 `crackPasswords/john/crack_zip.sh` | crack zip (winzip) hashes |
| 📜 `crackPasswords/john/unshadow_passwords.sh` | unshadow /etc/passwords |
<br />

### crackPasswords/john/convert_to_john

convert hash to john format

| Path | Description |
|------|-------------|
| 📜 `crackPasswords/john/convert_to_john/hccap2john.sh` | covert wpa/wpa2 handshake captures to john format |
| 📜 `crackPasswords/john/convert_to_john/keepass2john.sh` | covert keepass to john format |
| 📜 `crackPasswords/john/convert_to_john/keychain2john.sh` | covert OS X keychain to john format |
| 📜 `crackPasswords/john/convert_to_john/mscash2john.sh` | covert mscash to john format |
| 📜 `crackPasswords/john/convert_to_john/office2john.sh` | covert ms office to john format |
| 📜 `crackPasswords/john/convert_to_john/pdf2john.sh` | covert pdf to john format |
| 📜 `crackPasswords/john/convert_to_john/pfx2john.sh` | covert pfx (pkcs#12) to john format |
| 📜 `crackPasswords/john/convert_to_john/putty2john.sh` | covert putty to john format |
| 📜 `crackPasswords/john/convert_to_john/rar2john.sh` | covert rar to john format |
| 📜 `crackPasswords/john/convert_to_john/ssh2john.sh` | covert ssh to john format |
| 📜 `crackPasswords/john/convert_to_john/truecrypt_volume2john.sh` | covert truecrypt volumes to john format |
| 📜 `crackPasswords/john/convert_to_john/vncpcap2john.sh` | covert vnc pcap to john format |
| 📜 `crackPasswords/john/convert_to_john/wpa2john.sh` | covert wpa/wpa2 handshake to john format |
| 📜 `crackPasswords/john/convert_to_john/zip2john.sh` | covert zip to john format |
<br />

### customWordlist

create custom wordlists

| Path | Description |
|------|-------------|
| 📜 `customWordlist/cewl_create_custom_wordlist.sh` | cewl - create custom wordlist |
<br />

### decompile

decompile files

<br />

### decompile/java

decompile java class files

| Path | Description |
|------|-------------|
| 📜 `decompile/java/decompile_java_class_file.sh` | Decompile java class file |
<br />

### fileTransfer

file transfer to or from a server

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/decode_base64_and_save_to_file.sh` | decode base64 string and save to file |
| 📜 `fileTransfer/encode_file_to_base64.sh` | upload base64 file to upload server |
| 📜 `fileTransfer/upload_base64_file_to_upload_server.sh` | upload base64 file to upload server |
<br />

### fileTransfer/bash

send files over bash

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/bash/upload_file_to_upload_server.sh` | upload file to upload server (only works if enable-net-redirections is enabled) |
<br />

### fileTransfer/curl

script to upload a file to server

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/curl/curl_upload_file_to_upload_server.sh` | curl: upload file to upload server |
| 📜 `fileTransfer/curl/curl_upload_file_to_upload_server_with_post.sh` | curl: upload file to upload server with post method |
<br />

### fileTransfer/dev_tcp

download file over /dev/tcp/

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/dev_tcp/download_file_one_liner.sh` | download file over /dev/tcp/ |
<br />

### fileTransfer/ftp

script to start ftp server and upload or download files

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/ftp/ps_download_ftp_file_to_server.sh` | download ftp file to server |
| 📜 `fileTransfer/ftp/ps_upload_ftp_file_to_server.sh` | upload ftp file to server |
| 📜 `fileTransfer/ftp/start_ftp_server.sh` | start a ftp server |
<br />

### fileTransfer/linux

transfer file to or from a server for linux

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/linux/encode_file_to_base64.sh` | encode file to base64 string |
| 📜 `fileTransfer/linux/scp_download_file_from_server.sh` | SCP download file from server |
| 📜 `fileTransfer/linux/scp_upload_server_to_file.sh` | SCP upload file to server |
<br />

### fileTransfer/netcat

download file over netcat (nc)

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/netcat/nc_download_file.sh` | nc: download file |
| 📜 `fileTransfer/netcat/nc_upload_file.sh` | nc: upload file |
| 📜 `fileTransfer/netcat/netcat_download_file.sh` | ncat: download file |
| 📜 `fileTransfer/netcat/netcat_upload_file.sh` | ncat: upload file |
<br />

### fileTransfer/perl

script to download files

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/perl/download_file_one_liner.sh` | perl: download file one liner |
<br />

### fileTransfer/php

start php server

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/php/file_get_contents_download_file_one_liner.sh` | php: download file one liner with file_get_contents |
| 📜 `fileTransfer/php/fopen_download_file_one_liner.sh` | php: download file one liner with fopen |
| 📜 `fileTransfer/php/php_http_server.sh` | php: start http server |
<br />

### fileTransfer/python

start python http server

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/python/python2.7_download_file_one_liner.sh` | python2.7: download file one liner |
| 📜 `fileTransfer/python/python2.7_http_server.sh` | python2.7: start http server |
| 📜 `fileTransfer/python/python3_download_file_one_liner.sh` | python3: download file one liner |
| 📜 `fileTransfer/python/python3_http_server.sh` | python3: start http server |
<br />

### fileTransfer/ruby

start http server with ruby

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/ruby/download_file_one_liner.sh` | ruby: download file one liner |
| 📜 `fileTransfer/ruby/php_http_server.sh` | ruby: start http server |
<br />

### fileTransfer/smb

scripts to start smb server, mount and copy files to smb server

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/smb/cmd_mount_smb_share.sh` | cmd: mount smb share |
| 📜 `fileTransfer/smb/start_smb_share.sh` | start a smb server and create share location if not exists |
<br />

### fileTransfer/uploadServer

scripts start upload server and upload files to server

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/uploadServer/curl_upload_file_to_upload_server.sh` | curl: upload file to upload server |
| 📜 `fileTransfer/uploadServer/ps_upload_file_to_upload_server.sh` | ps: upload file to upload server |
| 📜 `fileTransfer/uploadServer/start_upload_server_port_443.sh` | start python upload server with port 433 |
| 📜 `fileTransfer/uploadServer/start_upload_server_port_80.sh` | start python upload server with port 80 |
| 📜 `fileTransfer/uploadServer/upload_file_one_liner.sh` | python3: upload file one liner |
<br />

### fileTransfer/windows

transfer file to or from a server for windows

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/windows/start_python_server_to_binary_folder.sh` | start python server to binary folder |
<br />

### fileTransfer/windows/cmd

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/windows/cmd/upload_Start-SimpleHTTPServer_ps1.sh` | cmd: upload Start-SimpleHTTPServer.ps1 file to server |
| 📜 `fileTransfer/windows/cmd/upload_invoke_smb_client.sh` | cmd: upload invoke-smbclient.ps1 file to server |
| 📜 `fileTransfer/windows/cmd/upload_invoke_smb_enum.sh` | cmd: upload invoke-smbenum.ps1 file to server |
| 📜 `fileTransfer/windows/cmd/upload_invoke_smb_exec.sh` | cmd: upload invoke-smbexec.ps1 file to server |
| 📜 `fileTransfer/windows/cmd/upload_invoke_the_hash.sh` | cmd: upload invoke-thehash.ps1 file to server |
| 📜 `fileTransfer/windows/cmd/upload_invoke_wmi_exec.sh` | cmd: upload invoke-wmiexec.ps1 file to server |
| 📜 `fileTransfer/windows/cmd/upload_lazagne_file.sh` | cmd: upload LaZagne file to server |
| 📜 `fileTransfer/windows/cmd/upload_nc64_file.sh` | cmd: upload nc64 file to server |
| 📜 `fileTransfer/windows/cmd/upload_nc_file.sh` | cmd: upload nc file to server |
| 📜 `fileTransfer/windows/cmd/upload_powerup_file.sh` | cmd: upload powerup.ps1 file to server |
| 📜 `fileTransfer/windows/cmd/upload_powerview_ps1.sh` | cmd: upload powerview.ps1 file to server |
| 📜 `fileTransfer/windows/cmd/upload_print_spoofer_file.sh` | cmd: upload PrintSpoofer file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_any_file.sh` | cmd: upload winPEASany.exe file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_any_ofs_file.sh` | cmd: upload winPEASany_ofs.exe file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_bat_file.sh` | cmd: upload winPEAS.bat file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_x64_file.sh` | cmd: upload winPEASx64.exe file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_x64_ofs_file.sh` | cmd: upload winPEASx64_ofs.exe file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_x86_file.sh` | cmd: upload winPEASx86.exe file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_x86_ofs_file.sh` | cmd: upload winPEASx86_ofs.exe file to server |
<br />

### fileTransfer/windows/powershell

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/windows/powershell/start_powershell_http_server.sh` | Powershell: start http server |
| 📜 `fileTransfer/windows/powershell/start_simple_powershel_server.sh` | Powershell: start simple http server and use current folder as root |
| 📜 `fileTransfer/windows/powershell/upload_Start-SimpleHTTPServer_ps1.sh` | ps: upload powerview.ps1 file to server |
| 📜 `fileTransfer/windows/powershell/upload_attacker_file_to_nc_as_base64.sh` | ps: upload attacker file to nc as base64 |
| 📜 `fileTransfer/windows/powershell/upload_invoke_smb_client.sh` | ps: upload invoke-smbclient.ps1 file to server |
| 📜 `fileTransfer/windows/powershell/upload_invoke_smb_enum.sh` | ps: upload invoke-smbenum.ps1 file to server |
| 📜 `fileTransfer/windows/powershell/upload_invoke_smb_exec.sh` | ps: upload invoke-smbexec.ps1 file to server |
| 📜 `fileTransfer/windows/powershell/upload_invoke_the_hash.sh` | ps: upload invoke-thehash.ps1 file to server |
| 📜 `fileTransfer/windows/powershell/upload_invoke_wmi_exec.sh` | ps: upload invoke-wmiexec.ps1 file to server |
| 📜 `fileTransfer/windows/powershell/upload_lazagne_file.sh` | ps: upload LaZagne file to server |
| 📜 `fileTransfer/windows/powershell/upload_nc64_file.sh` | ps: upload nc64 file to server |
| 📜 `fileTransfer/windows/powershell/upload_nc_file.sh` | ps: upload nc file to server |
| 📜 `fileTransfer/windows/powershell/upload_powerup_file.sh` | ps: upload powerup.ps1 file to server |
| 📜 `fileTransfer/windows/powershell/upload_powerview_ps1.sh` | ps: upload powerview.ps1 file to server |
| 📜 `fileTransfer/windows/powershell/upload_print_spoofer_file.sh` | ps: upload PrintSpoofer file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_any_file.sh` | ps: upload winPEASany.exe file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_any_ofs_file.sh` | ps: upload winPEASany_ofs.exe file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_bat_file.sh` | ps: upload winPEAS.bat file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_x64_file.sh` | ps: upload winPEASx64.exe file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_x64_ofs_file.sh` | ps: upload winPEASx64_ofs.exe file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_x86_file.sh` | ps: upload winPEASx86.exe file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_x86_ofs_file.sh` | ps: upload winPEASx86_ofs.exe file to server |
<br />

### fileTransfer/wsgidav

scripts to start wsgidav and copy to or from target

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/wsgidav/get_swgidav_share_address.sh` | get wsgidav server share address |
| 📜 `fileTransfer/wsgidav/start_wsgidav_server.sh` | start a wsgidav server |
<br />

### ftp

scripts for ftp enumeration

| Path | Description |
|------|-------------|
| 📜 `ftp/anonymous_login.sh` | FTP: check for anonymous login |
| 📜 `ftp/hydra_bruteforce_username_and_password.sh` | hydra: bruteforce username and password |
| 📜 `ftp/login_with_username_password.sh` | FTP: login with username and password |
| 📜 `ftp/metasploit_bruteforce_username_and_password_file.sh` | hydra: bruteforce username and passwords file |
| 📜 `ftp/metasploit_bruteforce_username_file_and_password_file.sh` | hydra: bruteforce username file and passwords file |
| 📜 `ftp/wget_download_files_from_ftp.sh` | wget: download files from ftp |
<br />

### hydra

scripts to do hydra brute force attacks

| Path | Description |
|------|-------------|
| 📜 `hydra/rdp_brute_force.sh` | hydra: rdp brute force |
| 📜 `hydra/smb_brute_force.sh` | hydra: smb brute force |
| 📜 `hydra/ssh_brute_force.sh` | hydra: ssh brute force |
<br />

### hydra/userPassFile

hydra scripts that use userpass file

| Path | Description |
|------|-------------|
| 📜 `hydra/userPassFile/rdp_brute_force.sh` | hydra: rdp brute force with userpass file |
| 📜 `hydra/userPassFile/smb_brute_force.sh` | hydra: smb brute force with userpass file |
| 📜 `hydra/userPassFile/ssh_brute_force.sh` | hydra: ssh brute force with userpass file |
<br />

### nmapScans

Collection of scripts for network scanning.

| Path | Description |
|------|-------------|
| 📜 `nmapScans/create_html_report_from_nmap_xml.sh` | Nmap: create html report from nmap xml report |
| 📜 `nmapScans/nmap_aggressive.sh` | Nmap: Aggressive scan all ports, save output. |
| 📜 `nmapScans/nmap_check_online_hosts.sh` | Nmap: ping sweep |
| 📜 `nmapScans/nmap_open_relay.sh` | Nmap: Check for open SMTP relay. |
| 📜 `nmapScans/nmap_quick_from_hosts_file.sh` | Nmap: Scan hosts from hosts file, save output to given location. |
| 📜 `nmapScans/scan_for_smtp_banner_and_commands.sh` | Nmap: scan for smtp banner en commands |
| 📜 `nmapScans/scan_for_specific_category.sh` | Nmap: scan for specific category |
| 📜 `nmapScans/scan_for_vulnerabilities.sh` | Nmap: scan for vulnerabilities |
| 📜 `nmapScans/scan_top10_ports.sh` | Nmap: scan top 10 ports |
| 📜 `nmapScans/scan_udp.sh` | Nmap: udp scan |
| 📜 `nmapScans/service_detection.sh` | Nmap: scan for services |
<br />

### nmapScans/proxychains

proxychains: Collection of scripts for network scanning.

| Path | Description |
|------|-------------|
| 📜 `nmapScans/proxychains/nmap_aggressive.sh` | proxychains: Nmap: Aggressive scan all ports, save output. |
| 📜 `nmapScans/proxychains/nmap_check_online_hosts.sh` | proxychains: Nmap: ping sweep |
| 📜 `nmapScans/proxychains/nmap_open_relay.sh` | proxychains: Nmap: Check for open SMTP relay. |
<br />

### portListening

different scripts to do port listenings

| Path | Description |
|------|-------------|
| 📜 `portListening/socat.sh` |  |
| 📜 `portListening/socat_listener.sh` |  |
| 📜 `portListening/ssh_forward_rdp_port.sh` | ssh: forward RDP port with id_rsa file |
<br />

### portListening/chisel

scripts to use chisel

| Path | Description |
|------|-------------|
| 📜 `portListening/chisel/cmd_upload_chisel_exe.sh` | cmd: download chisel.exe to server and connect to proxy |
| 📜 `portListening/chisel/curl_chisel.sh` | download chisel agent to server and connect to proxy |
| 📜 `portListening/chisel/ps_upload_chisel_exe.sh` | ps download chisel.exe to server and connect to proxy |
| 📜 `portListening/chisel/start_chisel_proxy.sh` | start chisel proxy |
<br />

### portListening/ligolo

scripts to use ligolo

| Path | Description |
|------|-------------|
| 📜 `portListening/ligolo/add_ligolo_port_listener.sh` | add ligolo port listener |
| 📜 `portListening/ligolo/add_new_ligolo_interface.sh` | add new ligolo interface |
| 📜 `portListening/ligolo/cmd_upload_ligolo_agent_exe.sh` | cmd: download ligolo agent.exe to server and connect to proxy |
| 📜 `portListening/ligolo/curl_ligolo_agent.sh` | curl: download ligolo agent to server and connect to proxy |
| 📜 `portListening/ligolo/ps_upload_ligolo_agent_exe.sh` | ps download ligolo agent.exe to server and connect to proxy |
| 📜 `portListening/ligolo/remove_ligolo_interface.sh` | remove ligolo interface |
| 📜 `portListening/ligolo/start_ligolo_proxy.sh` | ligolo: start proxy and configure ligolo interface |
| 📜 `portListening/ligolo/wget_ligolo_agent.sh` | wget: download ligolo agent to server and connect to proxy |
| 📜 `portListening/ligolo/wget_ligolo_agent_exe.sh` | wget: download ligolo agent.exe to server and connect to proxy |
<br />

### python

different python scripts like to start http server

| Path | Description |
|------|-------------|
| 📜 `python/create_pickle_rce_with_os_system.sh` | python3: create pickle RCE with os.system |
| 📜 `python/create_pickle_rce_with_sub_process.sh` | python3: create pickle RCE with subprocess.check_output |
| 📜 `python/get_printable_chars.sh` | python3: get all printable ascii chars |
| 📜 `python/python2.7_http_server.sh` | python2.7: start http server |
| 📜 `python/python3_create_venv_folder.sh` | python3: create venv env folder |
| 📜 `python/python3_http_server.sh` | python3: start http server |
| 📜 `python/python3_venv_install_requirements.sh` | python3 venv install requirements.txt |
| 📜 `python/read_pickle_from_base64.sh` | python3: read pickle file or base64 string |
| 📜 `python/server_always_return_200.sh` | start server and always return 200 |
| 📜 `python/test_punctuation_breaks.sh` | python3: check which punctuation breaks the website |
| 📜 `python/test_punctuation_breaks_with_burp_request_file.sh` | python3: check which punctuation breaks the website with burp request file |
<br />

### reconnaissance

scripts to do reconnaissance

<br />

### reconnaissance/defaultCreds

search default creds

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/defaultCreds/get_default_creds.sh` | get default credentials of program |
| 📜 `reconnaissance/defaultCreds/get_defaults_creds_wordlist.sh` | get default credentials wordlist |
<br />

### reconnaissance/linux

scripts to do reconnaissance on linux

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/linux/check_for_ps_changes.sh` | refresh ps -aux list every second |
| 📜 `reconnaissance/linux/check_internal_listening_ports.sh` | check internal listening ports |
| 📜 `reconnaissance/linux/check_running_cronjobs.sh` | download pspy64 to server and run it |
| 📜 `reconnaissance/linux/convert_ccache_to_kirbi_file.sh` | convert ccache file (windows) to kirbi file (linux) |
| 📜 `reconnaissance/linux/create_list_of_numbers.sh` | create a list of numbers. e.g. 2FA codes or ports and save to file |
| 📜 `reconnaissance/linux/create_lsass_dump.sh` | Powershell: create lsass.dump in elevated powershell |
| 📜 `reconnaissance/linux/execute_firefox_decrypt.sh` | download firefox_decrypt.py to server and execute |
| 📜 `reconnaissance/linux/execute_linkatz.sh` | download linikatz to server and execute (root needed) |
| 📜 `reconnaissance/linux/execute_linpeas.sh` | download linpeas to server and execute |
| 📜 `reconnaissance/linux/execute_mimipenguin_bash.sh` | download mimipenguin.sh and find credentials in files and memory (root required) |
| 📜 `reconnaissance/linux/execute_mimipenguin_python.sh` | download mimipenguin.py and find credentials in files and memory (root required) |
| 📜 `reconnaissance/linux/klist_get_info.sh` | klist: get info of file |
| 📜 `reconnaissance/linux/klist_impersonating_user_with_file.sh` | klist: impersonating user with file |
| 📜 `reconnaissance/linux/linpeas_one_liner.sh` | linpeas one liner |
| 📜 `reconnaissance/linux/local_port_scan_on_ip.sh` | local port scan on ip |
| 📜 `reconnaissance/linux/mini_linpeas.sh` | perform mini linpeas to get pentest info |
| 📜 `reconnaissance/linux/mount_nfs_file_system.sh` | mount to ip |
| 📜 `reconnaissance/linux/ping_sweep_linux.sh` | ping sweep - check if ips are alive in ip range 0.0.0 |
| 📜 `reconnaissance/linux/set_ccache_file_as_variable.sh` | set ccache file as variable KRB5CCNAME |
| 📜 `reconnaissance/linux/show_mounts.sh` | show ip mounts |
| 📜 `reconnaissance/linux/tcpdump_sniff_traffic.sh` | sniff for traffic with tcpdump and save to pcap file |
| 📜 `reconnaissance/linux/unmount_nfs_file_system.sh` | unmount ip mount |
<br />

### reconnaissance/linux/responder

scripts to start responder

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/linux/responder/start_responder.sh` | start responder |
<br />

### reconnaissance/linux/wmiexec

scripts to use wmiexec

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/linux/wmiexec/login_with_ccache_file.sh` | login with wmiexec with ccache file |
<br />

### reconnaissance/linux/wmiexec/proxychains

proxychains: scripts to use wmiexec

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/linux/wmiexec/proxychains/login_with_ccache_file.sh` | proxychains: login with wmiexec with ccache file |
<br />

### reconnaissance/username-anarchy

scripts to create custom ad username lists with username-anarchy

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/username-anarchy/create_from_country_name.sh` | create ad usernames from country name |
| 📜 `reconnaissance/username-anarchy/create_from_firstname_lastname.sh` | create ad usernames from firstname and lastname |
| 📜 `reconnaissance/username-anarchy/create_usernames_from_input_file.sh` | create ad usernames from input file |
| 📜 `reconnaissance/username-anarchy/reconise_format_from_username.sh` | recognise format from username |
| 📜 `reconnaissance/username-anarchy/show_formats.sh` | show available formats |
<br />

### reconnaissance/windows

scripts to do reconnaissance on windows

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/get_usernames_ntlm_hashes_from_ntlm_username_rid_lm_ntlm_hashes.sh` | save username and ntlm hashes in seperated files from form username:RID:LM:NTLM::: |
| 📜 `reconnaissance/windows/impacket_get_ad_users.sh` | Impacket: GetADUsers.py get domain users |
| 📜 `reconnaissance/windows/impacket_ntlmrelay_dump_sam_database.sh` | ntlmrelayx: NTLM relayx attack, dump sam database |
| 📜 `reconnaissance/windows/impacket_ntlmrelay_execute_cmd.sh` | ntlmrelayx: NTLM relayx attack, execute cmd |
| 📜 `reconnaissance/windows/impacket_ntlmrelay_start_shell.sh` | ntlmrelayx: NTLM relayx attack, execute cmd |
| 📜 `reconnaissance/windows/psexect_to_user.sh` | Impacket: psexec.py get psexec shell |
| 📜 `reconnaissance/windows/read_sam_database.sh` | secretsdump: dump secrets with SYSTEM, SAM, and SECURITY(optional) database. |
| 📜 `reconnaissance/windows/request_user_spns_check_for_services.sh` | GetUserSPNs: check for services |
| 📜 `reconnaissance/windows/save_sam_database.sh` | Registry: Save SYSTEM, SECURITY, and SAM hives. |
| 📜 `reconnaissance/windows/secretsdump_ntds_system.sh` | secretsdump: dump secrets with ntds and system.save file. |
| 📜 `reconnaissance/windows/show_user_spns.sh` | GetUserSPNs: check for services |
| 📜 `reconnaissance/windows/snaffler.sh` | Run Snaffler on domain. |
| 📜 `reconnaissance/windows/wmiexec_connect_to_user.sh` | wmiexec: get shell to user |
<br />

### reconnaissance/windows/activeDirectroy

scripts for active directory (AD) hacking

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/get_user_tgt.sh` | get user Ticket Granting Ticket (TGT) |
<br />

### reconnaissance/windows/activeDirectroy/bloodyAD

scripts for bloodyAD

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/bloodyAD/set_domain_group_owner.sh` | bloody AD: add user to group |
<br />

### reconnaissance/windows/activeDirectroy/certipy_ad

scripts for cetipy-ad to perform certificate exploit

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/certipy_ad/add_officer.sh` | add officer |
| 📜 `reconnaissance/windows/activeDirectroy/certipy_ad/automate_exploit.sh` | automaticly exploit |
| 📜 `reconnaissance/windows/activeDirectroy/certipy_ad/check_if_user_is_vurnerable.sh` | check if user is vulnerable |
| 📜 `reconnaissance/windows/activeDirectroy/certipy_ad/enable_template.sh` | enable template |
| 📜 `reconnaissance/windows/activeDirectroy/certipy_ad/get_hash_with_pfx_file.sh` | get hash with pfx file |
| 📜 `reconnaissance/windows/activeDirectroy/certipy_ad/issue_request_certificate.sh` | request certificate according to template |
| 📜 `reconnaissance/windows/activeDirectroy/certipy_ad/list_templates.sh` | check if user is vulnerable |
| 📜 `reconnaissance/windows/activeDirectroy/certipy_ad/request_certificate.sh` | request certificate according to template |
| 📜 `reconnaissance/windows/activeDirectroy/certipy_ad/retrieve_certificate.sh` | retrieve certificate |
<br />

### reconnaissance/windows/activeDirectroy/invokeTokenManipulation

invoke TokenManipulation attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/invokeTokenManipulation/ps_impersonate_as_system.sh` | ps: Makes the current PowerShell thread impersonate SYSTEM. |
| 📜 `reconnaissance/windows/activeDirectroy/invokeTokenManipulation/ps_impersonate_lsass_security_token.sh` | ps: Makes the current thread impersonate the lsass security token |
| 📜 `reconnaissance/windows/activeDirectroy/invokeTokenManipulation/ps_list_all_tokens_on_computer.sh` | ps: Lists all tokens available on the computer. |
| 📜 `reconnaissance/windows/activeDirectroy/invokeTokenManipulation/ps_list_tokens_on_computer.sh` | ps: Lists all unique usable tokens on the computer. |
| 📜 `reconnaissance/windows/activeDirectroy/invokeTokenManipulation/ps_spawn_cmd_as_system.sh` | ps: Spawns cmd.exe as SYSTEM. |
| 📜 `reconnaissance/windows/activeDirectroy/invokeTokenManipulation/ps_upload_tokenManipulation.sh` | ps: Upload and import module Invoke-TokenManipulation.ps1 |
<br />

### reconnaissance/windows/activeDirectroy/kerbrute

perform kerbrute attacks

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/kerbrute/bruteforce_username_and_password.sh` | kerbrute: user enumerate on DC |
<br />

### reconnaissance/windows/activeDirectroy/powerVIew

scripts for powerview.ps1

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/add_user_to_ad_group.sh` | powerview: add user to ad group |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/export_ad_users_to_csv_file.sh` | powerview: export ad users to csv file |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/export_spn_users.sh` | PowerShell: Get SPNs, format for Hashcat, export to spns.csv. |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/get_domain_object_acl_ad_user_info.sh` | powerview: get DomainObjectACL AD user info |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/get_domain_user_info.sh` | powerview: get domain user info |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/get_samaccountname.sh` | PowerShell: Get SPN user account names. |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/list_domain_users.sh` | powerview: creating a List of Domain Users |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/loop_over_ad_users_and_get_ad_rights.sh` | powerview: loop over de ad_users and get AD rights |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/ps_upload_powerview_and_import.sh` | ps: Upload powerview and execute |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/set_dcsync_rights_to_ad_user.sh` | powerview: set dc sync rights of a group to a specific ad user |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/set_domain_group_owner.sh` | powerview: set domain group owner |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/set_full_rights_to_ad_user.sh` | powerview: set full rights of a group to a specific ad user |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/show_ad_users_in_group.sh` | powerview: show ad users in group |
<br />

### reconnaissance/windows/activeDirectroy/rubeus

perform Rubeus attacks

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/rubeus/ps_upload_robeus.sh` | ps: Upload Rubeus.exe |
<br />

### reconnaissance/windows/activeDirectroy/runasCs

runAsCS.exe exploit

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/runasCs/ps_upload_runascs.sh` | ps: Upload RunasCs.exe |
<br />

### reconnaissance/windows/activeDirectroy/sharpGPOAbuse

script to do SharpGPOAbuse attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/sharpGPOAbuse/ps_gpo_abuse.sh` | ps: do a GPO abuse |
| 📜 `reconnaissance/windows/activeDirectroy/sharpGPOAbuse/ps_upload_sharp_gpo_abuse.sh` | ps: Upload sharpGPOAbuse |
<br />

### reconnaissance/windows/asreproast

perform asreproast attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/asreproast/crack_kerberos5_etype-23_as_rep_hash.sh` | Crack Kerberos 5, etype 23, AS-REP hashes with hashcat. |
| 📜 `reconnaissance/windows/asreproast/do_asreproast_attack_hashcat.sh` | do an asreproast attack |
| 📜 `reconnaissance/windows/asreproast/do_asreproast_attack_john.sh` | do an asreproast attack |
<br />

### reconnaissance/windows/bloodhound

Scripts for starting BloodHound and Neo4j.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/bloodhound/cmd_upload_sharphound_and_execute.sh` | cmd: Upload sharphound and execute |
| 📜 `reconnaissance/windows/bloodhound/execute_sharphound.sh` | ps: execute sharphound |
| 📜 `reconnaissance/windows/bloodhound/ps_upload_sharphound_and_execute.sh` | ps: Upload sharphound and execute |
| 📜 `reconnaissance/windows/bloodhound/python_create_bloodhound_zip.sh` | Create a bloodhound zip with bloodhound-python |
| 📜 `reconnaissance/windows/bloodhound/start_bloodhound.sh` | Start Neo4j service and launch BloodHound GUI. |
<br />

### reconnaissance/windows/bloodhound/dcsync

perform DCSync attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/bloodhound/dcsync/secretsdump_domain_user.sh` | Impacket: use secretsdump to dump hashes (DCSync) |
<br />

### reconnaissance/windows/bloodhound/executeDCOM

exploit execute dcom permission

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/bloodhound/executeDCOM/dcom_attack_exploit.sh` | perform executeDcom attack |
<br />

### reconnaissance/windows/bloodhound/genericAll

perform genericAll attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/bloodhound/genericAll/genericAll_exploit_part1.sh` | powershell: genericAll permissions exploit |
<br />

### reconnaissance/windows/bloodhound/genericWrite

perform genericWrite attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/bloodhound/genericWrite/genericWrite_exploit_part1.sh` | powershell: genericWrite permissions exploit |
| 📜 `reconnaissance/windows/bloodhound/genericWrite/genericWrite_exploit_part2.sh` | powershell: genericWrite permissions exploit |
<br />

### reconnaissance/windows/bloodhound/genericWrite/proxychains

proxychains: perform genericWrite attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/bloodhound/genericWrite/proxychains/genericWrite_exploit_part2.sh` | proxychains: powershell: genericWrite permissions exploit |
<br />

### reconnaissance/windows/cmd

scripts to do reconnaissance in cmd

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/cmd/add_user.sh` | Net: Add use, add to administrators and RDP groups. |
| 📜 `reconnaissance/windows/cmd/add_user_to_domain.sh` | Net: Add user, add to Exchange Windows Permissions and Remote Mgmt groups. |
| 📜 `reconnaissance/windows/cmd/check_connected_drives.sh` | Net: Show connected network drives. |
| 📜 `reconnaissance/windows/cmd/check_local_administrators.sh` | Net: Check local administrators |
| 📜 `reconnaissance/windows/cmd/check_user_account.sh` | Net: Get user information. |
| 📜 `reconnaissance/windows/cmd/copy_file_from_shared_drive.sh` | Copy file from shared drive |
| 📜 `reconnaissance/windows/cmd/enable_rdp_with_ntlm_hash_login.sh` | cmd: enable rdp with ntlm hash login |
| 📜 `reconnaissance/windows/cmd/enable_rdp_with_password_login.sh` | cmd: enable rdp with password |
| 📜 `reconnaissance/windows/cmd/enable_restricted_admin_mode_rdp.sh` | enable restricted admin mode |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_any_exe.sh` | download winPEASany.exe to server and execute |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_any_ofs_exe.sh` | download winPEASany_ofs.exe to server and execute |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_bat.sh` | download winPEAS.bat to server and execute |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_x64_exe.sh` | download winPEASx64.exe to server and execute |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_x64_ofs_exe.sh` | download winPEASx64_ofs.exe to server and execute |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_x86_exe.sh` | download winPEASx86.exe to server and execute |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_x86_ofs_exe.sh` | download winPEASx86_ofs.exe to server and execute |
| 📜 `reconnaissance/windows/cmd/find_services.sh` | Find services |
| 📜 `reconnaissance/windows/cmd/get_tasklist.sh` | Get tasklist |
| 📜 `reconnaissance/windows/cmd/mini_linpeas.sh` | Perform mini Windows Linpeas to get pentest info |
| 📜 `reconnaissance/windows/cmd/net_user_domain_details.sh` | Net: Get domain user information. |
| 📜 `reconnaissance/windows/cmd/ping_sweep_cmd.sh` | ping sweep - check if ips are alive in ip range 0.0.0 |
| 📜 `reconnaissance/windows/cmd/proof_admin.sh` | Read contents of C:\Users\Administrator\Desktop\proof.txt. |
| 📜 `reconnaissance/windows/cmd/rdp_session_hijacking.sh` | RDP: Session Hijacking. |
| 📜 `reconnaissance/windows/cmd/root_admin.sh` | Read contents of C:\Users\Administrator\Desktop\root.txt. |
| 📜 `reconnaissance/windows/cmd/search_for_sensative_files.sh` | search for sensative files |
| 📜 `reconnaissance/windows/cmd/secretsdump_domain_user.sh` | Impacket: use secretsdump to dump hashes (DCSync) |
| 📜 `reconnaissance/windows/cmd/upload_invoke_smb_client.sh` | cmd: upload invoke-smbclient.ps1 file to server |
| 📜 `reconnaissance/windows/cmd/upload_invoke_smb_enum.sh` | cmd: upload invoke-smbenum.ps1 file to server |
| 📜 `reconnaissance/windows/cmd/upload_invoke_smb_exec.sh` | cmd: upload invoke-smbexec.ps1 file to server |
| 📜 `reconnaissance/windows/cmd/upload_invoke_the_hash.sh` | cmd: upload invoke-thehash.ps1 file to server |
| 📜 `reconnaissance/windows/cmd/upload_invoke_wmi_exec.sh` | cmd: upload invoke-wmiexec.ps1 file to server |
<br />

### reconnaissance/windows/enum4linux

Scripts for enum4linux.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/enum4linux/enum4linux_smb_null_session.sh` | Enumerate users and passwords via enum4linux. |
<br />

### reconnaissance/windows/enum4linux/proxychains

proxychains: Scripts for enum4linux.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/enum4linux/proxychains/enum4linux_smb_null_session.sh` | proxychains: Enumerate users and passwords via enum4linux. |
<br />

### reconnaissance/windows/evilWinRm

Scripts for establishing Evil-WinRM connections.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/evilWinRm/connect_to_user_hash.sh` | Connect with Evil-WinRM as user using NTLM hash. |
| 📜 `reconnaissance/windows/evilWinRm/connect_to_user_password.sh` | Connect with Evil-WinRM as Administrator using password. |
<br />

### reconnaissance/windows/evilWinRm/proxychains

proxychains: Scripts for establishing Evil-WinRM connections.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/evilWinRm/proxychains/connect_to_user_hash.sh` | proxychains: Connect with Evil-WinRM as user using NTLM hash. |
| 📜 `reconnaissance/windows/evilWinRm/proxychains/connect_to_user_password.sh` | proxychains: Connect with Evil-WinRM as Administrator using password. |
<br />

### reconnaissance/windows/inveight

perform attacks with inveight

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/inveight/ps_upload_powerview_and_import.sh` | ps: Upload Inveigh.ps1 and import module |
| 📜 `reconnaissance/windows/inveight/start_inveight.sh` | Start Inveigh and perform a poofing attacks and captures hash/credential |
| 📜 `reconnaissance/windows/inveight/stop_inveight.sh` | Stop Inveigh |
<br />

### reconnaissance/windows/kerberoasting

Scripts for Kerberoasting (SPN retrieval).

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/kerberoasting/export_spn_users.sh` | PowerShell: Get SPNs, format for Hashcat, export to spns.csv. |
| 📜 `reconnaissance/windows/kerberoasting/get_samaccountname.sh` | PowerShell: Get SPN user account names. |
<br />

### reconnaissance/windows/kerbrute

perform kerbrute attacks

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/kerbrute/bruteforce_username_and_password.sh` | kerbrute: user enumerate on DC |
<br />

### reconnaissance/windows/lazagne

perform attacks with lazagne

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/lazagne/cmd_upload_lazagne_file.sh` | cmd: upload LaZagne file to server |
| 📜 `reconnaissance/windows/lazagne/lazagne_dump_browser_credentials.sh` | laZagne: Dump browser stored credentials |
| 📜 `reconnaissance/windows/lazagne/lazagne_dump_credentials.sh` | laZagne: Dump windows stored credentials |
| 📜 `reconnaissance/windows/lazagne/ps_upload_lazagne_exe.sh` | ps upload LaZagne to server |
<br />

### reconnaissance/windows/ldap

scripts to do ldap enumerations

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/ldap/ldap_website_search.sh` | ldap: search on a website form for uid or other fields |
| 📜 `reconnaissance/windows/ldap/ldapsearch_check_base_naming_contexts.sh` | ldapsearch check for base namingcontexts |
| 📜 `reconnaissance/windows/ldap/ldapsearch_check_specific_naming_contexts.sh` | ldapsearch check for specific namingcontexts |
| 📜 `reconnaissance/windows/ldap/ldapsearch_get_spn_of_specific_naming_contexts.sh` | ldapsearch show user info of specific namingcontexts |
| 📜 `reconnaissance/windows/ldap/ldapsearch_show_user_info_of_specific_naming_contexts.sh` | ldapsearch show user info of specific namingcontexts |
| 📜 `reconnaissance/windows/ldap/nmap_ldap_scripts_scan.sh` | nmap scan with ldap scripts |
<br />

### reconnaissance/windows/ldapsearchAd

perform ldapsearch-ad enumerations

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/ldapsearchAd/enumerate_ldap.sh` | enumerate ldap |
| 📜 `reconnaissance/windows/ldapsearchAd/enumerate_ldap_with_username_password.sh` | enumerate ldap with username and password |
<br />

### reconnaissance/windows/lookupsid

get domain info with lookupsid.py

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/lookupsid/lookup_sids.sh` | lookupsid.py - lookup domain and user sid |
<br />

### reconnaissance/windows/mimikatz

Scripts for Active Directory enumeration and credential dumping.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/mimikatz/cmd_upload_mimikatz_exe.sh` | cmd: upload mimikatz to server |
| 📜 `reconnaissance/windows/mimikatz/dump_lsa_secrets.sh` | Mimikatz: Dump lsa secrets. |
| 📜 `reconnaissance/windows/mimikatz/dump_lsass_credentials.sh` | Mimikatz: Dump LSASS credentials (remove protection, debug, logonpasswords). |
| 📜 `reconnaissance/windows/mimikatz/dump_lsass_credentials_with_processprotect.sh` | Mimikatz: Dump LSASS credentials (remove protection, debug, logonpasswords). |
| 📜 `reconnaissance/windows/mimikatz/execute_program_with_pass_the_hash.sh` | Mimikatz: execute program with pass the hash |
| 📜 `reconnaissance/windows/mimikatz/export_tickets.sh` | Mimikatz: export tickets |
| 📜 `reconnaissance/windows/mimikatz/extract_kerberos_keys.sh` | Mimikatz: extract kerberos keys |
| 📜 `reconnaissance/windows/mimikatz/get_tgt_ticket.sh` | Mimikatz: get tgt ticket |
| 📜 `reconnaissance/windows/mimikatz/import_tgt_ticket.sh` | Mimikatz: import tgt ticket |
| 📜 `reconnaissance/windows/mimikatz/kerberos_double_hop_fix.sh` | Fix Kerberos "Double Hop" problem when using WinRM/Powershell |
| 📜 `reconnaissance/windows/mimikatz/ps_upload_mimikatz_exe.sh` | ps: upload mimikatz to server |
<br />

### reconnaissance/windows/netexec

scripts to perform netexec (nxc)

<br />

### reconnaissance/windows/netexec/ftp

perform netexec ftp attacks

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/ftp/login_with_username_file_password_file.sh` | login with username file and password file |
| 📜 `reconnaissance/windows/netexec/ftp/login_with_username_password.sh` | login with username and password |
<br />

### reconnaissance/windows/netexec/rdp

NetExec scripts for RDP connections.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/rdp/check_ad_users_and_passwords.sh` | nxc rdp: Check RDP with user/pass. |
| 📜 `reconnaissance/windows/netexec/rdp/check_ad_users_and_passwords_with_files.sh` | nxc rdp: Check RDP with user/pass lists, continue on success. |
<br />

### reconnaissance/windows/netexec/rdp/proxychains

proxychains: NetExec scripts for RDP connections.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/rdp/proxychains/check_ad_users_and_passwords.sh` | proxychains: nxc rdp: Check RDP with user/pass. |
| 📜 `reconnaissance/windows/netexec/rdp/proxychains/check_ad_users_and_passwords_with_files.sh` | proxychains: nxc rdp: Check RDP with user/pass lists, continue on success. |
<br />

### reconnaissance/windows/netexec/smb

perform netexec smb attacks

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/smb/administrator_hash.sh` | check if smb is possible for username and hash |
| 📜 `reconnaissance/windows/netexec/smb/check_anonymous.sh` | check if anonymous guest session is possible |
| 📜 `reconnaissance/windows/netexec/smb/convert_smb_rid_brute_force_to_username_list.sh` | convert smb rid-bruteforce to users list |
| 📜 `reconnaissance/windows/netexec/smb/dump_credentials_from_lsa.sh` | dump lsa |
| 📜 `reconnaissance/windows/netexec/smb/dump_credentials_from_sam.sh` | dump sam |
| 📜 `reconnaissance/windows/netexec/smb/dump_ntds.sh` | dump ntds |
| 📜 `reconnaissance/windows/netexec/smb/enumerate_ad_users_and_passwords.sh` | enumerate over ad users and password file |
| 📜 `reconnaissance/windows/netexec/smb/enumerate_group.sh` | enumerate groups |
| 📜 `reconnaissance/windows/netexec/smb/enumerate_users_execute_cmd.sh` | execute cmd command |
| 📜 `reconnaissance/windows/netexec/smb/enumerate_users_execute_smbexec.sh` | execute smbexec command |
| 📜 `reconnaissance/windows/netexec/smb/find_autologon_in_registry_xml.sh` | searches the domain controller for registry.xml |
| 📜 `reconnaissance/windows/netexec/smb/login_with_username_password.sh` | login with username and password |
| 📜 `reconnaissance/windows/netexec/smb/null_session.sh` | check if null session is possible |
| 📜 `reconnaissance/windows/netexec/smb/password_policy.sh` | get password policy |
| 📜 `reconnaissance/windows/netexec/smb/rid_brute.sh` | enumerate users by bruteforcing RIDs |
| 📜 `reconnaissance/windows/netexec/smb/show_shares.sh` | show smb shares |
| 📜 `reconnaissance/windows/netexec/smb/smb_enumerate_users.sh` | enumerate users |
| 📜 `reconnaissance/windows/netexec/smb/smb_start_listener.sh` | inject reverse shell |
| 📜 `reconnaissance/windows/netexec/smb/spider_plus_share.sh` | netexec smb use spider_plus to get all share files |
| 📜 `reconnaissance/windows/netexec/smb/user_hash.sh` | check if smb is possible for user hash |
| 📜 `reconnaissance/windows/netexec/smb/write_file_to_smb_share.sh` | write file to smb share |
<br />

### reconnaissance/windows/netexec/smb/proxychains

proxychains: perform netexec smb attacks

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/smb/proxychains/administrator_hash.sh` | proxychains: check if smb is possible for username and hash |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/check_anonymous.sh` | proxychains: check if anonymous guest session is possible |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/convert_smb_rid_brute_force_to_username_list.sh` | proxychains: convert smb rid-bruteforce to users list |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/dump_credentials_from_lsa.sh` | proxychains: dump lsa |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/dump_credentials_from_sam.sh` | proxychains: dump sam |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/dump_ntds.sh` | proxychains: dump ntds |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/enumerate_ad_users_and_passwords.sh` | proxychains: enumerate over ad users and password file |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/enumerate_group.sh` | proxychains: enumerate groups |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/enumerate_users_execute_cmd.sh` | proxychains: execute cmd command |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/enumerate_users_execute_smbexec.sh` | proxychains: execute smbexec command |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/find_autologon_in_registry_xml.sh` | proxychains: searches the domain controller for registry.xml |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/login_with_username_password.sh` | proxychains: login with username and password |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/null_session.sh` | proxychains: check if null session is possible |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/password_policy.sh` | proxychains: get password policy |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/rid_brute.sh` | proxychains: enumerate users by bruteforcing RIDs |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/show_shares.sh` | proxychains: show smb shares |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/smb_enumerate_users.sh` | proxychains: enumerate users |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/smb_start_listener.sh` | proxychains: inject reverse shell |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/spider_plus_share.sh` | proxychains: netexec smb use spider_plus to get all share files |
| 📜 `reconnaissance/windows/netexec/smb/proxychains/user_hash.sh` | proxychains: check if smb is possible for user hash |
<br />

### reconnaissance/windows/netexec/winrm

NetExec scripts for WinRM connections.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/winrm/check_ad_users_and_passwords.sh` | nxc winrm: Check WinRM connection with username and password. |
<br />

### reconnaissance/windows/netexec/winrm/proxychains

proxychains: NetExec scripts for WinRM connections.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/winrm/proxychains/check_ad_users_and_passwords.sh` | proxychains: nxc winrm: Check WinRM connection with username and password. |
<br />

### reconnaissance/windows/passwordSpraying

Scripts for performing password spraying attacks.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/passwordSpraying/domain_password_spray.sh` | PowerShell: Password spray using DomainPasswordSpray.ps1. |
| 📜 `reconnaissance/windows/passwordSpraying/upload_domain_password_spray_ps1.sh` | PowerShell: upload and import DomainPasswordSpray.ps1. |
<br />

### reconnaissance/windows/permissions

Scripts related to privilege escalation and permission manipulation.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/permissions/cmd_audit_user_token_privileges.sh` | SharpUp - audit token privileges - cmd: download SharpUp to server and execute. |
| 📜 `reconnaissance/windows/permissions/ps_audit_user_token_privileges.sh` | SharpUp - audit token privileges - PS: download SharpUp to server and execute. |
| 📜 `reconnaissance/windows/permissions/ps_enableTokens.sh` | enable permission tokens |
<br />

### reconnaissance/windows/permissions/SeDebugPrivilege

exploit SeDebugPrivilege permission

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/permissions/SeDebugPrivilege/SeDebugPrivilege.sh` | exploit SeDebugPrivilege permission |
<br />

### reconnaissance/windows/permissions/forceChangePassword

exploit forceChangePassword permission

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/permissions/forceChangePassword/forceChangePassword.sh` | PowerShell: Force change password for user. |
<br />

### reconnaissance/windows/permissions/seBackupPrivilege

exploit seBackupPrivilege permission

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/permissions/seBackupPrivilege/copy_file_with_Copy-FileSeBackupPrivilege.sh` | copy file with Copy-FileSeBackupPrivilege |
| 📜 `reconnaissance/windows/permissions/seBackupPrivilege/seBackupPrivilege-part1.sh` | Registry: Save SYSTEM, SECURITY, and SAM hives. |
| 📜 `reconnaissance/windows/permissions/seBackupPrivilege/seBackupPrivilege-part2_with_security.sh` | Impacket: Local secretsdump using SYSTEM, SAM, and SECURITY hives. |
| 📜 `reconnaissance/windows/permissions/seBackupPrivilege/seBackupPrivilege-part2_without_security.sh` | Registry: Save SYSTEM, SECURITY, and SAM hives. |
| 📜 `reconnaissance/windows/permissions/seBackupPrivilege/upload_and_import_copy_FileSeBackupPrivilege.sh` | ps: upload and import Copy-FileSeBackupPrivilege modules |
<br />

### reconnaissance/windows/permissions/seImpersonatePrivilege

exploit SeImpersonatePrivilege permission

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/permissions/seImpersonatePrivilege/cmd_seImpersonatePrivilege.sh` | CMD: PrintSpoofer: Reverse shell using SeImpersonatePrivilege. |
| 📜 `reconnaissance/windows/permissions/seImpersonatePrivilege/ps_seImpersonatePrivilege.sh` | PS: PrintSpoofer: Reverse shell using SeImpersonatePrivilege. |
<br />

### reconnaissance/windows/permissions/seTakeOwnershipPrivilege

exploit SeTakeOwnershipPrivilege permission

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/permissions/seTakeOwnershipPrivilege/seTakeOwnershipPrivilege.sh` | exploit SeTakeOwnershipPrivilege permission |
<br />

### reconnaissance/windows/powershell

scripts to do reconnaissance in powershell

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/powershell/check_default_username.sh` | Powershell: Check default username |
| 📜 `reconnaissance/windows/powershell/check_defender_status.sh` | check defender status |
| 📜 `reconnaissance/windows/powershell/check_internal_listening_ports.sh` | check internal listening ports |
| 📜 `reconnaissance/windows/powershell/create_lsass_dump.sh` | Powershell: create lsass.dump in elevated powershell |
| 📜 `reconnaissance/windows/powershell/create_new_powershell_session_to_computer.sh` | Powershell - login to user on a different computer |
| 📜 `reconnaissance/windows/powershell/create_shadowdisk_of_drive.sh` | ps: create shadow disk (backup) and get ntds.dit |
| 📜 `reconnaissance/windows/powershell/disable_defender.sh` | Disable Windows Defender and Firewall. |
| 📜 `reconnaissance/windows/powershell/disable_firewall.sh` | Disable firewall |
| 📜 `reconnaissance/windows/powershell/download_and_execute_custom_script_in_memory.sh` | PowerShell: Download and execute script in memory. |
| 📜 `reconnaissance/windows/powershell/elevate_user.sh` | Powershell - elevate user |
| 📜 `reconnaissance/windows/powershell/enable_rdp_with_ntlm_hash_login.sh` | Powershell: enable rdp with ntlm hash login |
| 📜 `reconnaissance/windows/powershell/enable_rdp_with_password_login.sh` | cmd: enable rdp with password |
| 📜 `reconnaissance/windows/powershell/execute_invoke_smb_exec.sh` | ps: upload invoke-smbexec.ps1 file to server |
| 📜 `reconnaissance/windows/powershell/find_password_in_txt_ini_config_db_py_files.sh` | Search for password in .txt,.ini, config, .db, .py files |
| 📜 `reconnaissance/windows/powershell/find_passwords_in_account_description.sh` | PowerShell: Get users with non-null descriptions. |
| 📜 `reconnaissance/windows/powershell/get_clear_password_from_powershell_cred_xml_file.sh` | ps: get clear password from powershell credentials xml file |
| 📜 `reconnaissance/windows/powershell/import_module_powerview_ps1.sh` | PowerShell: Import PowerView module. |
| 📜 `reconnaissance/windows/powershell/mini_linpeas.sh` | perform mini linpeas to get pentest info (PowerShell version) |
| 📜 `reconnaissance/windows/powershell/ping_sweep_powershell.sh` | ping sweep - check if ips are alive in ip range 0.0.0 |
| 📜 `reconnaissance/windows/powershell/proof_admin.sh` | Read contents of C:\Users\Administrator\Desktop\proof.txt. |
| 📜 `reconnaissance/windows/powershell/ps_disable_defender.sh` | Disable defender |
| 📜 `reconnaissance/windows/powershell/register_disable_defender.sh` | Disable defender in register |
| 📜 `reconnaissance/windows/powershell/restore_item_from_recycle_bin.sh` | Powershell: restore item from recycle bin |
| 📜 `reconnaissance/windows/powershell/root_admin.sh` | Read contents of C:\Users\Administrator\Desktop\root.txt. |
| 📜 `reconnaissance/windows/powershell/save_custom_script_to_remote_server.sh` | PowerShell: Save file and save in current remote folder. |
| 📜 `reconnaissance/windows/powershell/search_for_content_in_files.sh` | Powershell: search for content in string |
| 📜 `reconnaissance/windows/powershell/search_for_file.sh` | Powershell: search for a file or extension |
| 📜 `reconnaissance/windows/powershell/show_hidden_directories.sh` | Powershell: show hidden directories |
| 📜 `reconnaissance/windows/powershell/show_hidden_files.sh` | Powershell: show hidden files |
| 📜 `reconnaissance/windows/powershell/show_items_in_recycle_bin.sh` | Powershell: Show Items in recycle bin |
| 📜 `reconnaissance/windows/powershell/show_process_info.sh` | Powershell: show process info |
| 📜 `reconnaissance/windows/powershell/upload_invoke_smb_client.sh` | ps: upload invoke-smbclient.ps1 file to server |
| 📜 `reconnaissance/windows/powershell/upload_invoke_smb_enum.sh` | ps: upload invoke-smbenum.ps1 file to server |
| 📜 `reconnaissance/windows/powershell/upload_invoke_the_hash.sh` | ps: upload invoke-thehash.ps1 file to server |
| 📜 `reconnaissance/windows/powershell/upload_invoke_wmi_exec.sh` | ps: upload invoke-wmiexec.ps1 file to server |
| 📜 `reconnaissance/windows/powershell/upload_winpeas_any_file.sh` | ps: upload winPEASany.exe file to server |
| 📜 `reconnaissance/windows/powershell/upload_winpeas_any_ofs_file.sh` | ps: upload winPEASany_ofs.exe file to server |
| 📜 `reconnaissance/windows/powershell/upload_winpeas_bat_file.sh` | ps: upload winPEAS.bat file to server |
| 📜 `reconnaissance/windows/powershell/upload_winpeas_x64_file.sh` | ps: upload winPEASx64.exe file to server |
| 📜 `reconnaissance/windows/powershell/upload_winpeas_x64_ofs_file.sh` | ps: upload winPEASx64_ofs.exe file to server |
| 📜 `reconnaissance/windows/powershell/upload_winpeas_x86_file.sh` | ps: upload winPEASx86.exe file to server |
| 📜 `reconnaissance/windows/powershell/upload_winpeas_x86_ofs_file.sh` | ps: upload winPEASx86_ofs.exe file to server |
<br />

### reconnaissance/windows/rdesktop

scripts to login to rdesktop

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/rdesktop/login_to_rdp.sh` | rdesktop: Connect with specified credentials. |
<br />

### reconnaissance/windows/rpcclient

scripts to read AD info with rpcclient

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/rpcclient/dumping_detailed_user_info.sh` | rpcclient: dumping detailed user info |
| 📜 `reconnaissance/windows/rpcclient/dumping_domain_info.sh` | rpcclient: dumping domain info |
| 📜 `reconnaissance/windows/rpcclient/dumping_domain_password_policy.sh` | rpcclient: Dumping domain password policy |
| 📜 `reconnaissance/windows/rpcclient/dumping_groups.sh` | rpcclient: Dumping groups |
| 📜 `reconnaissance/windows/rpcclient/dumping_groups_rid.sh` | rpcclient: Dumping groups rid |
| 📜 `reconnaissance/windows/rpcclient/dumping_users.sh` | rpcclient: Dumping users |
| 📜 `reconnaissance/windows/rpcclient/dumping_users_rid.sh` | rpcclient: Duming users rid |
| 📜 `reconnaissance/windows/rpcclient/enumerate_all_available_shares.sh` | rpcclient: enumerates all available shares |
| 📜 `reconnaissance/windows/rpcclient/enumerate_all_domains.sh` | rpcclient: enumerate all domains |
| 📜 `reconnaissance/windows/rpcclient/get_info_of_specific_share.sh` | rpcclient: provides information about a specific share |
| 📜 `reconnaissance/windows/rpcclient/get_server_info.sh` | rpcclient: get server info |
| 📜 `reconnaissance/windows/rpcclient/rpcclient_brute_force_rids.sh` | rpcclient: brute Forcing User RIDs |
| 📜 `reconnaissance/windows/rpcclient/samrdump_brute_force_rids.sh` | samrdump.py: brute Forcing User RIDs |
<br />

### reconnaissance/windows/rubeus

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/rubeus/execute_createnetonly.sh` | Rubeus: execute createnetonly |
| 📜 `reconnaissance/windows/rubeus/export_tickets.sh` | Rubeus: export tickets |
| 📜 `reconnaissance/windows/rubeus/get_tgt_ticket.sh` | Rubeus: get tgt ticket |
| 📜 `reconnaissance/windows/rubeus/import_tgt_ticket.sh` | Rubeus: import tgt ticket |
| 📜 `reconnaissance/windows/rubeus/perform_kerberoast_attack_on_domain.sh` | Rubeus: perform kerberoast attack on domain |
| 📜 `reconnaissance/windows/rubeus/ps_upload_robeus.sh` | ps: Upload Rubeus.exe |
<br />

### reconnaissance/windows/smbclient

Scripts using smbclient for share enumeration and access.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/smbclient/connect_to_share_anonymous.sh` | smbclient: Connect to share anonymous. |
| 📜 `reconnaissance/windows/smbclient/connect_to_share_with_user.sh` | smbclient: Connect to share with user. |
| 📜 `reconnaissance/windows/smbclient/decrypt_groups_xml_cpassword.sh` | decrypt cpassword from groups.xml |
| 📜 `reconnaissance/windows/smbclient/download_folders_resurcive.sh` | smbclient: download files recursive |
| 📜 `reconnaissance/windows/smbclient/enable_recursive.sh` | smbclient: enable recursive |
| 📜 `reconnaissance/windows/smbclient/execute_cmd_with_kerberos_user.sh` | smbclient: execute cmd with kerberos user |
| 📜 `reconnaissance/windows/smbclient/search_in_downloaded_files_for_groups_xml.sh` | search for group policies in downloaded folders |
| 📜 `reconnaissance/windows/smbclient/show_shares.sh` | smbclient: List shares. |
| 📜 `reconnaissance/windows/smbclient/turn_off_prompt.sh` | smbclient: turn off prompt |
<br />

### reconnaissance/windows/smbclient/proxychains

proxychains: Scripts using smbclient for share enumeration and access.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/smbclient/proxychains/connect_to_share_anonymous.sh` | proxychains: smbclient: Connect to share anonymous. |
| 📜 `reconnaissance/windows/smbclient/proxychains/connect_to_share_with_user.sh` | proxychains: smbclient: Connect to share with user. |
| 📜 `reconnaissance/windows/smbclient/proxychains/show_shares.sh` | proxychains: smbclient: List shares. |
<br />

### reconnaissance/windows/smbmap

Scripts using smbmap for SMB share enumeration and command execution.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/smbmap/administrator_execute_cmd_with_ntlm_hash.sh` | smbmap: Execute command on smb as user with NTLM hash. |
| 📜 `reconnaissance/windows/smbmap/administrator_execute_cmd_with_password.sh` | smbmap: Execute |
| 📜 `reconnaissance/windows/smbmap/show_shares.sh` | smbmap: show shares. |
<br />

### reconnaissance/windows/smbmap/proxychains

proxychains: Scripts using smbmap for SMB share enumeration and command execution.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/smbmap/proxychains/administrator_execute_cmd_with_ntlm_hash.sh` | proxychains: smbmap: Execute command on smb as user with NTLM hash. |
| 📜 `reconnaissance/windows/smbmap/proxychains/administrator_execute_cmd_with_password.sh` | proxychains: smbmap: Execute |
| 📜 `reconnaissance/windows/smbmap/proxychains/show_shares.sh` | proxychains: smbmap: show shares. |
<br />

### reconnaissance/windows/targetedKerberoast

perform targeted kerberoast attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/targetedKerberoast/targeted_kerberoast_with_user_file.sh` | targeted kerberoast attack on ad users files |
<br />

### reconnaissance/windows/xfreerdp

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/xfreerdp/xfreerdp.sh` | xfreerdp: Connect with specified credentials. |
| 📜 `reconnaissance/windows/xfreerdp/xfreerdp_pass_the_hash.sh` | xfreerdp: Connect with specified credentials with pass the hash |
| 📜 `reconnaissance/windows/xfreerdp/xfreerdp_with_attached_drive.sh` | xfreerdp: Connect, map drive |
| 📜 `reconnaissance/windows/xfreerdp/xfreerdp_with_attached_drive_pass_the_hash.sh` | xfreerdp: Connect with pass the hash, map drive |
<br />

### reconnaissance/windows/xfreerdp/proxychains

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/xfreerdp/proxychains/xfreerdp.sh` | proxychains: xfreerdp: Connect with specified credentials. |
| 📜 `reconnaissance/windows/xfreerdp/proxychains/xfreerdp_with_attached_drive.sh` | proxychains: xfreerdp: Connect, map drive |
<br />

### shell

scripts like automatically fix shell and make it interactive, start port listening, create rev shells

| Path | Description |
|------|-------------|
| 📜 `shell/fix_shell.sh` | Fix shell to fully interactive shell |
| 📜 `shell/listen_for_ping.sh` | listen for ping response |
| 📜 `shell/msf_virustotal_check_file.sh` | msf-virustotal: check file for virus scanner detection |
| 📜 `shell/netcat.sh` | start nc port listening |
| 📜 `shell/rlwrap_netcat.sh` | start rlwrap nc port listening |
<br />

### shell/background

| Path | Description |
|------|-------------|
| 📜 `shell/background/compile_hollow.sh` |  |
<br />

### shell/interactive_shell

scripts to get interactive shells

| Path | Description |
|------|-------------|
| 📜 `shell/interactive_shell/awk_get_interactive_shell.sh` | awk - get interactive shell |
| 📜 `shell/interactive_shell/find_get_interactive_shell.sh` | find - get interactive shell |
| 📜 `shell/interactive_shell/find_get_interactive_shell_usin_exec.sh` | find - get interactive shell using exec |
| 📜 `shell/interactive_shell/lua_get_interactive_shell.sh` | lua - get interactive shell |
| 📜 `shell/interactive_shell/perl_get_interactive_shell.sh` | perl - get interactive shell |
| 📜 `shell/interactive_shell/python3_pty_spawn.sh` | python3 - pyt.spawn |
| 📜 `shell/interactive_shell/python_pty_spawn.sh` | python - pyt.spawn |
| 📜 `shell/interactive_shell/ruby_get_interactive_shell.sh` | ruby - get interactive shell |
| 📜 `shell/interactive_shell/sh_get_interactive_shell.sh` | sh - get interactive shell |
| 📜 `shell/interactive_shell/vim_get_interactive_shell.sh` | vim - get interactive shell |
<br />

### shell/linux

linux reverse shells

| Path | Description |
|------|-------------|
| 📜 `shell/linux/mkfifo_reverse_shell.sh` | generate mkfifo reverse |
<br />

### shell/msfconsole

msfconsole scripts with start sock proxy, port forwarding, server routes

| Path | Description |
|------|-------------|
| 📜 `shell/msfconsole/copy_ruby_file_to_metasploit_modules.sh` | copy ruby file to metasploit framework plugins folder |
| 📜 `shell/msfconsole/copy_ruby_file_to_metasploit_plugins.sh` | copy ruby file to metasploit framework modules folder |
| 📜 `shell/msfconsole/listen_to_meterpreter_cmd_unix_bash_rev_shell.sh` | meterpreter: start meterpreter listener cmd/unix/reverse_bash |
| 📜 `shell/msfconsole/listen_to_meterpreter_java_jsp_rev_shell.sh` | meterpreter: start meterpreter listener java/jsp_shell_reverse_tcp |
| 📜 `shell/msfconsole/listen_to_meterpreter_linux_x64_rev_shell.sh` | meterpreter: start meterpreter listener linux/x86/meterpreter/reverse_tcp |
| 📜 `shell/msfconsole/listen_to_meterpreter_perl_rev_shell.sh` | meterpreter: start meterpreter listener cmd/unix/reverse_perl |
| 📜 `shell/msfconsole/listen_to_meterpreter_php_rev_shell.sh` | meterpreter: start meterpreter listener php/meterpreter_reverse_tcp |
| 📜 `shell/msfconsole/listen_to_meterpreter_python_rev_shell.sh` | meterpreter: start meterpreter listener cmd/unix/reverse_python |
| 📜 `shell/msfconsole/listen_to_meterpreter_war_rev_shell.sh` | meterpreter: start meterpreter listener java/jsp_shell_reverse_tcp |
| 📜 `shell/msfconsole/listen_to_meterpreter_windows_rev_shell.sh` | meterpreter: start meterpreter listener windows/meterpreter/reverse_tcp |
| 📜 `shell/msfconsole/listen_to_meterpreter_windows_x64_rev_shell.sh` | meterpreter: start meterpreter listener windows/x64/meterpreter/reverse_tcp |
| 📜 `shell/msfconsole/listen_to_windows_rev_shell.sh` | start listener payload windows/shell_reverse_tcp |
| 📜 `shell/msfconsole/meterpreter_port_forwarding.sh` | meterpreter: forward all trafic from remote port to local port |
| 📜 `shell/msfconsole/meterpreter_set_server_routes.sh` | meterpreter: set server routes |
| 📜 `shell/msfconsole/reload_all.sh` | reload all |
| 📜 `shell/msfconsole/search_exploitdb_for_metasploit_scripts.sh` | search exploit db for exploits |
| 📜 `shell/msfconsole/start_sock_proxy.sh` | Start socks proxy |
| 📜 `shell/msfconsole/start_windows_post_exploit_suggester.sh` | meterpreter: set windows post exploit suggester |
| 📜 `shell/msfconsole/start_windows_post_hash_dump.sh` | meterpreter: set windows post hash dump |
| 📜 `shell/msfconsole/upgrade_to_meterpreter.sh` | meterpreter:  upgrade shell to meterpreter |
<br />

### shell/msfconsole/meterpreter

scripts for meterpreter

| Path | Description |
|------|-------------|
| 📜 `shell/msfconsole/meterpreter/dump_hashes.sh` | dump hashes |
| 📜 `shell/msfconsole/meterpreter/dump_lsa_dump_sam.sh` | dump lsa_dump_sam |
| 📜 `shell/msfconsole/meterpreter/dump_lsa_dump_secrets.sh` | dump lsa_dump_secrets |
<br />

### shell/msfconsole/plugins

scripts for metasploit plugins

<br />

### shell/msfconsole/plugins/darkoperators_metasploit_plugins

scripts for darkoperator metasploit plugins

| Path | Description |
|------|-------------|
| 📜 `shell/msfconsole/plugins/darkoperators_metasploit_plugins/install_plugins.sh` | install plugins |
| 📜 `shell/msfconsole/plugins/darkoperators_metasploit_plugins/load_pentest.sh` | load pentest |
<br />

### shell/msfconsole/plugins/mimikatz

| Path | Description |
|------|-------------|
| 📜 `shell/msfconsole/plugins/mimikatz/load_mimikatz.sh` | load mimikatz |
| 📜 `shell/msfconsole/plugins/mimikatz/show_creds_all.sh` | meterpreter: show creds_all (mimikatz) |
<br />

### shell/msfconsole/proxychains

proxychains: msfconsole scripts with start sock proxy, port forwarding, server routes

| Path | Description |
|------|-------------|
| 📜 `shell/msfconsole/proxychains/listen_to_meterpreter_cmd_unix_bash_rev_shell.sh` | proxychains: meterpreter: start meterpreter listener cmd/unix/reverse_bash |
| 📜 `shell/msfconsole/proxychains/listen_to_meterpreter_java_jsp_rev_shell.sh` | proxychains: meterpreter: start meterpreter listener java/jsp_shell_reverse_tcp |
| 📜 `shell/msfconsole/proxychains/listen_to_meterpreter_linux_x64_rev_shell.sh` | proxychains: meterpreter: start meterpreter listener linux/x86/meterpreter/reverse_tcp |
| 📜 `shell/msfconsole/proxychains/listen_to_meterpreter_perl_rev_shell.sh` | proxychains: meterpreter: start meterpreter listener cmd/unix/reverse_perl |
| 📜 `shell/msfconsole/proxychains/listen_to_meterpreter_php_rev_shell.sh` | proxychains: meterpreter: start meterpreter listener php/meterpreter_reverse_tcp |
| 📜 `shell/msfconsole/proxychains/listen_to_meterpreter_python_rev_shell.sh` | proxychains: meterpreter: start meterpreter listener cmd/unix/reverse_python |
| 📜 `shell/msfconsole/proxychains/listen_to_meterpreter_war_rev_shell.sh` | proxychains: meterpreter: start meterpreter listener java/jsp_shell_reverse_tcp |
| 📜 `shell/msfconsole/proxychains/listen_to_meterpreter_windows_rev_shell.sh` | proxychains: meterpreter: start meterpreter listener windows/meterpreter/reverse_tcp |
| 📜 `shell/msfconsole/proxychains/listen_to_meterpreter_windows_x64_rev_shell.sh` | proxychains: meterpreter: start meterpreter listener windows/x64/meterpreter/reverse_tcp |
| 📜 `shell/msfconsole/proxychains/listen_to_windows_rev_shell.sh` | proxychains: start listener payload windows/shell_reverse_tcp |
<br />

### shell/msfvenom

msfvenom to create reverve shell files for metepreter

| Path | Description |
|------|-------------|
| 📜 `shell/msfvenom/create_asp_rev_shell.sh` | Create ASP file |
| 📜 `shell/msfvenom/create_aspx_rev_shell.sh` | Create ASPX file |
| 📜 `shell/msfvenom/create_backdoor_in_file.sh` | defender bypass with x86/shikata_ga_nai for .exe |
| 📜 `shell/msfvenom/create_bash_rev_shell.sh` | Create Bash file |
| 📜 `shell/msfvenom/create_c_rev_shell.sh` | Create C file |
| 📜 `shell/msfvenom/create_elf_rev_shell.sh` | Create ELF file |
| 📜 `shell/msfvenom/create_exe_rev_shell.sh` | Create EXE file |
| 📜 `shell/msfvenom/create_jsp_rev_shell.sh` | Create JSP file |
| 📜 `shell/msfvenom/create_perl_rev_shell.sh` | Create Perl file |
| 📜 `shell/msfvenom/create_php_rev_shell.sh` | Create PHP file |
| 📜 `shell/msfvenom/create_ps1_rev_shell.sh` | Create PS1 file |
| 📜 `shell/msfvenom/create_python_rev_shell.sh` | Create Python file |
| 📜 `shell/msfvenom/create_splunk_rev_shell.sh` | Create splunk rev shell |
| 📜 `shell/msfvenom/create_war_rev_shell.sh` | Create WAR file |
| 📜 `shell/msfvenom/defender_bypass_exe_rev_shell.sh` | defender bypass with x86/shikata_ga_nai for .exe |
<br />

### shell/windows

scripts to create windows shells

| Path | Description |
|------|-------------|
| 📜 `shell/windows/cmd_execute_conPtyShell.sh` | cmd: download Invoke-ConPtyShell.ps1 to server and start shell |
| 📜 `shell/windows/cmd_execute_powershellTcp.sh` | cmd: download Invoke-PowerShellTcp.ps1 to server and start shell |
| 📜 `shell/windows/cmd_upload_nc64_and_execute_cmd.sh` | upload nc64.exe and start nc64.exe and execute cmd |
| 📜 `shell/windows/cmd_upload_nc64_and_execute_powershell.sh` | upload nc64.exe and start nc64.exe and execute powershell |
| 📜 `shell/windows/cmd_upload_nc_and_execute_cmd.sh` | upload nc.exe and start nc.exe and execute cmd |
| 📜 `shell/windows/cmd_upload_nc_and_execute_powershell.sh` | upload nc.exe and start nc.exe and execute powershell |
| 📜 `shell/windows/powershell_one_liner_reverse_shell.sh` | generate reverse powershell oneliner |
| 📜 `shell/windows/powershell_reverse_shell.sh` | generate reverse shell in powershell |
| 📜 `shell/windows/powershell_reverse_shell_base64.sh` | generate base64 reverse shell in powershell |
| 📜 `shell/windows/ps_download_nc_file.sh` | ps: download nc file |
| 📜 `shell/windows/ps_execute_conPtyShell.sh` | ps: download Invoke-ConPtyShell.ps1 to server and start shell |
| 📜 `shell/windows/ps_execute_powershellTcp.sh` | ps: download Invoke-PowerShellTc.ps1 to server and start shell |
| 📜 `shell/windows/ps_login_as_user_and_create_reverse_shell.sh` | ps: login as user and create reverse shell |
<br />

### smtp

scripts for smtp attacks

| Path | Description |
|------|-------------|
| 📜 `smtp/nmap_check_for_open_relay.sh` | nmap: check for smtp open relay |
| 📜 `smtp/smtp_user_enum_search_for_usernames_big.sh` | smtp-user-enum: search for usernames with given domain name (xato-net-10-million-usernames-dup.txt) |
| 📜 `smtp/smtp_user_enum_search_for_usernames_small.sh` | smtp-user-enum: search for usernames with given domain name (Honeypot-Captures/multiplesources-users-fabian-fingerle.d.txt) |
<br />

### smtp/swaks

send emails with swaks

| Path | Description |
|------|-------------|
| 📜 `smtp/swaks/authentication_with_user_password.sh` | authentication with user and password |
| 📜 `smtp/swaks/send_email.sh` | send email |
| 📜 `smtp/swaks/send_email_with_attachment.sh` | send email |
<br />

### snmp

scripts to enumerate snmp

| Path | Description |
|------|-------------|
| 📜 `snmp/braa_enemerate_snmp_server.sh` | braa: get public info of server |
| 📜 `snmp/onesixtyone_enemerate_snmp_server.sh` | onesixtyone: get public info of server |
| 📜 `snmp/snmpwalk_enemerate_snmp_server.sh` | snmpwalk: get public info of server |
<br />

### sqlDatabase

perform database injections

<br />

### sqlDatabase/mssql

script to enable xp_cmdshell and read directories

| Path | Description |
|------|-------------|
| 📜 `sqlDatabase/mssql/check_current_user_name.sh` | check current username |
| 📜 `sqlDatabase/mssql/check_if_user_has_role.sh` | check if current user has (sysadmin) role |
| 📜 `sqlDatabase/mssql/check_linked_servers.sh` | check current username |
| 📜 `sqlDatabase/mssql/enable_xp_cmdshell.sh` | script to enable xp_cmdshell |
| 📜 `sqlDatabase/mssql/execute_as_linked_server.sh` | check current username |
| 📜 `sqlDatabase/mssql/execute_sp_execute_external_script.sh` | execute sp_execute_external_script command |
| 📜 `sqlDatabase/mssql/execute_xp_cmdshell.sh` | execute xp_cmdshell command |
| 📜 `sqlDatabase/mssql/identify_users_that_can_be_impersonated.sh` | Identify users that can be impersonate |
| 📜 `sqlDatabase/mssql/impersonate_as_user.sh` | impersonating the (sa) user |
| 📜 `sqlDatabase/mssql/metasploit_bruteforce_username_and_password_file.sh` | mssql: bruteforce username and passwords file |
| 📜 `sqlDatabase/mssql/metasploit_bruteforce_username_file_and_password_file.sh` | mssql: bruteforce username file and passwords file |
| 📜 `sqlDatabase/mssql/metasploit_bruteforce_userpass_file.sh` | msfconsole: start mssql ping |
| 📜 `sqlDatabase/mssql/mssql_enable_ole_precedure.sh` | mssql: enable Ole Automation procedure |
| 📜 `sqlDatabase/mssql/mssql_read_local_file.sh` | mssql: read local file |
| 📜 `sqlDatabase/mssql/mssql_write_file_with_ole_precedure.sh` | mssql: write shell with Ole Automation procedure |
| 📜 `sqlDatabase/mssql/mssql_write_simple_webshell.sh` | mssql: upload simple webshell |
| 📜 `sqlDatabase/mssql/nmap_enumerate_mssql_service.sh` | nmap: enumerate mysql service |
| 📜 `sqlDatabase/mssql/read_directory.sh` | script to read directories with xp_dirtree |
| 📜 `sqlDatabase/mssql/show_databases.sh` | show databases |
| 📜 `sqlDatabase/mssql/show_tables_in_database.sh` | show tables in database |
| 📜 `sqlDatabase/mssql/start_mssql_connection.sh` | start a mssql connection |
| 📜 `sqlDatabase/mssql/start_sp_execute_external_script_nc_reverse_shell.sh` | execute sp_execute_external_script nc reverse shell |
| 📜 `sqlDatabase/mssql/start_sp_execute_external_script_powershell_reverse_shell.sh` | execute sp_execute_external_script powershell reverse shell |
| 📜 `sqlDatabase/mssql/start_xp_cmdshell_nc_reverse_shell.sh` | execute xp_cmdshell nc reverse shell |
| 📜 `sqlDatabase/mssql/start_xp_cmdshell_powershell_reverse_shell.sh` | execute xp_cmdshell powershell reverse shell |
| 📜 `sqlDatabase/mssql/steal_hashes_with_xp_dirtree.sh` | steal hashes with xp_dirtree |
| 📜 `sqlDatabase/mssql/steal_hashes_with_xp_subdirs.sh` | steal hashes with xp_subdirs |
| 📜 `sqlDatabase/mssql/view_table_content_in_specific_database.sh` | view content in table in specific database |
<br />

### sqlDatabase/msyql

scripts to enumerate MySQL server

| Path | Description |
|------|-------------|
| 📜 `sqlDatabase/msyql/connect_to_mysql_server.sh` | mysql: connect to mysql |
| 📜 `sqlDatabase/msyql/mysql_read_local_file.sh` | mysql: read local file |
| 📜 `sqlDatabase/msyql/nmap_enumerate_mysql_service.sh` | nmap: enumerate mysql service |
| 📜 `sqlDatabase/msyql/select_one_existing_database.sh` | mysql: Select one of the existing databases |
| 📜 `sqlDatabase/msyql/show_all_databases.sh` | mysql: show all databases |
| 📜 `sqlDatabase/msyql/show_columns_of_table.sh` | mysql: show all columns of table |
| 📜 `sqlDatabase/msyql/show_everything_of_table.sh` | mysql: show everything in the desired table |
| 📜 `sqlDatabase/msyql/show_tables.sh` | mysql: show all available tables in the selected database |
<br />

### sqlDatabase/msyql/sqlmap

different sqlmap scripts to perform SQLi

| Path | Description |
|------|-------------|
| 📜 `sqlDatabase/msyql/sqlmap/dump-database.sh` | sqlmap: dump current database |
| 📜 `sqlDatabase/msyql/sqlmap/dump_specific_database.sh` | sqlmap: dump specific database |
| 📜 `sqlDatabase/msyql/sqlmap/forms.sh` | sqlmap: SQLi on all forms on a websith |
| 📜 `sqlDatabase/msyql/sqlmap/perform_authorization_basic_header_attack.sh` | sqlmap: perform Authorization: Basic attack |
| 📜 `sqlDatabase/msyql/sqlmap/show_databases.sh` | sqlmap: show all databases |
| 📜 `sqlDatabase/msyql/sqlmap/show_specific_database_table.sh` | sqlmap: show specific database tables |
<br />

### ssh

scripts to start port listening or forwarding

| Path | Description |
|------|-------------|
| 📜 `ssh/hydra_ssh_brute_force.sh` | hydra: ssh brute force |
| 📜 `ssh/local_port_listening.sh` | type ssh port listening |
| 📜 `ssh/local_port_listening_with_sshkey.sh` | type ssh port listening with ssh key |
| 📜 `ssh/metasploit_bruteforce_username_and_password_file.sh` | ssh: bruteforce username and passwords file |
| 📜 `ssh/metasploit_bruteforce_username_file_and_password_file.sh` | ssh: bruteforce username file and passwords file |
| 📜 `ssh/metasploit_bruteforce_userpass_file.sh` | ssh: bruteforce userpass file (user pass) |
| 📜 `ssh/remote_port_forwarding.sh` | type ssh port forwarding |
| 📜 `ssh/remote_port_forwarding_with_sshkey.sh` | type ssh port forwarding with ssh key |
| 📜 `ssh/socket_port_sock_forwarding.sh` | -D sock 5 forwarding |
<br />

### web

scripts to execute web pentests like gobuster, eyewitness, ferobuster, fuzz

| Path | Description |
|------|-------------|
| 📜 `web/get_ip_addressen_from_subdomain_list.sh` | convert subdomains list to ip addresses |
| 📜 `web/get_shohan_info_by_ip.sh` | get shohan info by ip |
| 📜 `web/get_subdomain_from_crt_sh_domain_certificates.sh` | get unique subdomains with crt.sh domain certificates |
<br />

### web/dns

get DNS records

| Path | Description |
|------|-------------|
| 📜 `web/dns/brute_force_subdomain.sh` | brute force subdomain |
| 📜 `web/dns/dnsenum_enumerate_dns_records.sh` | dnsenum: enumerate dns records |
| 📜 `web/dns/get_a_dns_records.sh` | dig A domain name |
| 📜 `web/dns/get_aaaa_dns_records.sh` | dig AAAA domain name |
| 📜 `web/dns/get_any_dns_records.sh` | dig any domain name |
| 📜 `web/dns/get_axfr_dns_records.sh` | dig axfr domain name |
| 📜 `web/dns/get_cname_dns_records.sh` | dig CNAME domain name |
| 📜 `web/dns/get_dns_server_version.sh` | dig get DNS server version |
| 📜 `web/dns/get_mx_dns_records.sh` | dig MX domain name |
| 📜 `web/dns/get_ns_dns_records.sh` | dig NS domain name |
| 📜 `web/dns/get_ptr_dns_records.sh` | dig PTR domain name |
| 📜 `web/dns/get_soa_dns_records.sh` | dig SOA domain name |
| 📜 `web/dns/get_txt_dns_records.sh` | dig TXT domain name |
<br />

### web/eyewitness

execute eyewitness with custom or nmap file

| Path | Description |
|------|-------------|
| 📜 `web/eyewitness/eyewitness_with_custom_file.sh` | execute eyewitness with custom file |
| 📜 `web/eyewitness/eyewitness_with_nmap_file.sh` | execute eyewitness with nmap file |
<br />

### web/feroxbuster

execute directory and file search with feroxbuster

| Path | Description |
|------|-------------|
| 📜 `web/feroxbuster/directory_search_dirb_common.sh` | feroxbuster directory search dirb/common.txt |
| 📜 `web/feroxbuster/directory_search_directory_list_medium.sh` | feroxbuster directory search directory-list-2.3-medium.txt |
| 📜 `web/feroxbuster/extension_search.sh` | execute feroxbuster directory search and files with extensions search |
<br />

### web/finalrecon

script to use finalrecon

| Path | Description |
|------|-------------|
| 📜 `web/finalrecon/gather_domain_info.sh` | finalrecon: gather website info |
<br />

### web/fuzz

scripts to do attacks with fuzz

| Path | Description |
|------|-------------|
| 📜 `web/fuzz/fuzz_for_files_in_var_www_html_with_php_filter_base64.sh` | fuzz for files in var www html with php filter base64 |
| 📜 `web/fuzz/fuzz_for_php_files.sh` | fuzz for PHP files |
| 📜 `web/fuzz/fuzz_for_php_param_name.sh` | fuzz for PHP param |
| 📜 `web/fuzz/fuzz_for_php_param_value.sh` | fuzz for PHP param value |
| 📜 `web/fuzz/fuzz_for_wordpress_files_in_var_www_html_with_php_filter_base64.sh` | fuzz for wordpress files in var www html with php filter base64 |
| 📜 `web/fuzz/vhost.sh` | fuzz vhosts |
<br />

### web/fuzzingInputs

fuzz inputs in an attempt to break it

| Path | Description |
|------|-------------|
| 📜 `web/fuzzingInputs/fuzz_input_fields.sh` | fuzz input fields in an attempt to break it |
| 📜 `web/fuzzingInputs/fuzz_sql_fields.sh` | fuzz sql fields in an attempt to break it |
<br />

### web/gitDumper

dump .git folder to local folder

| Path | Description |
|------|-------------|
| 📜 `web/gitDumper/dump_git_folder_to_local_folder.sh` | dump git folder to local folder |
<br />

### web/gobuster

scripts to do attacks with gobuster

| Path | Description |
|------|-------------|
| 📜 `web/gobuster/dir_with_directory_list_medium.sh` | gobuster directory with directory-list-2.3-medium.txt |
| 📜 `web/gobuster/dir_with_directory_list_medium_and_extensions.sh` | gobuster directory with directory-list-2.3-medium.txt and extensions worldlist |
| 📜 `web/gobuster/directory_with_dirb_common_wordlist.sh` | gobuster directory with wordlists/dirb/common.txt |
| 📜 `web/gobuster/directory_with_dirb_common_wordlist_and_extensions.sh` | gobuster directory search with dirb/common.txt and extensions wordlist |
| 📜 `web/gobuster/raft_large_file_search.sh` | gobuster file search with /usr/share/seclists/Discovery/Web-Content/raft-large-files.txtt |
| 📜 `web/gobuster/vhost.sh` | gobuster vhosts with subdomains-top1million-110000.txt |
<br />

### web/googleDorking

scripts to do google dorking

| Path | Description |
|------|-------------|
| 📜 `web/googleDorking/search_for_aws.sh` | Google Search for AWS |
| 📜 `web/googleDorking/search_for_azure.sh` | Google Search for AZURE |
<br />

### web/lfi

scripts to perform LFI attacks

| Path | Description |
|------|-------------|
| 📜 `web/lfi/check_if_expect_attack_is_possible.sh` | Check if we can execute expect to execute commands |
| 📜 `web/lfi/execute_a_cmd_with_php_input_filter.sh` | Try to execute a cmd with php://input |
| 📜 `web/lfi/fuzz_for_lfi_files_pathtotest_huge.sh` | fuzz for LFI files with LFI-Jhaddix.txt |
| 📜 `web/lfi/fuzz_for_lfi_files_with_jhaddix.sh` | fuzz for LFI files with LFI-LFISuite-pathtotest-huge.txt |
| 📜 `web/lfi/fuzz_for_root_directory.sh` | fuzz for LFI root directory with custom wordlist |
| 📜 `web/lfi/fuzz_web_root_directories_linux.sh` | fuzz for web root directories - linux |
| 📜 `web/lfi/fuzz_web_root_directories_windows.sh` | fuzz for web root directories - windows |
| 📜 `web/lfi/lfi_read_files_with_php_filter_base64_encode.sh` | LFI read files with php filter base64 encode |
| 📜 `web/lfi/remote_rfi_with_ftp.sh` | Remote RFI with FTP |
| 📜 `web/lfi/remote_rfi_with_http.sh` | Remote RFI with HTTP |
| 📜 `web/lfi/remote_rfi_with_smb.sh` | Remote RFI with SMB |
<br />

### web/nikto

script to use nikto

| Path | Description |
|------|-------------|
| 📜 `web/nikto/identify_software.sh` | nikto: identify software |
<br />

### web/wafw00f

script to use wafw00f

| Path | Description |
|------|-------------|
| 📜 `web/wafw00f/check_if_website_is_behind_waf.sh` | wafw00f: check if website is behind waf |
<br />

### web/wordpress

script to do wordpress attacks

| Path | Description |
|------|-------------|
| 📜 `web/wordpress/wpscan_bruteforce_user_file_with_password_file.sh` | wpscan bruteforce user file with password file |
| 📜 `web/wordpress/wpscan_bruteforce_user_with_password_file.sh` | wpscan bruteforce user with password file |
| 📜 `web/wordpress/wpscan_check_for_vulnerable_plugins.sh` | wpscan check for vulnerable plugins |
| 📜 `web/wordpress/wpscan_enumerate_users.sh` | wpscan enumerate users |
<br />

### web/xss

scripts to perform xss

| Path | Description |
|------|-------------|
| 📜 `web/xss/simpel_xss_check_img_on_error.sh` | simpel xss check with a img onerror |
<br />
