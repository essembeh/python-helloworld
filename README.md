[![Build Status](https://travis-ci.org/essembeh/python-helloworld.svg?branch=master)](https://travis-ci.org/essembeh/python-helloworld)
![Github](https://img.shields.io/github/tag/essembeh/python-helloworld.svg)
![PyPi](https://img.shields.io/pypi/v/python-helloworld.svg)
![Python](https://img.shields.io/pypi/pyversions/python-helloworld.svg)

> Note: some badges above might not work unless you use Travis and publish your app on Pypi


# helloworld

This is just a sample helloworld project which aims to provide some good (at least not so bad) praticies to start a new project.

Basically, you can clone this repository and run `sed -i 's/helloworld/YOURPROJECTNAME/g'` ;)


# Typical workflow

> This project uses [Poetry](https://python-poetry.org), ensure you have *Poetry* installed

```sh
$ pip3 install --user --upgrade poetry

$ poetry --version
Poetry version 1.1.12

```

## Clone the project

To clone the project
```sh
$ git clone https://github.com/essembeh/python-helloworld
$ cd python-helloworld
```

To create the *virtual env* with all needed dependencies
```sh
$ poetry install
$ poetry shell
(.venv) $ helloworld --help
```
## Run the tests

To run the tests
```sh
# to run the tests:
$ poetry run pytest tests
# to get the coverage
$ poetry run pytest --cov=helloworld tests 
```

## Build your app

You can use *Poetry* to build your app and get a `.whl`
```sh
$ poetry build
Building helloworld (0.1.0)
  - Building sdist
  - Built helloworld-0.1.0.tar.gz
  - Building wheel
  - Built helloworld-0.1.0-py3-none-any.whl

$ ls dist     
helloworld-0.1.0-py3-none-any.whl  helloworld-0.1.0.tar.gz
```

## Publish your app

You can use *Poetry* to publish your app to [PyPI](https://pypi.org)
```sh
$ poetry publish
```

## Install the app

Install from the sources
```sh
$ pip3 install --user --upgrade git+https://github.com/essembeh/python-helloworld
$ helloworld --help
```

Install the latest release from [PyPI](https://pypi.org/python-helloworld)
```sh
$ pip3 install --user -U python-helloworld
$ helloworld --help
```

# Tools

[Poetry](https://python-poetry.org), a very useful tool to avoid boilerplate code (`setup.py`, `requirements.txt`, `requirements-dev.txt` ...)

[VSCodium](https://github.com/VSCodium/vscodium): a light IDE editor supporting Python with an extension.
Some workspace settings in `.vscode/settings.json` are configured for example to work with the *virtual environment*.

[Pylint](https://www.pylint.org/): to report many warnings/errors (and VSCodium is configured to show them).

[Black](https://pypi.org/project/black/): a strict code formatter that automatically format source code on save using *VSCodium*.

