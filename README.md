1.Make the Script Executable
Ensure that your Bash script (sysopctl.sh) is executable. You can do this using the chmod command:
chmod +x sysopctl.sh

2. Move the Script to a Directory in Your $PATH
The system looks for executable files in directories listed in the $PATH environment variable (e.g., /usr/local/bin, /usr/bin, /bin). To make your script available as a system-wide command, move it to one of these directories. Typically, /usr/local/bin is used for custom scripts.

Move the script to /usr/local/bin (you may need sudo for permission):


Copy code
sudo mv sysopctl.sh /usr/local/bin/sysopctl
Rename the script to sysopctl to remove the .sh extension so it behaves like a normal command.

3. Verify the Installation
To verify that your command is now available system-wide, run:


Copy code
sysopctl --help
If everything is set up correctly, you should see the help message you defined in your script.

4. (Optional) Add the Command to Your Own Custom Directory
If you don’t want to install the script system-wide, you can create your own directory for custom commands and add it to your $PATH.

Steps:
Create a directory (e.g., ~/bin):


Copy code
mkdir -p ~/bin
Move the script there:


Copy code
mv sysopctl.sh ~/bin/sysopctl
Add this directory to your $PATH (add this line to your ~/.bashrc or ~/.bash_profile):


Copy code
export PATH="$HOME/bin:$PATH"
Apply the changes:


Copy code
source ~/.bashrc
Now, you can use sysopctl as a command from any location, without needing to specify the full path.

5. Update the Manual Page (Optional)
If you want to install a manual page for sysopctl:

Create a man page file, e.g., /usr/local/share/man/man1/sysopctl.1.

Add the content to the man page:


Copy code
sudo nano /usr/local/share/man/man1/sysopctl.1
Add content like:


.TH sysopctl 1 "October 2024" "v0.1.0" "System Management Tool"
.SH NAME
sysopctl \- A system resource management tool.
.SH SYNOPSIS
sysopctl [command] [options]
.SH DESCRIPTION
sysopctl is a tool for managing system services, viewing system load, and checking system resources.
.SH OPTIONS
--help    Show help.
--version Show version.
Update the man page database:


Copy code
sudo mandb
