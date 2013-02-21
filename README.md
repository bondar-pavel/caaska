					CaaSka.

This is a tool for distributed computing over ssh pipe.

CaaSka - is  'Computing as a Service', I don't know yet what means other part of name 'ka'.

What is it about to do?
1) Managing Network Devices, which can be used for distributed computing.
And this area includes next subtasks:
   a) Store list of known devices.
   b) Guess credentials for device.
   c) Scan Range for available devices.
   d) Check device status via:
       + ping
       + ssh connection
   e) Get list of available tools on device and this version or even compile options.
2) Executing Jobs over available devices. 
For now it looks like list of piped console command, 
each single part can be executed on separate device and
devices are interconnected between each other over ssh-pipe.

Simple example with compressing tar on remote host:
Master 	      - Device 1        - Master 
tar something | ssh pipe gunzip | write to file on home
tar cf - *.diff |ssh user@host 'cat - >d.tar'
tar cf - *.diff |ssh user@host1 'gzip | ssh user@host2 "cat - > d.tgz"'
More examples of piped ssh power is here http://linux.icydog.net/ssh/piping.php


