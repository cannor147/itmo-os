set src=C:\Users\cannor147\Education\itmo-os\labs\src\lab06

echo Computer name: %computername% 

set /a hours=%time:~0,2%
set /a miinutes=%time:~3,2%
if %miinutes% == 59 (
	set miinutes=0
	if %hours% == 23 (
		set hours=0
	) else (
		set /a hours=%hours%+1
	)
) else (
	set /a miinutes=%miinutes%+1
)

if %hours% lss 10 (
	set hours=0%hours%
)

if %miinutes% lss 10 (
	set miinutes=0%miinutes%
)

schtasks /create /sc once /tn os_lab6_copy_task /tr %src%\task2_copy.bat /st %hours%:%miinutes%