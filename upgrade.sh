echo -e "\e[32mUpgrade Backend ... \e[39m"
cd inretensys-backend
git pull

echo -e "\e[32mUpgrade GUI ... \e[39m"
cd ../inretensys-gui
git pull

echo -e "\e[32mUpgrade FastAPI ... \e[39m"
cd ../inretensys-fastapi
git pull
