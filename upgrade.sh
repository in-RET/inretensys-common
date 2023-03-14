echo -e "\e[32mUpgrade Backend ... \e[39m"
cd inretensys-backend
git pull

echo -e "\e[32mRebuild python wheel ... \e[39m"
source venv/bin/activate
python -m build --wheel
deactivate

echo -e "\e[32mRebuild docker images ... \e[39m"
bash build.sh

cd ..

echo -e "\e[32mCopy generated wheel-file ... \e[39m"
cp inretensys-backend/dist/InRetEnsys-0.2a4-py3-none-any.whl inretensys-fastapi/
cp inretensys-backend/dist/InRetEnsys-0.2a4-py3-none-any.whl inretensys-gui/app/

echo -e "\e[32mUpgrade GUI ... \e[39m"
cd inretensys-gui
git pull

echo -e "\e[32mUpgrade FastAPI ... \e[39m"
cd ../inretensys-fastapi
git pull
