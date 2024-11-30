# Network_analyzer --- Work in progress

This script has been tested on **k 9.5**  **Linux** and **Red Hat**.  


## How to Use

1. **Make sure that you have the necessary packets**  
   Commands for debian and redhat distros:
   ```bash
   apt install traceroute nmap bind9utils -y
   
   dnf install traceroute nmap bind-utils -y

2. **Clone or Download the Repository**  
   Download the script to your system or clone the repository:
   ```bash
   git https://github.com/eugeniogiusti/network_analyzer.git
   
   cd network_analyzer


3. Grant Execution Permissions
Give the script executable permissions:
   ```bash
   chmod +x network_analyzer.sh


4. Run the Script &
Switch to the root user if you don't want to enter the password during the process:
   ```bash
   sudo su
   ./network_analyzer.sh


5. Step follow the instructions
   ```bash
   Follow the instruction of the script.
   You have to put your ip target and its port and that's it!


6. Step read and import
   ```bash
   Read the report .txt and import the .pcap in Wishareshark to analazite it!
