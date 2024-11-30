# Network_analyzer --- Work in progress

This script has been tested on **k 9.5**  **Linux** and **Red Hat**.  


## How to Use

1. **Clone or Download the Repository**  
   Download the script to your system or clone the repository:
   ```bash
   git 
   
   cd 


2. Grant Execution Permissions
Give the script executable permissions:
   ```bash
   chmod +x install_tomcat.sh


4. Run the Script &
Switch to the root user if you don't want to enter the password during the process:
   ```bash
   sudo su
   ./.sh


6. 
   ```bash
   firewall-cmd --zone=public --add-port=8080/tcp --permanent
   firewall-cmd --reload
  

8. 
   ```bash
   firewall-cmd --list-all
