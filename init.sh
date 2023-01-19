
echo -e "\e[32mClone Repositories ... \e[39m"
git clone --branch feature_fastapi_anbindung https://github.com/in-RET/in.RET-EnSys-open-plan-GUI.git "inretensys-gui"
git clone https://github.com/in-RET/inretensys-fastapi.git
git clone https://github.com/in-RET/inretensys-backend.git

echo -e "\e[32mChange folder to backend ... \e[39m"
cd inretensys-backend

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
cd ..

echo -e "\e[32mCopy generated wheel-file ... \e[39m"
cp inretensys-backend/dist/InRetEnsys-0.2a4-py3-none-any.whl inretensys-fastapi/
cp inretensys-backend/dist/InRetEnsys-0.2a4-py3-none-any.whl inretensys-gui/app/