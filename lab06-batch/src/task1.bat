set out=C:\Users\cannor147\Education\itmo-os\labs\out\production\lab06
set tmp_directory=%out%\tmp
set test_directory=%out%\test

mkdir %tmp_directory%
wmic os get Caption > %tmp_directory%\caption.txt
wmic os get FreePhysicalMemory > %tmp_directory%\free_physical_memory.txt
wmic os get TotalVisibleMemorySize > %tmp_directory%\total_visible_memorySize.txt
wmic logicaldisk get name,description > %tmp_directory%\logical_disks.txt

mkdir %test_directory%
copy /y %tmp_directory%\* %test_directory%\*
copy /y /b %tmp_directory%\* %out%\all_content.txt
del /q  %tmp_directory%