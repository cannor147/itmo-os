set src=C:\Users\cannor147\Education\itmo-os\labs\src\lab06
set out=C:\Users\cannor147\Education\itmo-os\labs\out\production\lab06

set service_list_file=%out%\services.txt
set service_list_new_file=%out%\new_services.txt

net start > %service_list_file%

net stop bthserv

timeout /t 3
net start > %service_list_new_file%

call %src%\task3_diff.bat

net start bthserv

timeout /t -1