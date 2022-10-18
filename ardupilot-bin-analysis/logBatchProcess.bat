@echo off
Rem This batch file extracts desired parameters from Arudpilot bin file and 
Rem stores them in CSV files.
Rem This takes in 2 arguments: BinFileName.bin; parameters to extract e.g BAT, ATT...
echo %1
echo %2
Rem echo %3 DEPRICATED, was for CSV naming
echo -------------------------------
echo PY SCRIPT PATH:
set mavPyPath=C:\Users\user\miniconda3\envs\MavLogTools\Lib\site-packages\pymavlink\tools\mavlogdump.py
echo %mavPyPath%
echo -------------------------------
echo NEW FOLDER:
set newFolder=%1
set newFolder=%newFolder:~0,8%
echo %newFolder%
MD %newFolder%
set folder=C:\Users\user\Desktop\LogFiles\%newFolder%\
echo %folder%
echo -------------------------------
echo FILE NAMES:
set binLoc=%1%
set csvName=%1
set csvName=%csvName:~0,8%_%csvName:~-6,2%_%2.csv
set csvLoc=%folder%%csvName%
echo %binLoc%
echo %csvLoc%
echo RUNNING PY SCRIPT:
echo -------------------------------
python %mavPyPath% --types %2 --format csv %binLoc% > %csvLoc%
echo COMPLETE!