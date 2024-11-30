# Network analyzer troubleshooting Script  

This script is designed to test a network resource and gather information for accurate troubleshooting.  

## Features  

- Operates at the network and port levels.  
- Launches `tcpdump` during all tests to sniff traffic sent to the target machine.  
  - Provides a comprehensive overview for advanced network analysis.  
- Performs the following tests:  
  - **Ping**  
  - **Traceroute**  
  - Option to perform a DNS lookup (`dig`) on an IP or DNS name.  
  - Option to test if the target's TCP port is open using **Nmap**.
  - tcpdump that records all activies

## Recommended Usage  

1. Run the script to perform initial network tests.  
2. As a final step, conduct service-specific tests such as:  
   - Logging in via SSH.  
   - Testing the target service manually.  
3. The ongoing `tcpdump` collects all traffic, allowing for advanced analysis.  
4. When testing is complete, type `ok` to terminate the script.  

## Compatibility  

- This script has been tested on **MX Linux** and works perfectly.  
- Feel free to test it on other systems.
- If you encounter issues or want to improve the script, contributions are welcome!  

## Prerequisites  

Ensure the following packages are installed for full functionality:  
- `tcpdump`  
- `ping`  
- `traceroute`  
- `dig`  
- `nmap`  

## How to Use

1. **Make sure that you have the necessary packets**  
   Commands for debian and redhat distros:
   ```bash
   apt install traceroute nmap bind9utils tcpdump -y
   
   dnf install traceroute nmap bind-utils tcpdump -y

2. **Clone or Download the Repository**  
   Download the script to your system or clone the repository:
   ```bash
   git clone https://github.com/eugeniogiusti/network_analyzer.git
   
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
