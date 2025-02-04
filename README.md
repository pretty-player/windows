Automatic ping is a batch file 
Just imagine to find out all living hosts in our private network run this file on your cmd
it explore all living hosts

----------Description----------
c:\>automaticping.bat starting_host_number ending_host_number
c:\>automaticping.bat 200 220

This script send 2 packets each ip address , if ip is living we can see the label "time<1ms" 
If not living the ping return :Destination not reachable

This script working 3 digits of ip address 192.168.103.* 
If you want customize your preference change the findstr command string slicing 

Happy Coding!!!
