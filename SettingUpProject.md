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

## Installing Dependencies

- Ensure your `requirements.txt` file is in the current directory.
- Install the required packages:
    ```bash
    pip3 install -r requirements.txt
    ```