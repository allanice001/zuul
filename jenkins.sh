PYENV_HOME=$WORKSPACE/.pyenv/

# Delete previously built virtualenv
if [ -d $PYENV_HOME ]; then
    rm -rf $PYENV_HOME
fi

pip install --quiet --user nosexcover
pip install --quiet --user pylint
pip install --quiet --user tox
pip install --quiet --user -r $WORKSPACE/requirements.txt
pip install --quiet --user -r $WORKSPACE/test-requirements.txt
pip install --quiet --user $WORKSPACE/ # where your setup.py lives
python $WORKSPACE/setup.py testr --coverage
