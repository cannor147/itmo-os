set out=C:\Users\cannor147\Education\itmo-os\labs\out\production\lab06

set service_list_file=%out%\services.txt
set service_list_new_file=%out%\new_services.txt
set service_list_diff_file=%out%\diff_services.txt

fc /a %service_list_file% %service_list_new_file% > %service_list_diff_file%