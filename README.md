# in.RET-Ensys Common
This repository contains a variety of scripts to start the whole Project "in.RET-Ensys".


## Installation
First of all clone this repository in a local directory. After this you will find a bash-script "init.sh" which clones all other dependable repositories automatically.

Another softwarepackage which you will need to install is **Docker** and **Docker Compose**. Installationguides for this are widly available on the internet.

## Configuration
Last steps before you can start the package.

### Get a gurobi license
This package is actual optimised for the use with the Gurobi-Solver.

### Set environmental variables and customize docker-compose.yml
Navigate to the folder "inretensys-fastapi" and open the file ".env".
There are 2 pathes given, one to point at your local license file from gurobi and a second to specify your local storage directory.

The next step is to customize the **docker-compose.yml**.
The Service "fastapi" has a volume pointed to "<local_storage_dir>:/app/working" which must be set to the variable from above, "LOCAL_STORAGE_DIR".

## Start & Stop
Navigate to the root folder of this repository and start the software with the command
```bash
docker compose up
```

To stop all services use
```bash
docker compose down
```

## Upgrade of the dependable repositories
As simple as possible. Execute the "upgrade.sh" script on your linux machine and all repositories will be updated.

**Attention: If you locally changed some files, which are not configuration files DO NOT commit any changes!**

