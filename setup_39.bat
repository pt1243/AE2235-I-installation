@echo off

set NUMPY_WHEEL_FILENAME=wheels\numpy-1.22.4+mkl-cp39-cp39-win_amd64.whl
set SCIPY_WHEEL_FILENAME=wheels\SciPy-1.8.1-cp39-cp39-win_amd64.whl
set SLYCOT_WHEEL_FILENAME=wheels\slycot-0.4.0-cp39-cp39-win_amd64.whl
set PYTHON_PATH=.\venv\scripts\python.exe

echo Checking if virtual environment exists...
if not exist venv\ ( 
echo No virtual environment found, creating...
py -3.9 -m venv venv
	if not exist %PYTHON_PATH% (
		echo.
		echo     ERROR: virtual environment creation failed for Python 3.9
		echo     Confirm that you have Python 3.9 installed by running 'py -0p'
		goto endfail
	) ELSE (
		echo     Virtual environment successfully created in .\venv\
		echo.
	)
) ELSE (
	echo     Virtual environment found in .\venv\
	echo.
)


echo Checking if .\wheels\ exists...
if not exist wheels\ (
	mkdir wheels
	echo     You have not downloaded the required wheels into the correct folder, please ensure they are in .\wheels\ and try again
	goto endfail
) ELSE (
	echo     .\wheels\ found
	echo.
)

echo Checking for correct wheels...

if not exist %NUMPY_WHEEL_FILENAME% (
	echo     Could not find the required NumPy wheel %NUMPY_WHEEL_FILENAME%
	echo     Please ensure you have downloaded the correct file and try again.
	goto endfail
) ELSE (
	echo     Correct NumPy wheel %NUMPY_WHEEL_FILENAME% found
)

if not exist %SCIPY_WHEEL_FILENAME% (
	echo     Could not find the required SciPy wheel %SCIPY_WHEEL_FILENAME%
	echo     Please ensure you have downloaded the correct file and try again.
	goto endfail
) ELSE (
	echo     Correct SciPy wheel %SCIPY_WHEEL_FILENAME% found
)

if not exist %SLYCOT_WHEEL_FILENAME% (
	echo     Could not find the required Slycot wheel %SLYCOT_WHEEL_FILENAME%
	echo     Please ensure you have downloaded the correct file and try again.
	goto endfail
) ELSE (
	echo     Correct Slycot wheel %SLYCOT_WHEEL_FILENAME% found
)

echo.
echo Upgrading pip...
echo.
%PYTHON_PATH% -m pip install --upgrade pip
echo.

echo Installing wheels...
echo.
%PYTHON_PATH% -m pip install %NUMPY_WHEEL_FILENAME%
%PYTHON_PATH% -m pip install %SCIPY_WHEEL_FILENAME%
%PYTHON_PATH% -m pip install %SLYCOT_WHEEL_FILENAME%
echo.
echo Wheels installed successfully!
echo.

echo Installing PyDSTool and control packages...
echo.
%PYTHON_PATH% -m pip install control pydstool
echo.
echo PyDSTool and control packages successfully installed!
goto endsuccess

:endfail
echo.
echo The program exited with one or more errors. Please fix them and try running this script again.
echo.
pause
exit 1

:endsuccess
echo.
echo Installation completed successfully!
pause
exit 0
