@echo off
setlocal

echo === Clean Template Script ===
echo This will delete all .gitkeep files, README.md, and this script itself.
echo Are you sure you want to proceed? (Y/N)
set /p confirm="> "

if /I not "%confirm%"=="Y" (
    echo Aborted.
    goto :EOF
)

echo Cleaning up...

REM Delete all .gitkeep files recursively
for /r %%f in (*.gitkeep) do (
    echo Deleting: %%f
    del "%%f"
)

REM Delete README.md in root (if it exists)
if exist "README.md" (
    echo Deleting: README.md
    del "README.md"
)

REM Delete this script itself
echo Deleting: %~nx0
del "%~f0"
