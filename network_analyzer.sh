#!/bin/bash

# Welcome
echo "Welcome in your network analyzer! Press Enter to continue."
read -p "Press Enter to continue..."

# report .txt file
read -p "Insert a name for report file (without extension): " report_name
report_file="${report_name}.txt"

# File pcap for Wireshark
read -p "Insert a name for the .pcap file, File that will use Wireshark (without extension): " pcap_name
pcap_file="${pcap_name}.pcap"

# Starting of the report
echo "===== Network Analyzer Report =====" > "$report_file"

# STEP 1: Let's run tcpdump
echo "STEP 1: Traffic capture with tcpdump" | tee -a "$report_file"
read -p "Insert IP target: " target_ip
echo "Run tcpdump, saving in ${pcap_file}..."
sudo tcpdump -i any host "$target_ip" -w "$pcap_file" &
tcpdump_pid=$!
echo "Tcpdump runned in background (PID: $tcpdump_pid). Next steps..." | tee -a "$report_file"

# STEP 2: Ping of the targer
echo "STEP 2: Ping" | tee -a "$report_file"
ping_output=$(ping -c 10 "$target_ip")
echo "$ping_output" >> "$report_file"
echo "Ping completed." | tee -a "$report_file"

# STEP 3: Traceroute
echo "STEP 3: Traceroute" | tee -a "$report_file"
traceroute_output=$(traceroute "$target_ip")
echo "$traceroute_output" >> "$report_file"
echo "Traceroute completed." | tee -a "$report_file"

# STEP 4: DNS check with dig
echo "STEP 4: Check dns with DIG" | tee -a "$report_file"
read -p "Do you wanna do a DIG check on the target machine? (Enter to confirm, no/n to jump): " dig_choice
if [[ "$dig_choice" =~ ^([sS][ìI]?|[sS]?|)$ ]]; then
    read -p "Insert IP or DNS name: " dig_target
    dig_output=$(dig "$dig_target")
    echo "=== Dig Output ===" >> "$report_file"
    echo "$dig_output" >> "$report_file"
    echo "Dig completed." | tee -a "$report_file"
else
    echo "Dig non executed." | tee -a "$report_file"
fi

# STEP 5: port check with nmap
echo "STEP 5: Check port with nmap. Make sure that it's a TCP port" | tee -a "$report_file"
read -p "Doju wanna check if the port is open? (Enter to confirm, no/n to jump): " nmap_choice
if [[ "$nmap_choice" =~ ^([sS][ìI]?|[sS]?|)$ ]]; then
    read -p "IP target: " nmap_ip
    read -p "port number (TCP): " nmap_port
    nmap_output=$(nmap -p "$nmap_port" "$nmap_ip")
    echo "=== Nmap Output ===" >> "$report_file"
    echo "$nmap_output" >> "$report_file"
    echo "Nmap completed." | tee -a "$report_file"
else
    echo "Nmap not excecuted." | tee -a "$report_file"
fi

# STEP 6: manual test
echo "STEP 6: Manual test of the service" | tee -a "$report_file"
echo "Check your service for example try to enter in ssh or if it's a webpage try to enter and login whatever test you wanna do, Do it. There's the tcpdump in background that takes informations" | tee -a "$report_file"
echo "Write 'ok' when you've done."
while :; do
    read -p "> " service_test_done
    [[ "$service_test_done" == "ok" ]] && break
done
echo "Manual test completed." | tee -a "$report_file"

# tcpdump finish
echo "Press control +c to terminate script and tcpdump..."
sudo kill -2 "$tcpdump_pid" 2>/dev/null
wait "$tcpdump_pid" 2>/dev/null
echo "File .pcap saved like ${pcap_file}." | tee -a "$report_file"

# last part
echo "===== End of script =====" >> "$report_file"
echo "Report saved like ${report_file}."
echo ".pcap saved like ${pcap_file}."
echo "Script completed!"
