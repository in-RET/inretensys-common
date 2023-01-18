git clone https://github.com/in-RET/in.RET-EnSys-open-plan-GUI.git "inretensys-gui"
git clone https://github.com/in-RET/inretensys-fastapi.git
git clone https://github.com/in-RET/inretensys-backend.git

cd inretensys-backend

# create environment
python3 -m venv venv
source venv/bin/activate

# install requirements
pip install -r requirements.txt
pip install build wheel

# Build wheel package
python -m build --wheel

deactivate
cd ..

cp inretensys-backend/dist/InRetEnsys-0.2a4-py3-none-any.whl inretensys-fastapi/
cp inretensys-backend/dist/InRetEnsys-0.2a4-py3-none-any.whl inretensys-gui/app/