@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\mtale\Desktop\ELEC291\Lab_5\"
"C:\Users\mtale\Desktop\ELEC291\CrossIDE\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5.c"
if not exist hex2mif.exe goto done
if exist lab5.ihx hex2mif lab5.ihx
if exist lab5.hex hex2mif lab5.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\mtale\Desktop\ELEC291\Lab_5\lab5.hex
