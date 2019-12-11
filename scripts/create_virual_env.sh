#!/bin/sh

# """
# La función de este script es crear
# un ambiente virtual a partir del poetry.lock
# """

pyenv shell system
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
pyenv shell --unset

source $HOME/.poetry/env
poetry install -E doc