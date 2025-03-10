
### auditTools


| Path | Description |
|------|-------------|
| 📂 `auditTools/domainPasswordAuditTool_dpat` |  |
| 📜 `auditTools/domainPasswordAuditTool_dpat/audit_ad_passwords_hashcat_profile.sh` | Domain Password Audit Tool (DPAT) |

### crackPasswords
Crack passwords with hashcat

| Path | Description |
|------|-------------|
| 📂 `crackPasswords/hashcat` |  |
| 📜 `crackPasswords/hashcat/crack_kerberos5_etype-23_tgs_rep_hash.sh` | Crack Kerberos 5, etype 23, TGS-REP hashes with hashcat using rockyou.txt. |
| 📜 `crackPasswords/hashcat/crack_net_ntlm_hashes.sh` | Crack NTLM hashes with hashcat using rockyou.txt. |
| 📜 `crackPasswords/hashcat/crack_net_ntlmv2_hashes.sh` | Crack NetNTLMv2 hashes with hashcat using rockyou.txt. |
| 📜 `crackPasswords/hashcat/crack_spn_passwords.sh` | Crack SPN passwords with hashcat using rockyou.txt. |
| 📜 `crackPasswords/hashcat/crack_spn_passwords_with_best64_rule.sh` | Crack SPN passwords with hashcat using rockyou.txt and best64.rule. |
| 📜 `crackPasswords/hashcat/crack_spn_passwords_with_OneRuleToRuleThemAll_rule.sh` | Crack SPN passwords with hashcat using rockyou.txt and OneRuleToRuleThemAll.rule. |
| 📜 `crackPasswords/hashcat/create_rockyou_best64_rule_custom_wordlist.sh` | Create sorted, unique wordlist from rockyou.txt + best64.rule. |
| 📜 `crackPasswords/hashcat/create_rockyou_OneRuleToRuleThemAll_rule_custom_wordlist.sh` | Create sorted, unique wordlist: rockyou.txt + OneRuleToRuleThemAll.rule. |
| 📜 `crackPasswords/hashcat/format_ntlm_username_rid_lm_ntlm_hashes_to_hashcat.sh` | Format username:RID:LM:NTLM::: to hashcat format |

### customWordlist
create custom wordlists

| Path | Description |
|------|-------------|
| 📜 `customWordlist/cewl_create_custom_wordlist.sh` | cewl - create custom ordlist |

### decompile
decompile files

| Path | Description |
|------|-------------|
| 📂 `decompile/java` | decompile java class files |
| 📜 `decompile/java/decompile_java_class_file.sh` | Decompile java class file |

