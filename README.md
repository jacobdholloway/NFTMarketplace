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
  `bash
    pip3 install -r requirements.txt
    sudo npm install -g truffle
    `
  For this project I will not be adding the pythonvirtual environment. I will only add the requirements file inside of the github directory so that you can install what is needed but this is under the assumption that you do not want a python virtual environment in the folder.

## Verification of Installed Dependencies

- After installing dependencies, one should verify that they installed correctly. This can be accomplished by checking the version numbers.

  ```bash
  jupyter --version
  python -c "import psycopg2; print(psycopg2.__version__)"
  python -m django --version
  django-admin --version
  python -c "import crispy_forms; print(crispy_forms.__version__)"
  python -c "import django_countries; print(django_countries.__version__)"
  python -c "import PIL; print(PIL.__version__)"
  brownie --version
  nodeenv --version
  node -v
  npm -v
  truffle version
  ```

## Running Server

- Included is now Django-Admin which allows you to locally run the server and make migrations for changes that you are making.

There is now a folder called marketPlace that is housing the Django project so make sure you navigate to the project folder which should be in NFTMarketplace/marketPlace

- to start it run:

```bash
python manage.py migrate

```

This will apply the server migrations and then you should get an okay.

After that run

```bash

python manage.py runserver
```

This starts a webserver at the default port 8000 and can be viewed by going to a web browser and typing
This can definitely be configured but my goal is just making sure that it works in the first place.

```html
'http://127.0.0.1:8000'
```

To view the login page navigate to:

```html
'http://127.0.0.1:8000/login'
```

Start by clicking register which will redirect to signup
This will also allow for Django to save your information to login to the website.
Currently I have not added the ability to verify the passwords and login but that can definitely come later

For now if you want to go further and go to account overview then navigate to:

```html
'http://127.0.0.1:8000/homepage'
```

Inside of homepage are buttons that direct to Purchase, Sell, and View.

All of this is handled inside of the Django model as it provides a way to handle the web routing and what not

Inside of 'marketPlace/marketPlace' there is a static folder that allows you to add things that you would like if you want to build extra into the webpages and what not.
I have been googling a lot of Django things and am not too familiar with the whole web design thing so this is working as a bare bones with some extra steps.

Each topic is listed below.

Purchase:

Used to execute transactions using a smart contract. You should be able to get the NFT you want to purchase from marketplace

Sell:

Allows you to view and sell the NFTS along with listing them on the site for a specific price.

View:

Allows you to view the marketplace and see what people are selling.
Within view you can get the artist and the price they are listing it for with an option to purchase next to it.

## NFT Project Folder

located in 'marketPlace/NFTProject' this is where all the truffle stuff is and how to interact with it.

Again not my expertese but it is very important.

For the contracts there is a folder named contracts which is needed by truffle to deploy and manage the contracts within a local network.

This is utilized for doing all of this local on your computer.
There are a large amount of security concerns that I have with attempting to _ACTUALLY_ deploy this onto a network connected chain and this is means of building this up so I can learn how to deploy and create NFTS

## Setup an account and link it to your account within the marketplace

To do this, again make sure that you have installed all the needed packages for working with Truffle and Ganache
and then using your console attempt to run truffle console by typing

also ensure that ganache is also running by typing

```bash
ganache-cli -p 7545 # This launches the Command Line interface. -p specfies the port and I think 7545 is the default.
```

```bash
truffle console --network development

```

Allows you to view the traffic and interact with truffle using the cli if needed.

if it does not work then run the following

```bash
npm uninstall -g truffle
npm install -g truffle@latest
```

```bash
npm uninstall -g ganache-cli
npm install -g ganache-cli@latest
```

This allows you to remove and reinstall the correct binaries based on your system

I am switching between WSL and Mac so I had to do this to make sure it was working correctly.

Installing NVM (Node Version Manager)

Installation Steps:

Using curl:

```bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

This command downloads and executes the nvm installation script.

Activate nvm:

To use nvm immediately after installing (without restarting the terminal), run:

```bash

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```

This sets up the environment for nvm by configuring the necessary paths and autocompletion.

Verify Installation:

Check that nvm was installed correctly:

```bash
nvm --version
```

This command should display the nvm version number.

Using NVM to Manage Node.js Versions:

- I ran into issues when initially running truffle on my mac so this should allow you to install a more stable version

Install a specific version of Node.js:

```bash

nvm install 16 #Installs Node.js version 16
```

Installs Node.js version 16

Switch to use a specific version of Node.js:

```bash

nvm use 16  # Switches to Node.js version 16
```
