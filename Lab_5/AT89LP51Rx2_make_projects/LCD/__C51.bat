@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\mtale\Desktop\ELEC291\Lab_5\AT89LP51Rx2_make_projects\LCD\"
"C:\Users\mtale\Desktop\ELEC291\CrossIDE\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\mtale\Desktop\ELEC291\Lab_5\AT89LP51Rx2_make_projects\LCD\LCD_4bit_AT89LP51RC2.c"
if not exist hex2mif.exe goto done
if exist LCD_4bit_AT89LP51RC2.ihx hex2mif LCD_4bit_AT89LP51RC2.ihx
if exist LCD_4bit_AT89LP51RC2.hex hex2mif LCD_4bit_AT89LP51RC2.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\mtale\Desktop\ELEC291\Lab_5\AT89LP51Rx2_make_projects\LCD\LCD_4bit_AT89LP51RC2.hex
