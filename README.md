⚙️ How to Use BAT Files (Step-by-Step)
🪟 1. What Is a BAT File?
A BAT file (Batch file) is a simple text file that contains a list of Windows Command Prompt (CMD) commands.
When you double-click it, the commands inside run automatically — one after another — to perform system operations like cleaning temp files, resetting networks, or boosting performance.
⚡ 2. Why Run as Administrator?
Most BAT files need Admin privileges because they modify or reset system-level settings (like network adapters or system cache).
Without Admin rights, some commands will fail or show “Access Denied.”
To run as Administrator:
Right-click the .bat file
Choose “Run as administrator”
Click Yes on the UAC popup
The CMD window will open and start executing commands
Wait until it shows “Press any key to continue” — then press any key to finish
💡 Tip: Always close other apps before running system scripts to avoid conflicts.
🔍 3. How Does It Fix or Improve Your System?
Each BAT file focuses on a specific function.
Here’s a detailed explanation for each type 👇
🧠 Network Reset BAT
Purpose: Fix slow or unstable Wi-Fi, no internet, or limited connectivity.
What It Does:
Runs ipconfig /release and ipconfig /renew to refresh your IP
Flushes DNS cache using ipconfig /flushdns
Resets the Winsock catalog using netsh winsock reset
Restarts network adapters to clear stuck connections
Result:
Fixes issues like “No Internet Access” or “Unidentified Network”
Speeds up internet connection
Cleans old IP and DNS records
⚙️ Performance Boost BAT
Purpose: Optimize CPU, GPU, and RAM usage for better gaming and system speed.
What It Does:
Sets Windows power plan to High Performance
Disables unnecessary background services
Clears temporary cache files
Enables GPU preference for heavy applications (if supported)
Result:
Faster system performance
Smooth gaming experience
Reduces lag and system stutter
🧹 Cleanup Tool BAT
Purpose: Free up space and remove junk files safely.
What It Does:
Deletes files from %temp% and C:\Windows\Temp
Clears system cache and log files
Empties Recycle Bin automatically
Refreshes explorer.exe after cleanup
Result:
Recovers disk space
Makes the PC boot faster
Removes leftover temporary files from apps and Windows updates
🌐 Internet Speed Fix BAT
Purpose: Fix DNS, IP, and ping-related lag for gaming or browsing.
What It Does:
Flushes old DNS cache
Resets network adapter
Re-registers TCP/IP stack
Optimizes netsh int tcp settings for fast data transfer
Result:
Improved ping stability
Smooth gaming without packet loss
Faster website loading and downloads
🧰 4. Safety and Performance Notes
✅ All commands are Windows system-safe and reversible
⚠️ Always review code before running if downloaded from others
💾 You can open any .bat file in Notepad to check the commands
🧼 Recommended to restart your PC after running most scripts for full effect
🧑‍💻 5. Example Use Case
If your internet becomes slow, run:
Network-Fix\Reset_Network.bat
→ Right-click → Run as Administrator
→ Wait for it to finish → Restart PC
✅ Your network will be refreshed and the internet should work smoother.
If your laptop feels laggy, run:
System-Performance\Performance_Mode.bat
→ Run as Admin
→ This will apply the high-performance power plan and cleanup unnecessary processes.
🧩 6. How It Improves Performance
Clears junk data that slows down storage I/O
Optimizes power usage to keep CPU at high frequency
Resets corrupted settings that cause lag or network issues
Keeps system registry and DNS clean
Improves startup and shutdown speed
🚀 Final Summary
BAT Type	Function	Key Commands	Result
🧠 Network Reset	Fix internet & DNS	netsh, ipconfig	Stable connection
⚙️ Performance Boost	Optimize system & GPU	powercfg, taskkill	Smooth speed
🧹 Cleanup Tool	Free space	del, cleanmgr	Faster PC
🌐 Internet Fix	Improve ping & DNS	netsh int tcp, flushdns	Better online speed
