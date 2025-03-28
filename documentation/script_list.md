# 📜 Script Documentation

## 📌 Table of Contents

- [Main Scripts](#main-scripts)
- [auditTools](#-audittools)
- [crackPasswords](#-crackpasswords)
- [customWordlist](#-customwordlist)
- [decompile](#-decompile)
- [dynamicFields](#-dynamicfields)
- [fileTransfer](#-filetransfer)
- [ftp](#-ftp)
- [nmapScans](#-nmapscans)
- [portListening](#-portlistening)
- [python](#-python)
- [reconnaissance](#-reconnaissance)
- [shell](#-shell)
- [smtp](#-smtp)
- [sqlDatabase](#-sqldatabase)
- [ssh](#-ssh)
- [web](#-web)

---

### Main Scripts

| Path | Description |
|------|-------------|
| 📜 `add_ip_domain_to_etc_hosts.sh` | add ip and domains to /etc/hosts |
| 📜 `documentation_folders.sh` | create the HTB documentation folder structure |
| 📜 `kali_ip.sh` | get Kali IP address |
| 📜 `save_ssh_key_to_authorized_keys.sh` | save SSH key to authorized_keys |
| 📜 `ssh_key.sh` | get SSH key |


### 📂 auditTools/

scripts to perform pentest audits


***📂 auditTools/domainPasswordAuditTool_dpat***

script to use Domain Password Audit Tool (DPAT)

| Path | Description |
|------|-------------|
| 📜 `auditTools/domainPasswordAuditTool_dpat/audit_ad_passwords_hashcat_profile.sh` | Domain Password Audit Tool (DPAT) |


<br />

### 📂 crackPasswords/

Crack passwords with hashcat


***📂 crackPasswords/hashcat***

crack passwords with hashcat

| Path | Description |
|------|-------------|
| 📜 `crackPasswords/hashcat/crack_kerberos5_etype-23_as_rep_hash.sh` | Crack Kerberos 5, etype 23, AS-REP hashes with hashcat. |
| 📜 `crackPasswords/hashcat/crack_kerberos5_etype-23_tgs_rep_hash.sh` | Crack Kerberos 5, etype 23, TGS-REP hashes with hashcat. |
| 📜 `crackPasswords/hashcat/crack_net_ntlm_hashes.sh` | Crack NTLM hashes with hashcat. |
| 📜 `crackPasswords/hashcat/crack_net_ntlmv2_hashes.sh` | Crack NetNTLMv2 hashes with hashcat. |
| 📜 `crackPasswords/hashcat/crack_spn_passwords.sh` | Crack SPN passwords with hashcat using rockyou.txt. |
| 📜 `crackPasswords/hashcat/crack_spn_passwords_with_best64_rule.sh` | Crack SPN passwords with hashcat and best64.rule. |
| 📜 `crackPasswords/hashcat/crack_spn_passwords_with_OneRuleToRuleThemAll_rule.sh` | Crack SPN passwords with hashcat and OneRuleToRuleThemAll.rule. |
| 📜 `crackPasswords/hashcat/create_rockyou_best64_rule_custom_wordlist.sh` | Create sorted, unique wordlist from given wordlist + best64.rule. |
| 📜 `crackPasswords/hashcat/create_rockyou_OneRuleToRuleThemAll_rule_custom_wordlist.sh` | Create sorted, unique wordlist: given wordlist + OneRuleToRuleThemAll.rule. |
| 📜 `crackPasswords/hashcat/format_ntlm_username_rid_lm_ntlm_hashes_to_hashcat.sh` | Format username:RID:LM:NTLM::: to hashcat format |


***📂 crackPasswords/john***

crack passwords with john the ripper

| Path | Description |
|------|-------------|
| 📜 `crackPasswords/john/crack_kerberost_5_as_rep_hashes.sh` | crack krb 5 as rep |
| 📜 `crackPasswords/john/crack_ntlm_hashes.sh` | crack ntlm hashes |
| 📜 `crackPasswords/john/unshadow_passwords.sh` | unshadow /etc/passwords |


<br />

### 📂 customWordlist/

create custom wordlists

| Path | Description |
|------|-------------|
| 📜 `customWordlist/cewl_create_custom_wordlist.sh` | cewl - create custom wordlist |

<br />

### 📂 decompile/

decompile files


***📂 decompile/java***

decompile java class files

| Path | Description |
|------|-------------|
| 📜 `decompile/java/decompile_java_class_file.sh` | Decompile java class file |


<br />

### 📂 dynamicFields/

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
| 📜 `dynamicFields/remove_dynamic_fields.sh` | show a list of dynamic fields so you can remove them |
| 📜 `dynamicFields/set_active_dynamic_fields.sh` | show a list of dynamic fields and select one to use as default values |
| 📜 `dynamicFields/unset_active_dynamic_fields.sh` | remove active dynamic fields |

<br />

### 📂 fileTransfer/

transfer file to or from a server for linux and windows


***📂 fileTransfer/linux***

transfer file to or from a server for linux

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/linux/scp_download_file_from_server.sh` | SCP download file from server |
| 📜 `fileTransfer/linux/scp_upload_server_to_file.sh` | SCP upload file to server |


***📂 fileTransfer/windows***

transfer file to or from a server for windows

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/windows/start_python_server_to_binary_folder.sh` | start python server to binary folder |

***📂 fileTransfer/windows/powershell***

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/windows/powershell/upload_attacker_file_to_nc_as_base64.sh` | ps: upload attacker file to nc as base64 |
| 📜 `fileTransfer/windows/powershell/upload_lazagne_file.sh` | ps: upload LaZagne file to server |
| 📜 `fileTransfer/windows/powershell/upload_nc64_file.sh` | ps: upload nc64 file to server |
| 📜 `fileTransfer/windows/powershell/upload_nc_file.sh` | ps: upload nc file to server |
| 📜 `fileTransfer/windows/powershell/upload_print_spoofer_file.sh` | ps: upload PrintSpoofer file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_any_file.sh` | ps: upload winPEASany.exe file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_any_ofs_file.sh` | ps: upload winPEASany_ofs.exe file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_bat_file.sh` | ps: upload winPEAS.bat file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_x64_file.sh` | ps: upload winPEASx64.exe file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_x64_ofs_file.sh` | ps: upload winPEASx64_ofs.exe file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_x86_file.sh` | ps: upload winPEASx86.exe file to server |
| 📜 `fileTransfer/windows/powershell/upload_winpeas_x86_ofs_file.sh` | ps: upload winPEASx86_ofs.exe file to server |


***📂 fileTransfer/windows/cmd***

| Path | Description |
|------|-------------|
| 📜 `fileTransfer/windows/cmd/upload_lazagne_file.sh` | cmd: upload LaZagne file to server |
| 📜 `fileTransfer/windows/cmd/upload_nc64_file.sh` | cmd: upload nc64 file to server |
| 📜 `fileTransfer/windows/cmd/upload_nc_file.sh` | cmd: upload nc file to server |
| 📜 `fileTransfer/windows/cmd/upload_print_spoofer_file.sh` | cmd: upload PrintSpoofer file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_any_file.sh` | cmd: upload winPEASany.exe file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_any_ofs_file.sh` | cmd: upload winPEASany_ofs.exe file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_bat_file.sh` | cmd: upload winPEAS.bat file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_x64_file.sh` | cmd: upload winPEASx64.exe file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_x64_ofs_file.sh` | cmd: upload winPEASx64_ofs.exe file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_x86_file.sh` | cmd: upload winPEASx86.exe file to server |
| 📜 `fileTransfer/windows/cmd/upload_winpeas_x86_ofs_file.sh` | cmd: upload winPEASx86_ofs.exe file to server |



<br />

### 📂 ftp/

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

### 📂 nmapScans/

Collection of scripts for network scanning.

| Path | Description |
|------|-------------|
| 📜 `nmapScans/nmap_aggressive.sh` | Nmap: Aggressive scan all ports, save output. |
| 📜 `nmapScans/nmap_check_online_hosts.sh` | Nmap: ping sweep |
| 📜 `nmapScans/nmap_open_relay.sh` | Nmap: Check for open SMTP relay. |
| 📜 `nmapScans/nmap_quick.sh` | Nmap: Scan hosts from hosts file, save output to given location. |

***📂 nmapScans/proxychains***

| Path | Description |
|------|-------------|
| 📜 `nmapScans/proxychains/nmap_aggressive.sh` | Nmap: Aggressive scan all ports, save output. |
| 📜 `nmapScans/proxychains/nmap_check_online_hosts.sh` | Nmap: ping sweep |
| 📜 `nmapScans/proxychains/nmap_open_relay.sh` | Nmap: Check for open SMTP relay. |
| 📜 `nmapScans/proxychains/nmap_quick.sh` | Nmap: Scan hosts from scope.txt, save output to nmap_1k. |


<br />

### 📂 portListening/

different scripts to do port listenings

| Path | Description |
|------|-------------|
| 📜 `portListening/add_new_ligolo_interface.sh` | add new ligolo interface |
| 📜 `portListening/cmd_upload_ligolo_agent_exe.sh` | cmd: download ligolo agent.exe to server and connect to proxy |
| 📜 `portListening/curl_ligolo_agent.sh` | download ligolo agent to server and connect to proxy |
| 📜 `portListening/ps_upload_ligolo_agent_exe.sh` | ps download ligolo agent.exe to server and connect to proxy |
| 📜 `portListening/remove_ligolo_interface.sh` | remove ligolo interface |
| 📜 `portListening/socat_listener.sh` |  |
| 📜 `portListening/socat.sh` |  |
| 📜 `portListening/ssh_forward_rdp_port.sh` | ssh: forward RDP port with id_rsa file |
| 📜 `portListening/start_ligolo_proxy.sh` | configure ligolo interface and start proxy |

<br />

### 📂 python/

different python scripts like to start http server

| Path | Description |
|------|-------------|
| 📜 `python/http_server.sh` | start http server |
| 📜 `python/server_always_return_200.sh` | start server and always return 200 |

<br />

### 📂 reconnaissance/

scripts to do reconnaissance


***📂 reconnaissance/linux***

scripts to do reconnaissance on linux

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/linux/check_for_ps_changes.sh` | refresh ps -aux list every second |
| 📜 `reconnaissance/linux/check_running_cronjobs.sh` | download pspy64 to server and run it |
| 📜 `reconnaissance/linux/execute_linpeas.sh` | download linpeas to server and execute |
| 📜 `reconnaissance/linux/linpeas_one_liner.sh` | linpeas one liner |
| 📜 `reconnaissance/linux/local_port_scan_on_ip.sh` | local port scan on ip |
| 📜 `reconnaissance/linux/mini_linpeas.sh` | perform mini linpeas to get pentest info |
| 📜 `reconnaissance/linux/mount_nfs_file_system.sh` | mount to ip |
| 📜 `reconnaissance/linux/ping_sweep_linux.sh` | ping sweep - check if ips are alive in ip range 0.0.0 |
| 📜 `reconnaissance/linux/show_mounts.sh` | show ip mounts |
| 📜 `reconnaissance/linux/tcpdump_sniff_traffic.sh` | sniff for traffic with tcpdump and save to pcap file |
| 📜 `reconnaissance/linux/unmount_nfs_file_system.sh` | unmount ip mount |


***📂 reconnaissance/windows***

scripts to do reconnaissance on windows

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/get_usernames_ntlm_hashes_from_ntlm_username_rid_lm_ntlm_hashes.sh` | save username and ntlm hashes in seperated files from form username:RID:LM:NTLM::: |
| 📜 `reconnaissance/windows/impacket_get_ad_users.sh` | Impacket: GetADUsers.py get domain users |
| 📜 `reconnaissance/windows/impacket_ntlmrelay.sh` | impacket NTLM relayx attack |
| 📜 `reconnaissance/windows/psexect_to_user.sh` | Impacket: psexec.py get psexec shell  |
| 📜 `reconnaissance/windows/read_sam_database.sh` | Impacket: Local secretsdump using SYSTEM, SAM, and SECURITY hives. |
| 📜 `reconnaissance/windows/request_user_spns_check_for_services.sh` | GetUserSPNs: check for services |
| 📜 `reconnaissance/windows/save_sam_database.sh` | Registry: Save SYSTEM, SECURITY, and SAM hives. |
| 📜 `reconnaissance/windows/show_user_spns.sh` | GetUserSPNs: check for services |
| 📜 `reconnaissance/windows/snaffler.sh` | Run Snaffler on domain. |
| 📜 `reconnaissance/windows/wmiexec_connect_to_user.sh` | wmiexec: get shell to user |

***📂 reconnaissance/windows/kerberoasting***

Scripts for Kerberoasting (SPN retrieval).

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/kerberoasting/export_spn_users.sh` | PowerShell: Get SPNs, format for Hashcat, export to spns.csv. |
| 📜 `reconnaissance/windows/kerberoasting/get_samaccountname.sh` | PowerShell: Get SPN user account names. |


***📂 reconnaissance/windows/passwordSpraying***

Scripts for performing password spraying attacks.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/passwordSpraying/domain_password_spray.sh` | PowerShell: Password spray using DomainPasswordSpray.ps1. |
| 📜 `reconnaissance/windows/passwordSpraying/upload_domain_password_spray_ps1.sh` | PowerShell: upload and import DomainPasswordSpray.ps1. |


***📂 reconnaissance/windows/lazagne***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/lazagne/cmd_upload_lazagne_file.sh` | cmd: upload LaZagne file to server |
| 📜 `reconnaissance/windows/lazagne/lazagne_dump_browser_credentials.sh` | Dump browser stored credentials |
| 📜 `reconnaissance/windows/lazagne/lazagne_dump_credentials.sh` | Dump windows stored credentials |
| 📜 `reconnaissance/windows/lazagne/ps_upload_lazagne_exe.sh` | ps upload LaZagne to server |


***📂 reconnaissance/windows/ldap***

scripts to do ldap enumerations

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/ldap/ldapsearch_check_base_naming_contexts.sh` | ldapsearch check for base namingcontexts |
| 📜 `reconnaissance/windows/ldap/ldapsearch_check_specific_naming_contexts.sh` | ldapsearch check for specific namingcontexts |
| 📜 `reconnaissance/windows/ldap/ldapsearch_get_spn_of_specific_naming_contexts.sh` | ldapsearch show user info of specific namingcontexts |
| 📜 `reconnaissance/windows/ldap/ldapsearch_show_user_info_of_specific_naming_contexts.sh` | ldapsearch show user info of specific namingcontexts |
| 📜 `reconnaissance/windows/ldap/nmap_ldap_scripts_scan.sh` | nmap scan with ldap scripts |


***📂 reconnaissance/windows/evilWinRm***

Scripts for establishing Evil-WinRM connections.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/evilWinRm/connect_to_user_hash.sh` | Connect with Evil-WinRM as user using NTLM hash. |
| 📜 `reconnaissance/windows/evilWinRm/connect_to_user_password.sh` | Connect with Evil-WinRM as Administrator using password. |

***📂 reconnaissance/windows/evilWinRm/proxychains***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/evilWinRm/proxychains/connect_to_user_hash.sh` |  |
| 📜 `reconnaissance/windows/evilWinRm/proxychains/connect_to_user_password.sh` |  |



***📂 reconnaissance/windows/activeDirectroy***

scripts for active directory (AD) hacking

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/get_user_tgt.sh` | get user Ticket Granting Ticket (TGT) |

***📂 reconnaissance/windows/activeDirectroy/rubeus***

perform Rubeus attacks

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/rubeus/ps_upload_robeus.sh` | ps: Upload Rubeus.exe |


***📂 reconnaissance/windows/activeDirectroy/runasCs***

runAsCS.exe exploit

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/runasCs/ps_upload_runascs.sh` | ps: Upload RunasCs.exe |


***📂 reconnaissance/windows/activeDirectroy/invokeTokenManipulation***

invoke TokenManipulation attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/invokeTokenManipulation/ps_impersonate_as_system.sh` | ps: Makes the current PowerShell thread impersonate SYSTEM. |
| 📜 `reconnaissance/windows/activeDirectroy/invokeTokenManipulation/ps_impersonate_lsass_security_token.sh` | ps: Makes the current thread impersonate the lsass security token |
| 📜 `reconnaissance/windows/activeDirectroy/invokeTokenManipulation/ps_list_all_tokens_on_computer.sh` | ps: Lists all tokens available on the computer. |
| 📜 `reconnaissance/windows/activeDirectroy/invokeTokenManipulation/ps_list_tokens_on_computer.sh` | ps: Lists all unique usable tokens on the computer. |
| 📜 `reconnaissance/windows/activeDirectroy/invokeTokenManipulation/ps_spawn_cmd_as_system.sh` | ps: Spawns cmd.exe as SYSTEM. |
| 📜 `reconnaissance/windows/activeDirectroy/invokeTokenManipulation/ps_upload_tokenManipulation.sh` | ps: Upload and import module Invoke-TokenManipulation.ps1 |


***📂 reconnaissance/windows/activeDirectroy/certipy_ad***

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


***📂 reconnaissance/windows/activeDirectroy/sharpGPOAbuse***

script to do SharpGPOAbuse attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/sharpGPOAbuse/ps_gpo_abuse.sh` | ps: do a GPO abuse |
| 📜 `reconnaissance/windows/activeDirectroy/sharpGPOAbuse/ps_upload_sharp_gpo_abuse.sh` | ps: Upload sharpGPOAbuse |


***📂 reconnaissance/windows/activeDirectroy/powerVIew***

scripts for powerview.ps1

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/list_domain_users.sh` | creating a List of Domain Users |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/loop_over_ad_users_and_get_ad_rights.sh` | Loop over de ad_users and get AD rights |
| 📜 `reconnaissance/windows/activeDirectroy/powerVIew/ps_upload_powerview_and_import.sh` | ps: Upload sharphound and execute |


***📂 reconnaissance/windows/activeDirectroy/kerbrute***

perform kerbrute attacks

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/activeDirectroy/kerbrute/bruteforce_username_and_password.sh` | kerbrute: user enumerate on DC |



***📂 reconnaissance/windows/permissions***

Scripts related to privilege escalation and permission manipulation.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/permissions/cmd_audit_user_token_privileges.sh` | SharpUp - audit token privileges - cmd: download SharpUp to server and execute. |
| 📜 `reconnaissance/windows/permissions/ps_audit_user_token_privileges.sh` | SharpUp - audit token privileges - PS: download SharpUp to server and execute. |
| 📜 `reconnaissance/windows/permissions/ps_enableTokens.sh` | enable permission tokens |

***📂 reconnaissance/windows/permissions/seBackupPrivilege***

exploit seBackupPrivilege permission

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/permissions/seBackupPrivilege/seBackupPrivilege-part1.sh` | Registry: Save SYSTEM, SECURITY, and SAM hives. |
| 📜 `reconnaissance/windows/permissions/seBackupPrivilege/seBackupPrivilege-part2_without_security.sh` | Registry: Save SYSTEM, SECURITY, and SAM hives. |
| 📜 `reconnaissance/windows/permissions/seBackupPrivilege/seBackupPrivilege-part2_with_security.sh` | Impacket: Local secretsdump using SYSTEM, SAM, and SECURITY hives. |


***📂 reconnaissance/windows/permissions/forceChangePassword***

exploit forceChangePassword permission

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/permissions/forceChangePassword/forceChangePassword.sh` | PowerShell: Force change password for user. |


***📂 reconnaissance/windows/permissions/seImpersonatePrivilege***

exploit SeImpersonatePrivilege permission

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/permissions/seImpersonatePrivilege/cmd_seImpersonatePrivilege.sh` | CMD: PrintSpoofer: Reverse shell to KALI_IP:443 using SeImpersonatePrivilege. |
| 📜 `reconnaissance/windows/permissions/seImpersonatePrivilege/ps_seImpersonatePrivilege.sh` | PS: PrintSpoofer: Reverse shell to KALI_IP:443 using SeImpersonatePrivilege. |


***📂 reconnaissance/windows/permissions/SeDebugPrivilege***

exploit SeDebugPrivilege permission

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/permissions/SeDebugPrivilege/SeDebugPrivilege.sh` | exploit SeDebugPrivilege permission |


***📂 reconnaissance/windows/permissions/seTakeOwnershipPrivilege***

exploit SeTakeOwnershipPrivilege permission

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/permissions/seTakeOwnershipPrivilege/seTakeOwnershipPrivilege.sh` | exploit SeTakeOwnershipPrivilege permission |



***📂 reconnaissance/windows/powershell***

scripts to do reconnaissance in powershell

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/powershell/check_default_username.sh` | Powershell: Check default username |
| 📜 `reconnaissance/windows/powershell/check_defender_status.sh` | check defender status |
| 📜 `reconnaissance/windows/powershell/check_internal_listening_ports.sh` | check internal listening ports |
| 📜 `reconnaissance/windows/powershell/create_new_powershell_session_to_computer.sh` | Powershell - login to user on a different computer |
| 📜 `reconnaissance/windows/powershell/disable_defender.sh` | Disable Windows Defender and Firewall. |
| 📜 `reconnaissance/windows/powershell/disable_firewall.sh` | Disable firewall |
| 📜 `reconnaissance/windows/powershell/download_and_execute_custom_script_in_memory.sh` | PowerShell: Download and execute script in memory. |
| 📜 `reconnaissance/windows/powershell/elevate_user.sh` | Powershell - elevate user |
| 📜 `reconnaissance/windows/powershell/find_password_in_txt_ini_config_db_py_files.sh` | Search for password in .txt,.ini, config, .db, .py files |
| 📜 `reconnaissance/windows/powershell/find_passwords_in_account_description.sh` | PowerShell: Get users with non-null descriptions. |
| 📜 `reconnaissance/windows/powershell/import_module_powerview_ps1.sh` | PowerShell: Import PowerView module. |
| 📜 `reconnaissance/windows/powershell/mini_linpeas.sh` | perform mini linpeas to get pentest info |
| 📜 `reconnaissance/windows/powershell/ping_sweep_powershell.sh` | ping sweep - check if ips are alive in ip range 0.0.0 |
| 📜 `reconnaissance/windows/powershell/ps_disable_defender.sh` | Disable defender |
| 📜 `reconnaissance/windows/powershell/register_disable_defender.sh` | Disable defender in register |
| 📜 `reconnaissance/windows/powershell/restore_item_from_recycle_bin.sh` | Powershell: restore item from recycle bin |
| 📜 `reconnaissance/windows/powershell/save_custom_script_to_remote_server.sh` | PowerShell: Save file and save in current remote folder. |
| 📜 `reconnaissance/windows/powershell/search_for_file.sh` | Powershell: search for a file or extension |
| 📜 `reconnaissance/windows/powershell/show_hidden_directories.sh` | Powershell: show hidden directories |
| 📜 `reconnaissance/windows/powershell/show_hidden_files.sh` | Powershell: show hidden files |
| 📜 `reconnaissance/windows/powershell/show_items_in_recycle_bin.sh` | Powershell: Show Items in recycle bin |


***📂 reconnaissance/windows/bloodhound***

Scripts for starting BloodHound and Neo4j.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/bloodhound/cmd_upload_sharphound_and_execute.sh` | cmd: Upload sharphound and execute |
| 📜 `reconnaissance/windows/bloodhound/ps_upload_sharphound_and_execute.sh` | ps: Upload sharphound and execute |
| 📜 `reconnaissance/windows/bloodhound/python_create_bloodhound_zip.sh` | Create a bloodhound zip with bloodhound-python |
| 📜 `reconnaissance/windows/bloodhound/start_bloodhound.sh` | Start Neo4j service and launch BloodHound GUI. |

***📂 reconnaissance/windows/bloodhound/executeDCOM***

exploit execute dcom permission

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/bloodhound/executeDCOM/dcom_attack_exploit.sh` | perform executeDcom attack |


***📂 reconnaissance/windows/bloodhound/dcsync***

perform DCSync attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/bloodhound/dcsync/secretsdump_domain_user.sh` | Impacket: use secretsdump to dump hashes (DCSync) |


***📂 reconnaissance/windows/bloodhound/genericAll***

perform genericAll attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/bloodhound/genericAll/genericAll_exploit_part1.sh` | powershell: genericAll permissions exploit |


***📂 reconnaissance/windows/bloodhound/genericWrite***

perform genericWrite attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/bloodhound/genericWrite/genericWrite_exploit_part1.sh` | powershell: genericWrite permissions exploit |
| 📜 `reconnaissance/windows/bloodhound/genericWrite/genericWrite_exploit_part2.sh` | powershell: genericWrite permissions exploit |

***📂 reconnaissance/windows/bloodhound/genericWrite/proxychains***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/bloodhound/genericWrite/proxychains/genericWrite_exploit_part2.sh` | powershell: genericWrite permissions exploit |




***📂 reconnaissance/windows/netexec***

scripts to perform netexec (nxc)


***📂 reconnaissance/windows/netexec/rdp***

NetExec scripts for RDP connections.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/rdp/check_ad_users_and_passwords.sh` | nxc rdp: Check RDP with user/pass. |
| 📜 `reconnaissance/windows/netexec/rdp/check_ad_users_and_passwords_with_files.sh` | nxc rdp: Check RDP with user/pass lists, continue on success. |

***📂 reconnaissance/windows/netexec/rdp/proxychains***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/rdp/proxychains/check_ad_users_and_passwords.sh` |  |
| 📜 `reconnaissance/windows/netexec/rdp/proxychains/check_ad_users_and_passwords_with_files.sh` |  |



***📂 reconnaissance/windows/netexec/smb***

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


***📂 reconnaissance/windows/netexec/proxychains***


***📂 reconnaissance/windows/netexec/proxychains/smb***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/proxychains/smb/administrator_hash.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/check_ad_users_and_passwords.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/check_anonymous.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/dump_credentials_from_lsa.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/dump_credentials_from_sam.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/dump_ntds.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/enumerate_group.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/enumerate_local_users.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/enumerate_users_execute_cmd.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/enumerate_users_execute_smbexec.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/enumerate_users.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/find_autologon_in_registry_xml.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/null_session.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/password_policy.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/rid_brute.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/smb_start_listener.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/smb_user.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/spider_plus_share.sh` |  |
| 📜 `reconnaissance/windows/netexec/proxychains/smb/user_show_shares.sh` |  |


***📂 reconnaissance/windows/netexec/proxychains/winrm***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/proxychains/winrm/check_ad_users_and_passwords.sh` |  |



***📂 reconnaissance/windows/netexec/winrm***

NetExec scripts for WinRM connections.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/winrm/check_ad_users_and_passwords.sh` | nxc winrm: Check WinRM connection with username and password. |

***📂 reconnaissance/windows/netexec/winrm/proxychains***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/winrm/proxychains/check_ad_users_and_passwords.sh` |  |



***📂 reconnaissance/windows/netexec/ftp***

perform netexec ftp attacks

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/netexec/ftp/login_with_username_file_password_file.sh` | login with username file and password file |
| 📜 `reconnaissance/windows/netexec/ftp/login_with_username_password.sh` | login with username and password |



***📂 reconnaissance/windows/enum4linux***

Scripts for enum4linux.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/enum4linux/enum4linux_smb_null_session.sh` | Enumerate users and passwords via enum4linux. |

***📂 reconnaissance/windows/enum4linux/proxychains***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/enum4linux/proxychains/enum4linux_smb_null_session.sh` |  |



***📂 reconnaissance/windows/smbmap***

Scripts using smbmap for SMB share enumeration and command execution.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/smbmap/administrator_hash_execute_cmd_with_ntlm_hash.sh` | smbmap: Execute command on smb as user with NTLM hash. |
| 📜 `reconnaissance/windows/smbmap/administrator_hash_execute_cmd_with_password.sh` | smbmap: Execute 'whoami' on smb as Administrator with password. |

***📂 reconnaissance/windows/smbmap/proxychains***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/smbmap/proxychains/administrator_hash_execute_cmd_with_ntlm_hash.sh` |  |
| 📜 `reconnaissance/windows/smbmap/proxychains/administrator_hash_execute_cmd_with_password.sh` |  |



***📂 reconnaissance/windows/mimikatz***

Scripts for Active Directory enumeration and credential dumping.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/mimikatz/cmd_upload_mimikatz_exe.sh` | cmd: upload mimikatz to server |
| 📜 `reconnaissance/windows/mimikatz/dump_lsa_secrets.sh` | Mimikatz: Dump lsa secrets. |
| 📜 `reconnaissance/windows/mimikatz/dump_lsass_credentials.sh` | Mimikatz: Dump LSASS credentials (remove protection, debug, logonpasswords). |
| 📜 `reconnaissance/windows/mimikatz/dump_lsass_credentials_with_processprotect.sh` | Mimikatz: Dump LSASS credentials (remove protection, debug, logonpasswords). |
| 📜 `reconnaissance/windows/mimikatz/kerberos_double_hop_fix.sh` | Fix Kerberos "Double Hop" problem when using WinRM/Powershell |
| 📜 `reconnaissance/windows/mimikatz/ps_upload_mimikatz_exe.sh` | ps: upload mimikatz to server |


***📂 reconnaissance/windows/smbclient***

Scripts using smbclient for share enumeration and access.

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/smbclient/connect_to_share_anonymous.sh` | smbclient: Connect to share anonymous. |
| 📜 `reconnaissance/windows/smbclient/connect_to_share_with_user.sh` | smbclient: Connect to share with user. |
| 📜 `reconnaissance/windows/smbclient/decrypt_groups_xml_cpassword.sh` | decrypt cpassword from groups.xml |
| 📜 `reconnaissance/windows/smbclient/download_folders_resurcive.sh` | smbclient: download files recursive |
| 📜 `reconnaissance/windows/smbclient/enable_recursive.sh` | smbclient: enable recursive |
| 📜 `reconnaissance/windows/smbclient/search_in_downloaded_files_for_groups_xml.sh` | search for group policies in downloaded folders |
| 📜 `reconnaissance/windows/smbclient/show_shares.sh` | smbclient: List shares. |
| 📜 `reconnaissance/windows/smbclient/turn_off_prompt.sh` | smbclient: turn off prompt |

***📂 reconnaissance/windows/smbclient/proxychains***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/smbclient/proxychains/administrator_hash_execute_cmd.sh` |  |
| 📜 `reconnaissance/windows/smbclient/proxychains/connect_to_share.sh` |  |
| 📜 `reconnaissance/windows/smbclient/proxychains/show_shares.sh` |  |



***📂 reconnaissance/windows/asreproast***

perform asreproast attack

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/asreproast/do_asreproast_attack_hashcat.sh` | do an asreproast attack |
| 📜 `reconnaissance/windows/asreproast/do_asreproast_attack_john.sh` | do an asreproast attack |


***📂 reconnaissance/windows/kerbrute***

perform kerbrute attacks

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/kerbrute/bruteforce_username_and_password.sh` | kerbrute: user enumerate on DC |


***📂 reconnaissance/windows/rpcclient***

scripts to read AD info with rpcclient

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/rpcclient/dumping_detailed_user_info.sh` | rpcclient: dumping detailed user info |
| 📜 `reconnaissance/windows/rpcclient/dumping_domain_info.sh` | rpcclient: dumping domain info |
| 📜 `reconnaissance/windows/rpcclient/dumping_domain_password_policy.sh` | rpcclient: Dumping domain password policy |
| 📜 `reconnaissance/windows/rpcclient/dumping_groups_rid.sh` | rpcclient: Dumping groups rid |
| 📜 `reconnaissance/windows/rpcclient/dumping_groups.sh` | rpcclient: Dumping groups |
| 📜 `reconnaissance/windows/rpcclient/dumping_users_rid.sh` | rpcclient: Duming users rid |
| 📜 `reconnaissance/windows/rpcclient/dumping_users.sh` | rpcclient: Dumping users |


***📂 reconnaissance/windows/inveight***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/inveight/ps_upload_powerview_and_import.sh` | ps: Upload Inveigh.ps1 and import module |
| 📜 `reconnaissance/windows/inveight/start_inveight.sh` | Start Inveigh and perform a poofing attacks and captures hash/credential |
| 📜 `reconnaissance/windows/inveight/stop_inveight.sh` | Stop Inveigh |


***📂 reconnaissance/windows/xfreerdp***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/xfreerdp/xfreerdp.sh` | xfreerdp: Connect with specified credentials. |
| 📜 `reconnaissance/windows/xfreerdp/xfreerdp_with_attached_drive.sh` | xfreerdp: Connect, map drive 'tools' to current directory (check `net use` for the location). |

***📂 reconnaissance/windows/xfreerdp/proxychains***

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/xfreerdp/proxychains/xfreerdp.sh` | xfreerdp: Connect with specified credentials. |
| 📜 `reconnaissance/windows/xfreerdp/proxychains/xfreerdp_with_attached_drive.sh` | xfreerdp: Connect, map drive 'tools' to current directory (check `net use` for the location). |



***📂 reconnaissance/windows/cmd***

scripts to do reconnaissance in cmd

| Path | Description |
|------|-------------|
| 📜 `reconnaissance/windows/cmd/add_user.sh` | Net: Add use, add to administrators and RDP groups. |
| 📜 `reconnaissance/windows/cmd/add_user_to_domain.sh` | Net: Add user, add to Exchange Windows Permissions and Remote Mgmt groups. |
| 📜 `reconnaissance/windows/cmd/check_connected_drives.sh` | Net: Show connected network drives. |
| 📜 `reconnaissance/windows/cmd/check_local_administrators.sh` | Net: Check local administrators |
| 📜 `reconnaissance/windows/cmd/check_user_account.sh` | Net: Get user information. |
| 📜 `reconnaissance/windows/cmd/copy_file_from_shared_drive.sh` | Copy file from shared drive |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_any_exe.sh` | download winPEASany.exe to server and execute |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_any_ofs_exe.sh` | download winPEASany_ofs.exe to server and execute |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_bat.sh` | download winPEAS.bat to server and execute |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_x64_exe.sh` | download winPEASx64.exe to server and execute |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_x64_ofs_exe.sh` | download winPEASx64_ofs.exe to server and execute |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_x86_exe.sh` | download winPEASx86.exe to server and execute |
| 📜 `reconnaissance/windows/cmd/execute_winpeas_x86_ofs_exe.sh` | download winPEASx86_ofs.exe to server and execute |
| 📜 `reconnaissance/windows/cmd/find_services.sh` | Find services |
| 📜 `reconnaissance/windows/cmd/mini_linpeas.sh` | perform mini linpeas to get pentest info |
| 📜 `reconnaissance/windows/cmd/net_user_domain_details.sh` | Net: Get domain user information. |
| 📜 `reconnaissance/windows/cmd/ping_sweep_cmd.sh` | ping sweep - check if ips are alive in ip range 0.0.0 |
| 📜 `reconnaissance/windows/cmd/proof_admin.sh` | Read contents of C:\Users\Administrator\Desktop\proof.txt. |
| 📜 `reconnaissance/windows/cmd/root_admin.sh` | Read contents of C:\Users\Administrator\Desktop\root.txt. |
| 📜 `reconnaissance/windows/cmd/secretsdump_domain_user.sh` | Impacket: use secretsdump to dump hashes (DCSync) |



<br />

### 📂 shell/

scripts like automatically fix shell and make it interactive, start port listening, create rev shells

| Path | Description |
|------|-------------|
| 📜 `shell/fix_shell.sh` | Fix shell to fully interactive shell |
| 📜 `shell/listen_for_ping.sh` | listen for ping response |
| 📜 `shell/netcat.sh` | start nc port listening |
| 📜 `shell/python3_pty_spawn.sh` | python3 - pyt.spawn |
| 📜 `shell/python_pty_spawn.sh` | python - pyt.spawn |
| 📜 `shell/rlwrap_netcat.sh` | start rlwrap nc port listening |

***📂 shell/msfvenom***

msfvenom to create reverve shell files for metepreter

| Path | Description |
|------|-------------|
| 📜 `shell/msfvenom/create_asp_rev_shell.sh` | Create ASP file |
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


***📂 shell/background***

| Path | Description |
|------|-------------|
| 📜 `shell/background/compile_hollow.sh` |  |


***📂 shell/msfconsole***

msfconsole scripts with start sock proxy, port forwarding, server routes

| Path | Description |
|------|-------------|
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
| 📜 `shell/msfconsole/show_creds_all.sh` | meterpreter: show creds_all (mimikatz) |
| 📜 `shell/msfconsole/start_sock_proxy.sh` | Start socks proxy |
| 📜 `shell/msfconsole/start_windows_post_exploit_suggester.sh` | meterpreter: set windows post exploit suggester |
| 📜 `shell/msfconsole/start_windows_post_hash_dump.sh` | meterpreter: set windows post hash dump |
| 📜 `shell/msfconsole/upgrade_to_meterpreter.sh` | meterpreter:  upgrade shell to meterpreter |

***📂 shell/msfconsole/proxychains***

| Path | Description |
|------|-------------|
| 📜 `shell/msfconsole/proxychains/start_msfconsole.sh` | start msfconsole |



***📂 shell/windows***

scripts to create windows shells

| Path | Description |
|------|-------------|
| 📜 `shell/windows/cmd_execute_conPtyShell.sh` | cmd: download Invoke-ConPtyShell.ps1 to server and start shell |
| 📜 `shell/windows/cmd_execute_powershellTcp.sh` | cmd: download Invoke-PowerShellTcp.ps1 to server and start shell |
| 📜 `shell/windows/cmd_upload_nc64_and_execute_cmd.sh` | upload nc64.exe and start nc64.exe and execute cmd |
| 📜 `shell/windows/cmd_upload_nc64_and_execute_powershell.sh` | upload nc64.exe and start nc64.exe and execute powershell |
| 📜 `shell/windows/cmd_upload_nc_and_execute_cmd.sh` | upload nc.exe and start nc.exe and execute cmd |
| 📜 `shell/windows/cmd_upload_nc_and_execute_powershell.sh` | upload nc.exe and start nc.exe and execute powershell |
| 📜 `shell/windows/powershell_base64.sh` | generate base64 reverse powershell |
| 📜 `shell/windows/ps_download_nc_file.sh` | ps: download nc file |
| 📜 `shell/windows/ps_execute_conPtyShell.sh` | ps: download Invoke-ConPtyShell.ps1 to server and start shell |
| 📜 `shell/windows/ps_execute_powershellTcp.sh` | ps: download Invoke-PowerShellTc.ps1 to server and start shell |


<br />

### 📂 smtp/

scripts for smtp attacks

| Path | Description |
|------|-------------|
| 📜 `smtp/nmap_check_for_open_relay.sh` | nmap: check for smtp open relay |
| 📜 `smtp/smtp_user_enum_search_for_usernames_big.sh` | smtp-user-enum: search for usernames with given domain name (xato-net-10-million-usernames-dup.txt) |
| 📜 `smtp/smtp_user_enum_search_for_usernames_small.sh` | smtp-user-enum: search for usernames with given domain name (Honeypot-Captures/multiplesources-users-fabian-fingerle.d.txt) |

***📂 smtp/swaks***

send emails with swaks

| Path | Description |
|------|-------------|
| 📜 `smtp/swaks/authentication_with_user_password.sh` | authentication with user and password |
| 📜 `smtp/swaks/send_email.sh` | send email |
| 📜 `smtp/swaks/send_email_with_attachment.sh` | send email |


<br />

### 📂 sqlDatabase/

perform database injections


***📂 sqlDatabase/mssql***

script to enable xp_cmdshell and read directories

| Path | Description |
|------|-------------|
| 📜 `sqlDatabase/mssql/enable_xp_cmdshell.sh` | script to enable xp_cmdshell |
| 📜 `sqlDatabase/mssql/execute_sp_execute_external_script.sh` | execute sp_execute_external_script command |
| 📜 `sqlDatabase/mssql/execute_xp_cmdshell.sh` | execute xp_cmdshell command |
| 📜 `sqlDatabase/mssql/metasploit_bruteforce_username_and_password_file.sh` | mssql: bruteforce username and passwords file |
| 📜 `sqlDatabase/mssql/metasploit_bruteforce_username_file_and_password_file.sh` | mssql: bruteforce username file and passwords file |
| 📜 `sqlDatabase/mssql/metasploit_bruteforce_userpass_file.sh` | mssql: bruteforce userpass file (user pass) |
| 📜 `sqlDatabase/mssql/read_directory.sh` | script to read directories with xp_dirtree |
| 📜 `sqlDatabase/mssql/show_databases.sh` | show databases |
| 📜 `sqlDatabase/mssql/show_tables_in_database.sh` | show tables in database |
| 📜 `sqlDatabase/mssql/start_mssql_connection.sh` | start a mssql connection |
| 📜 `sqlDatabase/mssql/start_sp_execute_external_script_nc_reverse_shell.sh` | execute sp_execute_external_script nc reverse shell |
| 📜 `sqlDatabase/mssql/start_sp_execute_external_script_powershell_reverse_shell.sh` | execute sp_execute_external_script powershell reverse shell |
| 📜 `sqlDatabase/mssql/start_xp_cmdshell_nc_reverse_shell.sh` | execute xp_cmdshell nc reverse shell |
| 📜 `sqlDatabase/mssql/start_xp_cmdshell_powershell_reverse_shell.sh` | execute xp_cmdshell powershell reverse shell |
| 📜 `sqlDatabase/mssql/view_table_content_in_specific_database.sh` | view content in table in specific database |


***📂 sqlDatabase/sqlmap***

different sqlmap scripts to perform SQLi

| Path | Description |
|------|-------------|
| 📜 `sqlDatabase/sqlmap/dump-database.sh` | sqlmap: dump current database |
| 📜 `sqlDatabase/sqlmap/dump_specific_database.sh` | sqlmap: dump specific database |
| 📜 `sqlDatabase/sqlmap/forms.sh` | sqlmap: SQLi on all forms on a websith |
| 📜 `sqlDatabase/sqlmap/perform_authorization_basic_header_attack.sh` | sqlmap: perform Authorization: Basic attack |
| 📜 `sqlDatabase/sqlmap/show_databases.sh` | sqlmap: show all databases |
| 📜 `sqlDatabase/sqlmap/show_specific_database_table.sh` | sqlmap: show specific database tables |


<br />

### 📂 ssh/

scripts to start port listening or forwarding

| Path | Description |
|------|-------------|
| 📜 `ssh/local_port_listening.sh` | type ssh port listening |
| 📜 `ssh/local_port_listening_with_sshkey.sh` | type ssh port listening with ssh key |
| 📜 `ssh/metasploit_bruteforce_username_and_password_file.sh` | ssh: bruteforce username and passwords file |
| 📜 `ssh/metasploit_bruteforce_username_file_and_password_file.sh` | ssh: bruteforce username file and passwords file |
| 📜 `ssh/metasploit_bruteforce_userpass_file.sh` | ssh: bruteforce userpass file (user pass) |
| 📜 `ssh/remote_port_forwarding.sh` | type ssh port forwarding |
| 📜 `ssh/remote_port_forwarding_with_sshkey.sh` | type ssh port forwarding with ssh key |
| 📜 `ssh/socket_port_sock_forwarding.sh` | -D sock 5 forwarding |

<br />

### 📂 web/

scripts to execute web pentests like gobuster, eyewitness, ferobuster, fuzz


***📂 web/fuzz***

scripts to do attacks with fuzz

| Path | Description |
|------|-------------|
| 📜 `web/fuzz/fuzz_for_files_in_var_www_html_with_php_filter_base64.sh` | fuzz for files in var www html with php filter base64 |
| 📜 `web/fuzz/fuzz_for_php_files.sh` | fuzz for PHP files |
| 📜 `web/fuzz/fuzz_for_php_param_name.sh` | fuzz for PHP param |
| 📜 `web/fuzz/fuzz_for_php_param_value.sh` | fuzz for PHP param value |
| 📜 `web/fuzz/fuzz_for_wordpress_files_in_var_www_html_with_php_filter_base64.sh` | fuzz for wordpress files in var www html with php filter base64 |
| 📜 `web/fuzz/vhost.sh` | fuzz vhosts |


***📂 web/eyewitness***

execute eyewitness with custom or nmap file

| Path | Description |
|------|-------------|
| 📜 `web/eyewitness/eyewitness_with_custom_file.sh` | execute eyewitness with custom file |
| 📜 `web/eyewitness/eyewitness_with_nmap_file.sh` | execute eyewitness with nmap file |


***📂 web/gobuster***

scripts to do attacks with gobuster

| Path | Description |
|------|-------------|
| 📜 `web/gobuster/directory_with_dirb_common_wordlist_and_extensions.sh` | gobuster directory search with dirb/common.txt and extensions wordlist |
| 📜 `web/gobuster/directory_with_dirb_common_wordlist.sh` | gobuster directory with wordlists/dirb/common.txt |
| 📜 `web/gobuster/dir_with_directory_list_medium_and_extensions.sh` | gobuster directory with directory-list-2.3-medium.txt and extensions worldlist |
| 📜 `web/gobuster/dir_with_directory_list_medium.sh` | gobuster directory with directory-list-2.3-medium.txt |
| 📜 `web/gobuster/raft_large_file_search.sh` | gobuster file search with /usr/share/seclists/Discovery/Web-Content/raft-large-files.txtt |
| 📜 `web/gobuster/vhost.sh` | gobuster vhosts with subdomains-top1million-110000.txt |


***📂 web/gitDumper***

dump .git folder to local folder

| Path | Description |
|------|-------------|
| 📜 `web/gitDumper/dump_git_folder_to_local_folder.sh` | dump git folder to local folder |


***📂 web/lfi***

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


***📂 web/wordpress***

script to do wordpress attacks

| Path | Description |
|------|-------------|
| 📜 `web/wordpress/wpscan_bruteforce_user_file_with_password_file.sh` | wpscan bruteforce user file with password file |
| 📜 `web/wordpress/wpscan_bruteforce_user_with_password_file.sh` | wpscan bruteforce user with password file |
| 📜 `web/wordpress/wpscan_check_for_vulnerable_plugins.sh` | wpscan check for vulnerable plugins |
| 📜 `web/wordpress/wpscan_enumerate_users.sh` | wpscan enumerate users |


***📂 web/feroxbuster***

execute directory and file search with feroxbuster

| Path | Description |
|------|-------------|
| 📜 `web/feroxbuster/directory_search_dirb_common.sh` | feroxbuster directory search dirb/common.txt |
| 📜 `web/feroxbuster/directory_search_directory_list_medium.sh` | feroxbuster directory search directory-list-2.3-medium.txt |
| 📜 `web/feroxbuster/extension_search.sh` | execute feroxbuster directory search and files with extensions search |


<br />
