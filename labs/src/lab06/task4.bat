set out=C:\Users\cannor147\Education\itmo-os\labs\out\production\lab06

set driver_list_file=%out%\drivers.txt
set driver_set_file=%out%\sorted_drivers.txt

driverquery /fo table /nh > %driver_list_file%

sort /r %driver_list_file% /o %driver_set_file%