echo -e "\e[32mUpgrade Backend ... \e[39m"
cd services

cd backend
git pull

echo -e "\e[32mRebuild python wheel ... \e[39m"
source venv/bin/activate
python -m build --wheel
deactivate

echo -e "\e[32mRebuild docker images ... \e[39m"
bash build.sh

cd ..

echo -e "\e[32mCopy generated wheel-file ... \e[39m"
cp backend/dist/InRetEnsys-0.2a5-py3-none-any.whl fastapi/requirements
cp backend/dist/InRetEnsys-0.2a5-py3-none-any.whl gui/app/requirements

echo -e "\e[32mUpgrade GUI ... \e[39m"
cd gui
git pull

echo -e "\e[32mUpgrade FastAPI ... \e[39m"
cd ../fastapi
git pull
