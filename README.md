![Github](https://img.shields.io/github/tag/essembeh/python-helloworld.svg)
![PyPi](https://img.shields.io/pypi/v/helloworld.svg)
![Python](https://img.shields.io/pypi/pyversions/python-helloworld.svg)
![CI](https://github.com/essembeh/python-helloworld/actions/workflows/poetry.yml/badge.svg)

> Note: some badges above might not work unless you use CI (Github or Gitlab) and publish your app on Pypi

# helloworld

This is just a sample helloworld project which aims to provide some good (at least not so bad) praticies to start a new project.

Basically, you can clone this repository and run `sed -i 's/helloworld/YOURPROJECTNAME/g'` ;)

# Typical workflow

> This project uses [Poetry](https://python-poetry.org), ensure you have _Poetry_ installed

```sh
$ pip3 install poetry

$ poetry --version
Poetry version 1.1.12

```

## Clone the project

To clone the project

```sh
$ git clone https://github.com/essembeh/python-helloworld
$ cd python-helloworld
```

To create the _virtual env_ with all needed dependencies

```sh
$ poetry install
$ poetry shell
(.venv) $ helloworld --help
```

## Run the tests

To run the tests

```sh
# to run the tests:
$ poetry run pytest
# to get the coverage
$ poetry run pytest
```

## Build your app

You can use _Poetry_ to build your app and get a `.whl`

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

You can use _Poetry_ to publish your app to [PyPI](https://pypi.org)

```sh
$ poetry publish
```

By default, _Github Actions_ are configured to

- build your app and run your unit tests with coverage on every push
- build the wheel package and upload it to Pypi on every tag

> Note: to allow Github CI to publish on PyPI, you need to [create a token](https://pypi.org/manage/account/token/) and add it to [your project settings](https://github.com/essembeh/python-helloworld/settings/secrets/actions), the name of the token should be `PYPI_TOKEN`

I personnally use this command to bump the version using poetry, create the associated git tag and push to Github:

```sh
# for a patch bump
$ poetry version patch && git commit -a -m '🔖 New release' && git tag -f $(poetry version -s) && git push --tags
# for a minor bump
$ poetry version minor && git commit -a -m '🔖 New release' && git tag -f $(poetry version -s) && git push --tags
# for a major bump
$ poetry version major && git commit -a -m '🔖 New release' && git tag -f $(poetry version -s) && git push --tags
```

## Install the app

Install from the sources

```sh
$ pip3 install poetry
$ pip3 install git+https://github.com/essembeh/python-helloworld
$ helloworld --help
```

Install the latest release from [PyPI](https://pypi.org/python-helloworld)

```sh
$ pip3 install python-helloworld
$ helloworld --help
```

# Tools

[Poetry](https://python-poetry.org), a very useful tool to avoid boilerplate code (`setup.py`, `requirements.txt`, `requirements-dev.txt` ...)

[VSCodium](https://github.com/VSCodium/vscodium): a light IDE editor supporting Python with an extension.
Some workspace settings in `.vscode/settings.json` are configured for example to work with the _virtual environment_.

[Pylint](https://www.pylint.org/): to report many warnings/errors (and VSCodium is configured to show them).

[Black](https://pypi.org/project/black/): a strict code formatter that automatically format source code on save using _VSCodium_.

[Gitmoji](https://gitmoji.dev/): a list of emoji to get a more efficient history