### fileTransfer
transfer file to or from a server

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/scp_download_file_from_server.sh` | SCP download file from server |
| 📜 `fileTransfer/scp_upload_server_to_file.sh` | SCP upload file to server |

### ftp
scripts for ftp enumeration

| Path | Description |
|------|-------------|
| 📜 `ftp/anonymous_login.sh` | FTP: check for anonymous login |

### nmapScans
Collection of scripts for network scanning.

| Path | Description |
|------|-------------|
| 📜 `nmapScans/nmap_aggressive.sh` | Nmap: Aggressive scan all ports, save output. |
| 📜 `nmapScans/nmap_check_online_hosts.sh` | Nmap: ping sweep |
| 📜 `nmapScans/nmap_open_relay.sh` | Nmap: Check for open SMTP relay. |
| 📜 `nmapScans/nmap_quick.sh` | Nmap: Scan hosts from scope.txt, save output to nmap_1k. |
| 📂 `nmapScans/proxychains` |  |
| 📜 `nmapScans/proxychains/nmap_aggressive.sh` | Nmap: Aggressive scan all ports, save output. |
| 📜 `nmapScans/proxychains/nmap_check_online_hosts.sh` | Nmap: ping sweep |
| 📜 `nmapScans/proxychains/nmap_open_relay.sh` | Nmap: Check for open SMTP relay. |
| 📜 `nmapScans/proxychains/nmap_quick.sh` | Nmap: Scan hosts from scope.txt, save output to nmap_1k. |

### portListening
different scripts to do port listenings

| Path | Description |
|------|-------------|
| 📜 `portListening/curl_ligolo_agent.sh` |  |
| 📜 `portListening/ligolo_client_connect.sh` |  |
| 📜 `portListening/socat_listener.sh` |  |
| 📜 `portListening/socat.sh` |  |
| 📜 `portListening/ssh_forward_rdp_port.sh` | ssh: forward RDP port |
| 📜 `portListening/start_ligolo_proxy.sh` |  |

### python
different python scripts like to start http server

| Path | Description |
|------|-------------|
| 📂 `python/http_server` | start a python http server |
| 📜 `python/http_server/http_server_always_return_200.sh` | start http server and always return 200 |
| 📜 `python/http_server/http_server.sh` | start http server |

### reconnaissance


| Path | Description |
|------|-------------|
| 📂 `reconnaissance/linux` |  |
| 📜 `reconnaissance/linux/check_crontab.sh` |  |
| 📜 `reconnaissance/linux/check_database_files.sh` |  |
| 📜 `reconnaissance/linux/check_exports.sh` |  |
| 📜 `reconnaissance/linux/check_for_config_files.sh` |  |
| 📜 `reconnaissance/linux/check_for_passwords_in_config_files.sh` |  |
| 📜 `reconnaissance/linux/check_for_ps_changes.sh` |  |
| 📜 `reconnaissance/linux/check_for_suid_files.sh` | check for SUID, check gtfobins for something usefull |
| 📜 `reconnaissance/linux/check_for_txt_files_in_home_directory.sh` |  |
| 📜 `reconnaissance/linux/check_open_ports.sh` |  |
| 📜 `reconnaissance/linux/check_user_permissions.sh` | Check user permissions and other usefull pentest info |
| 📜 `reconnaissance/linux/check_users_bash_history.sh` |  |
| 📜 `reconnaissance/linux/lin_peas_one_liner.sh` |  |
| 📜 `reconnaissance/linux/local_port_scan_on_ip.sh` | local port scan on ip |
| 📜 `reconnaissance/linux/mount_nfs_file_system.sh` |  |
| 📜 `reconnaissance/linux/ping_sweep_linux.sh` |  |
| 📜 `reconnaissance/linux/proxychains_show_mounts.sh` |  |
| 📜 `reconnaissance/linux/show_mounts.sh` |  |
| 📜 `reconnaissance/linux/tcpdump.sh` |  |
| 📜 `reconnaissance/linux/unmount_nfs_file_system.sh` |  |
| 📂 `reconnaissance/windows` |  |
| 📂 `reconnaissance/windows/cmd` |  |
| 📜 `reconnaissance/windows/cmd/check_user_permissions.sh` | Check user permissions and other usefull pentest info |
| 📜 `reconnaissance/windows/cmd/ping_sweep_cmd.sh` |  |
| 📂 `reconnaissance/windows/powershell` |  |
| 📜 `reconnaissance/windows/powershell/check_user_permissions.sh` | Check user permissions and other usefull pentest info |
| 📜 `reconnaissance/windows/powershell/ping_sweep_powershell.sh` |  |

### shell
scripts like automatically fix shell and make it interactive, start port listening, create rev shells

| Path | Description |
|------|-------------|
| 📂 `shell/background` |  |
| 📜 `shell/background/compile_hollow.sh` |  |
| 📜 `shell/fix_shell.sh` | Fix shell to fully interactive shell |
| 📂 `shell/msfconsole` | msfconsole scripts with start sock proxy, port forwarding, server routes |
| 📂 `shell/msfconsole/linux` | meterpreter: start reverse tcp rev shell |
| 📜 `shell/msfconsole/linux/listen_to_meterpreter_rev_shell.sh` | meterpreter: start reverse tcp rev shell |
| 📜 `shell/msfconsole/meterpreter_port_forwarding.sh` | meterpreter: forward all trafic from remote port 8443 to local port 1234 |
| 📜 `shell/msfconsole/meterpreter_set_server_routes.sh` | meterpreter: set server routes |
| 📂 `shell/msfconsole/proxychains` |  |
| 📜 `shell/msfconsole/proxychains/start_msfconsole.sh` | start msfconsole |
| 📜 `shell/msfconsole/start_msfconsole.sh` | start msfconsole |
| 📜 `shell/msfconsole/start_sock_proxy.sh` | Start socks proxy |
| 📂 `shell/msfconsole/windows` | meterpreter: start reverse tcp rev shell |
| 📜 `shell/msfconsole/windows/listen_to_meterpreter_rev_shell.sh` | meterpreter: start reverse tcp rev shell |
| 📂 `shell/msfvenom` | msfvenom to create reverve shell files for metepreter |
| 📜 `shell/msfvenom/create_asp _rev_shell.sh` | Create ASP file |
| 📜 `shell/msfvenom/create_bash _rev_shell.sh` | Create Bash file |
| 📜 `shell/msfvenom/create_elf_rev_shell.sh` | Create ELF file |
| 📜 `shell/msfvenom/create_exe_rev_shell.sh` | Create EXE file |
| 📜 `shell/msfvenom/create_jsp _rev_shell.sh` | Create JSP file |
| 📜 `shell/msfvenom/create_perl _rev_shell.sh` | Create Perl file |
| 📜 `shell/msfvenom/create_php _rev_shell.sh` | Create PHP file |
| 📜 `shell/msfvenom/create_python _rev_shell.sh` | Create Python file |
| 📜 `shell/msfvenom/create_war _rev_shell.sh` | Create WAR file |
| 📜 `shell/netcat.sh` | start nc port listening |
| 📜 `shell/python3_pty_spawn.sh` | python3 - pyt.spawn |
| 📜 `shell/python_pty_spawn.sh` | python - pyt.spawn |
| 📜 `shell/rlwrap_netcat.sh` | start rlwrap nc port listening |
| 📂 `shell/windows` | scripts to create windows shells |
| 📜 `shell/windows/nc_cmd.sh` |  |
| 📜 `shell/windows/nc_powershell.sh` |  |
| 📜 `shell/windows/powershell_base64.sh` |  |

### sqli


| Path | Description |
|------|-------------|
| 📂 `sqli/mssql` | script to enable xp_cmdshell and read directories |
| 📜 `sqli/mssql/enable_xp_cmdshell.sh` | script to enable xp_cmdshell |
| 📜 `sqli/mssql/read_directory.sh` | script to read directories with xp_dirtree |
| 📂 `sqli/sql` | different sqlmap scripts to perform SQLi |
| 📜 `sqli/sql/sqlmap-forms.sh` | SQLi on all forms on a websith with sqlmap |

### ssh
scripts to start port listening or forwarding

| Path | Description |
|------|-------------|
| 📜 `ssh/local_port_listening.sh` | type ssh port listening |
| 📜 `ssh/local_port_listening_with_sshkey.sh` | type ssh port listening with ssh key |
| 📜 `ssh/remote_port_forwarding.sh` | type ssh port forwarding |
| 📜 `ssh/remote_port_forwarding_with_sshkey.sh` | type ssh port forwarding with ssh key |
| 📜 `ssh/socket_port_sock_forwarding.sh` | -D sock 5 forwarding |

### web
scripts to execute web pentests like gobuster, eyewitness, ferobuster, fuzz

| Path | Description |
|------|-------------|
| 📂 `web/eyewitness` | execute eyewitness with custom or nmap file |
| 📜 `web/eyewitness/eyewitness_with_custom_file.sh` | execute eyewitness with custom file |
| 📜 `web/eyewitness/eyewitness_with_nmap_file.sh` | execute eyewitness with nmap file |
| 📂 `web/feroxbuster` | execute directory and file search with feroxbuster |
| 📜 `web/feroxbuster/feroxbuster.sh` | execute feroxbuster directory search |
| 📜 `web/feroxbuster/feroxbuster_with_extension_search.sh` | execute feroxbuster directory search and files with extensions search |
| 📂 `web/fuzz` | scripts to do attacks with fuzz |
| 📜 `web/fuzz/vhost.sh` | fuzz vhosts with seclists/Discovery/DNS/namelist.txt |
| 📂 `web/gobuster` | scripts to do attacks with gobuster |
| 📜 `web/gobuster/dir.sh` | gobuster directory with seclists/Discovery/DNS/subdomains-top1million-110000.txt |
| 📜 `web/gobuster/dir_with_extensions.sh` | gobuster directory search with extensions and seclists/Discovery/DNS/subdomains-top1million-110000.txt |
| 📜 `web/gobuster/vhost.sh` | gobuster vhosts with seclists/Discovery/DNS/subdomains-top1million-110000.txt |
| 📂 `web/wordpress` | script to do wordpress attacks |
| 📜 `web/wordpress/wpscan_bruteforce_user_file_with_password_file.sh` | wpscan bruteforce user file with password file |
| 📜 `web/wordpress/wpscan_bruteforce_user_with_password_file.sh` | wpscan bruteforce user with password file |
| 📜 `web/wordpress/wpscan_check_for_vulnerable_plugins.sh` | wpscan check for vulnerable plugins |
| 📜 `web/wordpress/wpscan_enumerate_users.sh` | wpscan enumerate users |

### windows
Windows scripts: user/group mgmt, cred dumping, recon, execution.

| Path | Description |
|------|-------------|
| 📂 `windows/bloodhound` | Scripts for starting BloodHound and Neo4j. |
| 📂 `windows/bloodhound/genericAll` |  |
| 📜 `windows/bloodhound/genericAll/genericAll_exploit_part1.sh` | powershell: genericAll permissions exploit |
| 📂 `windows/bloodhound/genericWrite` |  |
| 📜 `windows/bloodhound/genericWrite/genericWrite_exploit_part1.sh` | powershell: genericWrite permissions exploit |
| 📜 `windows/bloodhound/genericWrite/genericWrite_exploit_part2.sh` | powershell: genericWrite permissions exploit |
| 📂 `windows/bloodhound/genericWrite/proxychains` |  |
| 📜 `windows/bloodhound/genericWrite/proxychains/genericWrite_exploit_part2.sh` | powershell: genericWrite permissions exploit |
| 📜 `windows/bloodhound/start_bloodhound.sh` | Start Neo4j service and launch BloodHound GUI. |
| 📂 `windows/cmd` |  |
| 📜 `windows/cmd/add_user.sh` | Net: Add user hckr, add to administrators and RDP groups. |
| 📜 `windows/cmd/add_user_to_domain.sh` | Net: Add user john, add to Exchange and Remote Mgmt groups. |
| 📜 `windows/cmd/check_connected_drives.sh` | Net: Show connected network drives. |
| 📜 `windows/cmd/check_local_administrators.sh` | Net: Check local administrators |
| 📜 `windows/cmd/check_user_account.sh` | Net: Get user information. |
| 📜 `windows/cmd/connect_to_added_user_domain.sh` | PowerShell: Grant DCSync rights to user john. |
| 📜 `windows/cmd/copy_powerview_from_shared_drive.sh` | Copy PowerView.ps1 from shared drive |
| 📜 `windows/cmd/net_user_domain_details.sh` | Net: Get domain user information for hporter. |
| 📜 `windows/cmd/proof_admin.sh` | Read contents of C:\Users\Administrator\Desktop\proof.txt. |
| 📜 `windows/cmd/root_admin.sh` | Read contents of C:\Users\Administrator\Desktopoot.txt. |
| 📜 `windows/cmd/secretsdump_added_domain_user.sh` | Impacket: Remote secretsdump as htb\john on 10.129.80.76. |
| 📂 `windows/enum4linux` | Scripts for enum4linux. |
| 📜 `windows/enum4linux/enum4linux_smb_null_session.sh` | Enumerate users and passwords via enum4linux. |
| 📂 `windows/enum4linux/proxychains` |  |
| 📜 `windows/enum4linux/proxychains/enum4linux_smb_null_session.sh` |  |
| 📂 `windows/evilWinRm` | Scripts for establishing Evil-WinRM connections. |
| 📜 `windows/evilWinRm/connect_to_user_hash.sh` | Connect with Evil-WinRM as Administrator using NTLM hash. |
| 📜 `windows/evilWinRm/connect_to_user_password.sh` | Connect with Evil-WinRM as Administrator using password. |
| 📂 `windows/evilWinRm/proxychains` |  |
| 📜 `windows/evilWinRm/proxychains/connect_to_user_hash.sh` |  |
| 📜 `windows/evilWinRm/proxychains/connect_to_user_password.sh` |  |
| 📜 `windows/get_usernames_ntlm_hashes_from_ntlm_username_rid_lm_ntlm_hashes.sh` | save username and ntlm hashes in seperated files from form username:RID:LM:NTLM::: |
| 📂 `windows/inveigh` |  |
| 📜 `windows/inveigh/import_inveight.sh` | Import Inveigh.ps1 |
| 📜 `windows/inveigh/start_inveight.sh` | Start Inveigh and perform a poofing attacks and captures hash/credential |
| 📜 `windows/inveigh/stop_inveight.sh` | Stop Inveigh |
| 📂 `windows/kerberoasting` | Scripts for Kerberoasting (SPN retrieval). |
| 📜 `windows/kerberoasting/export_spn_users.sh` | PowerShell: Get SPNs, format for Hashcat, export to spns.csv. |
| 📜 `windows/kerberoasting/get_samaccountname.sh` | PowerShell: Get SPN user account names. |
| 📂 `windows/lazagne` |  |
| 📜 `windows/lazagne/lazagne_dump_browser_credentials.sh` | Dump browser stored credentials |
| 📜 `windows/lazagne/lazagne_dump_credentials.sh` | Dump windows stored credentials |
| 📂 `windows/mimikatz` | Scripts for Active Directory enumeration and credential dumping. |
| 📜 `windows/mimikatz/dump_lsa_secrets.sh` | Mimikatz: Dump lsa secrets. |
| 📜 `windows/mimikatz/dump_lsass_credentials.sh` | Mimikatz: Dump LSASS credentials (remove protection, debug, logonpasswords). |
| 📜 `windows/mimikatz/dump_lsass_credentials_with_processprotect.sh` | Mimikatz: Dump LSASS credentials (remove protection, debug, logonpasswords). |
| 📜 `windows/mimikatz/kerberos_double_hop_fix.sh` | Fix Kerberos "Double Hop" problem when using WinRM/Powershell |
| 📂 `windows/netexec` |  |
| 📂 `windows/netexec/proxychains` |  |
| 📂 `windows/netexec/proxychains/smb` |  |
| 📜 `windows/netexec/proxychains/smb/administrator_hash.sh` |  |
| 📜 `windows/netexec/proxychains/smb/check_ad_users_and_passwords.sh` |  |
| 📜 `windows/netexec/proxychains/smb/check_anonymous.sh` |  |
| 📜 `windows/netexec/proxychains/smb/dump_credentials_from_lsa.sh` |  |
| 📜 `windows/netexec/proxychains/smb/dump_credentials_from_sam.sh` |  |
| 📜 `windows/netexec/proxychains/smb/dump_ntds.sh` |  |
| 📜 `windows/netexec/proxychains/smb/enumerate_group.sh` |  |
| 📜 `windows/netexec/proxychains/smb/enumerate_local_users.sh` |  |
| 📜 `windows/netexec/proxychains/smb/enumerate_users_execute_cmd.sh` |  |
| 📜 `windows/netexec/proxychains/smb/enumerate_users_execute_smbexec.sh` |  |
| 📜 `windows/netexec/proxychains/smb/enumerate_users.sh` |  |
| 📜 `windows/netexec/proxychains/smb/find_autologon_in_registry_xml.sh` |  |
| 📜 `windows/netexec/proxychains/smb/null_session.sh` |  |
| 📜 `windows/netexec/proxychains/smb/password_policy.sh` |  |
| 📜 `windows/netexec/proxychains/smb/rid_brute.sh` |  |
| 📜 `windows/netexec/proxychains/smb/smb_start_listener.sh` |  |
| 📜 `windows/netexec/proxychains/smb/smb_user.sh` |  |
| 📜 `windows/netexec/proxychains/smb/spider_plus_share.sh` |  |
| 📜 `windows/netexec/proxychains/smb/user_show_shares.sh` |  |
| 📂 `windows/netexec/proxychains/winrm` |  |
| 📜 `windows/netexec/proxychains/winrm/check_ad_users_and_passwords.sh` |  |
| 📂 `windows/netexec/rdp` | NetExec scripts for RDP connections. |
| 📜 `windows/netexec/rdp/check_ad_users_and_passwords.sh` | nxc rdp: Check RDP with user/pass. |
| 📜 `windows/netexec/rdp/check_ad_users_and_passwords_with_files.sh` | nxc rdp: Check RDP with user/pass lists, continue on success. |
| 📂 `windows/netexec/rdp/proxychains` |  |
| 📜 `windows/netexec/rdp/proxychains/check_ad_users_and_passwords.sh` |  |
| 📜 `windows/netexec/rdp/proxychains/check_ad_users_and_passwords_with_files.sh` |  |
| 📂 `windows/netexec/smb` |  |
| 📜 `windows/netexec/smb/administrator_hash.sh` |  |
| 📜 `windows/netexec/smb/check_anonymous.sh` |  |
| 📜 `windows/netexec/smb/dump_credentials_from_lsa.sh` |  |
| 📜 `windows/netexec/smb/dump_credentials_from_sam.sh` |  |
| 📜 `windows/netexec/smb/dump_ntds.sh` |  |
| 📜 `windows/netexec/smb/enumerate_ad_users_and_passwords.sh` | enumerate over ad users and password file |
| 📜 `windows/netexec/smb/enumerate_group.sh` |  |
| 📜 `windows/netexec/smb/enumerate_users_execute_cmd.sh` |  |
| 📜 `windows/netexec/smb/enumerate_users_execute_smbexec.sh` |  |
| 📜 `windows/netexec/smb/find_autologon_in_registry_xml.sh` | searches the domain controller for registry.xml |
| 📜 `windows/netexec/smb/login_with_username_password.sh` | login with username and password |
| 📜 `windows/netexec/smb/null_session.sh` | check if null session is possible |
| 📜 `windows/netexec/smb/password_policy.sh` | get password policy |
| 📂 `windows/netexec/smb/proxychains` |  |
| 📜 `windows/netexec/smb/rid_brute.sh` | enumerate users by bruteforcing RIDs |
| 📜 `windows/netexec/smb/show_shares.sh` | show smb shares |
| 📜 `windows/netexec/smb/smb_enumerate_local_users.sh` |  |
| 📜 `windows/netexec/smb/smb_enumerate_users.sh` |  |
| 📜 `windows/netexec/smb/smb_start_listener.sh` |  |
| 📜 `windows/netexec/smb/spider_plus_share.sh` | netexec smb use spider_plus to get all share files |
| 📂 `windows/netexec/winrm` | NetExec scripts for WinRM connections. |
| 📜 `windows/netexec/winrm/check_ad_users_and_passwords.sh` | nxc winrm: Check WinRM on 172.16.8.50 with user/pass lists. |
| 📂 `windows/netexec/winrm/proxychains` |  |
| 📜 `windows/netexec/winrm/proxychains/check_ad_users_and_passwords.sh` |  |
| 📂 `windows/passwordSpraying` | Scripts for performing password spraying attacks. |
| 📜 `windows/passwordSpraying/domain_password_spray.sh` | PowerShell: Password spray using DomainPasswordSpray.ps1 (Welcome1). |
| 📂 `windows/permissions` | Scripts related to privilege escalation and permission manipulation. |
| 📜 `windows/permissions/audit_user_token_privileges.sh` | SharpUp - audit token privileges. |
| 📜 `windows/permissions/forceChangePassword.sh` | PowerShell: Force change password for user. |
| 📜 `windows/permissions/seBackupPrivilege-part1.sh` | Registry: Save SYSTEM, SECURITY, and SAM hives. |
| 📜 `windows/permissions/seBackupPrivilege-part2_without_security.sh` | Registry: Save SYSTEM, SECURITY, and SAM hives. |
| 📜 `windows/permissions/seBackupPrivilege-part2_with_security.sh` | Impacket: Local secretsdump using SYSTEM, SAM, and SECURITY hives. |
| 📜 `windows/permissions/SeImpersonate.sh` | PrintSpoofer: Reverse shell to KALI_IP:443 using SeImpersonatePrivilege. |
| 📂 `windows/powershell` |  |
| 📜 `windows/powershell/check_default_username.sh` | Powershell: Check default username |
| 📜 `windows/powershell/create_new_powershell_session_to_computer.sh` | Powershell - login to user on a different computer |
| 📜 `windows/powershell/disable_defender.sh` | Disable Windows Defender and Firewall. |
| 📜 `windows/powershell/download_and_execute_custom_script_in_memory.sh` | PowerShell: Download and execute script in memory. |
| 📜 `windows/powershell/elevate_user.sh` | Powershell - elevate user |
| 📜 `windows/powershell/find_passwords_in_account_description.sh` | PowerShell: Get users with non-null descriptions. |
| 📜 `windows/powershell/import_module_powerview_ps1.sh` | PowerShell: Import PowerView module. |
| 📜 `windows/powershell/save_custom_script_to_remote_server.sh` | PowerShell: Save file and save in current remote folder. |
| 📜 `windows/psexect_to_administrator.sh` | Impacket: psexec.py get NTLM hashes with user. |
| 📜 `windows/read_sam_database.sh` | Impacket: Local secretsdump using SYSTEM, SAM, and SECURITY hives. |
| 📜 `windows/save_sam_database.sh` | Registry: Save SYSTEM, SECURITY, and SAM hives. |
| 📂 `windows/smbclient` | Scripts using smbclient for share enumeration and access. |
| 📜 `windows/smbclient/administrator_hash_execute_cmd.sh` | smbclient: Connect to share. |
| 📜 `windows/smbclient/connect_to_share.sh` | smbclient: Connect to share. |
| 📂 `windows/smbclient/proxychains` |  |
| 📜 `windows/smbclient/proxychains/administrator_hash_execute_cmd.sh` |  |
| 📜 `windows/smbclient/proxychains/connect_to_share.sh` |  |
| 📜 `windows/smbclient/proxychains/show_shares.sh` |  |
| 📜 `windows/smbclient/show_shares.sh` | smbclient: List shares. |
| 📂 `windows/smbmap` | Scripts using smbmap for SMB share enumeration and command execution. |
| 📜 `windows/smbmap/administrator_hash_execute_cmd_with_ntlm_hash.sh` | smbmap: Execute 'whoami' on smb as Administrator with NTLM hash. |
| 📜 `windows/smbmap/administrator_hash_execute_cmd_with_password.sh` | smbmap: Execute 'whoami' on smb as Administrator with password. |
| 📂 `windows/smbmap/proxychains` |  |
| 📜 `windows/smbmap/proxychains/administrator_hash_execute_cmd_with_ntlm_hash.sh` |  |
| 📜 `windows/smbmap/proxychains/administrator_hash_execute_cmd_with_password.sh` |  |
| 📜 `windows/snaffler.sh` | Run Snaffler on inlanefreight.local domain. |
| 📂 `windows/xfreerdp` |  |
| 📂 `windows/xfreerdp/proxychains` |  |
| 📜 `windows/xfreerdp/proxychains/xfreerdp.sh` | xfreerdp: Connect with specified credentials. |
| 📜 `windows/xfreerdp/proxychains/xfreerdp_with_attached_drive.sh` | xfreerdp: Connect, map drive 'tools' to current directory (check `net use` for the location). |
| 📜 `windows/xfreerdp/xfreerdp.sh` | xfreerdp: Connect with specified credentials. |
| 📜 `windows/xfreerdp/xfreerdp_with_attached_drive.sh` | xfreerdp: Connect, map drive 'tools' to current directory (check `net use` for the location). |

