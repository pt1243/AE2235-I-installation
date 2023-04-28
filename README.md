<h1 align='center'>AE2235-I-installation</h1>

This guide will help you install the `control` and `PyDSTool` Python packages using `pip` instead of Anaconda.

## Table of contents <!-- omit from toc -->
- [Method 1: The quick way](#method-1-the-quick-way)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
- [Method 2: The thorough way](#method-2-the-thorough-way)


## Method 1: The quick way

This method is intended to be quick and easy to follow, at the expense of explanations accompanying the instructions. Note that this method is Windows-specific.

### Prerequisites

Before beginning you will need:
- A functional installation of Python 3.9
- A functional installation of Python 3.10

By "functional installation", I mean that you should be able to see something like the following when you run `py -0p` in a terminal:

```
C:\> py -0p
 -V:3.11 *        C:\Program Files\Python311\python.exe
 -V:3.10          C:\Program Files\Python310\python.exe
 -V:3.9           C:\Program Files\Python39\python.exe
 -V:3.8           C:\Program Files\Python38\python.exe
 -V:3.7           C:\Program Files\Python37\python.exe
```

You most likely will not have all the versions, but you *do* need 3.9 and 3.10. If they don't appear, either:
- You have them installed but Python can't find them because they aren't on your system PATH. Edit your PATH accordingly. For the example locations listed above, this would be adding `C:\Program Files\Python310\` and `C:\Program Files\Python310\Scripts\` for Python 3.10, and similar entries for 3.9.
- You don't have them installed, in which case you can download the installers ([Python 3.9.13](https://www.python.org/ftp/python/3.9.13/python-3.9.13-amd64.exe) and [Python 3.10.11](https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe)). Ensure that during the installation you tick `Add Python to PATH`, and ensure that you enable `tcl/tk and IDLE`.

Ensure that `py -0p` lists 3.9 and 3.10 before proceeding.

### Installation

1. Download the scripts `setup_39.bat` and `setup_310.bat`. Find a folder where you would like to keep your Python installations for this course. Create two folders within it, `39` and `310`. Move `setup_39.bat` to `39` and `setup_310` to `310`. Within each folder, create a subfolder called `wheels`.
2. Go to [https://www.lfd.uci.edu/~gohlke/pythonlibs/](https://www.lfd.uci.edu/~gohlke/pythonlibs/) and download the following files. **Ensure that you get the exact filenames below. I would recommend using Ctrl+F to find the right files.**
    - For 3.9:
      - `numpy‑1.22.4+mkl‑cp39‑cp39‑win_amd64.whl`
      - `SciPy‑1.8.1‑cp39‑cp39‑win_amd64.whl`
      - `slycot‑0.4.0‑cp39‑cp39‑win_amd64.whl`
    - For 3.10:
      - `numpy‑1.22.4+mkl‑cp310‑cp310‑win_amd64.whl`
      - `SciPy‑1.8.1‑cp310‑cp310‑win_amd64.whl`
      - `slycot‑0.4.0‑cp310‑cp310‑win_amd64.whl`
3. Move the 3.9 wheels into `39\wheels\` and the 3.10 wheels into `310\wheels\`.
4. Run or double click `setup_39.bat` which will create a new virtual environment and install the appropriate packages into it. Similarly, run `setup_310.bat` to do the same for 3.10. If any problems occur during the installation, an error message will be raised specifying what went wrong.

### Usage

Open `39` as a folder within VS Code, and select the Python interpreter located at `.\venv\scripts\python.exe`. The same goes for `310`.

Use the `39` installation for any code that requires `PyDSTool` (i.e., the fridge example). Use `3.10` for all other code.

Ensure that the virtual environments are properly activated when launching VS Code, and that you are not using the default Code Runner Python executor `python -u`.

## Method 2: The thorough way

TODO: write.
