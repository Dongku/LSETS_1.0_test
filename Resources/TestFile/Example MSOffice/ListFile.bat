#dir /b > TestData.csv
@ECHO OFF &SETLOCAL
(FOR /f "delims=" %%a IN ('dir /b /a-d') DO (
    FOR /f "tokens=1-3*" %%x IN ('dir /a-d /tc "%%~a"^|findstr "^[0-9]"') DO (
        ECHO TestFile,%%a
    )
)
	ECHO TXT,EndOfTest.txt
	ECHO Exit,Do Not Test
)>TestData.csv
TYPE TestData.csv