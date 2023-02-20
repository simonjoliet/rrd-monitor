# rrdmon

This is a PHP script that monitors and visualizes the disk space, ping data, and temperature data of a Raspberry Pi. It uses the RRDtool to fetch the data from the RRD (Round-Robin Database) files where the system stores data at regular intervals.

The script retrieves the total, used and free disk space, and stores the information in variables $totalSpace, $usedSpace, and $freeSpace. The command df -h is used to check the space usage.

The script fetches the ping data from the RRD file using the rrdtool fetch command and stores it in a concatenated string $dataLinePing. Similarly, it fetches the temperature data from the RRD file and stores it in $dataLineTemp.

The script then generates two line charts using the Google Charts API: one for the ping data and the other for the temperature data. The script also generates a pie chart that shows the current disk usage. The chart data is generated using the variables defined earlier.

Finally, the script outputs an HTML page that displays the charts and disk usage information.
