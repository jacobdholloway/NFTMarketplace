# Setting Up Your Python Virtual Environment

## Prerequisites

- Ensure Python is installed:
    ```bash
    python --version
    ```

- Ensure ability to create virtual environments:
    ```bash
    sudo apt install python3.10-venv
    ```

## Creating a Virtual Environment

- Create a new virtual environment:
    ```bash
    python3 -m venv </path/to/virtual/environment>
    ```

## Activating the Virtual Environment

- Navigate to your virtual environment directory.
- Activate the virtual environment:
    ```bash
    source bin/activate
    ```
    If it says that it could not locate the file, you may not be in the correct directory. If successful, the name of the virtual environment will appear on the left of your terminal.
    Or there is like somewhere that shows you are working in a virtual environment.

## Installing Dependencies

- Ensure your `requirements.txt` file is in the current directory.
- Install the required packages:
    ```bash
    pip3 install -r requirements.txt
    ```

For this project I will not be adding the pythonvirtual environment. I will only add the requirements file inside of the github directory so that you can install what is needed but this is under the assumption that you do not want a python virtual environment in the folder. 
