set src=C:\Users\cannor147\Education\itmo-os\labs\src\lab06
set out=C:\Users\cannor147\Education\itmo-os\labs\out\production\lab06
set file=%src%\task2.bat

mkdir %out%\%computername%\temp
xcopy /z %file% %out%\%computername%\temp\

schtasks /delete /tn os_lab6_copy_task /f