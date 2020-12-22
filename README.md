[![Build Status](https://travis-ci.org/essembeh/python-helloworld.svg?branch=master)](https://travis-ci.org/essembeh/python-helloworld)
![Github](https://img.shields.io/github/tag/essembeh/python-helloworld.svg)
![PyPi](https://img.shields.io/pypi/v/python-helloworld.svg)
![Python](https://img.shields.io/pypi/pyversions/python-helloworld.svg)


# helloworld

This is just a sample helloworld project which aims to provide some good (at least not so bad) praticies to start a new project.

Basically, you can clone this repository and run `sed -i 's/helloworld/YOURPROJECTNAME/g'` ;)


# Install

Install the latest release from [PyPI](https://pypi.org/python-helloworld)
```sh
$ pip3 install --user -U python-helloworld
$ helloworld --help
```

Install the latest version from the sources:

> This project uses [Poetry](https://python-poetry.org), ensure you have *Poetry* installed

```sh
$ pip3 install --user -U poetry
$ pip3 install --user git+https://github.com/essembeh/python-helloworld
$ helloworld --help
```

Install from the source
Clone the project
```sh
# ensure you have poetry installed
$ pip3 install --user -U poetry

# clone the repository
$ git clone https://github.com/essembeh/python-helloworld
$ cd python-helloworld

# create the virtualenv
$ poetry install

# run the app
$ poetry run helloworld --help
# or
$ poetry shell
(.venv) $ helloworld --help

# to run the tests:
$ poetry run pytest tests
# to get the coverage
$ poetry run pytest --cov=helloworld tests 
```

# Tools

[Poetry](https://python-poetry.org), a very useful tool to avoid boilerplate code (`setup.py`, `requirements.txt`, `requirements-dev.txt` ...)

[VSCodium](https://github.com/VSCodium/vscodium): a light IDE editor supporting Python with an extension.
Some workspace settings in `.vscode/settings.json` are configured for example to work with the *virtual environment*.

[Pylint](https://www.pylint.org/): to report many warnings/errors (and VSCodium is configured to show them).

[Black](https://pypi.org/project/black/): a strict code formatter that automatically format source code on save using *VSCodium*.

