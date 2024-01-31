mkdir services
cd services

echo -e "\e[32mClone Repositories ... \e[39m"
git clone https://github.com/in-RET/in.RET-EnSys-open-plan-GUI.git "gui"
git clone https://github.com/in-RET/inretensys-fastapi.git "fastapi"
git clone https://github.com/in-RET/inretensys-backend.git "backend"

echo -e "\e[32mChange folder to backend ... \e[39m"
cd backend

# create environment
echo -e "\e[32mCreate virtual environment and build wheel-file ... \e[39m"
python3 -m venv venv
source venv/bin/activate

# install requirements
pip install -r requirements.txt
pip install build wheel

# Build wheel package
python -m build --wheel

deactivate

echo -e "\e[32mBuild docker images ... \e[39m"
chmod+x build.sh
bash build.sh

cd ..

echo -e "\e[32mCopy generated wheel-file ... \e[39m"
cp backend/dist/InRetEnsys-*.whl fastapi/requirements
cp backend/dist/InRetEnsys-*.whl gui/app/requirements

