![Github](https://img.shields.io/github/tag/essembeh/python-helloworld.svg)
![PyPi](https://img.shields.io/pypi/v/helloworld.svg)
![Python](https://img.shields.io/pypi/pyversions/python-helloworld.svg)
![CI](https://github.com/essembeh/python-helloworld/actions/workflows/poetry.yml/badge.svg)

> Note: some badges above might not work unless you use CI (Github or Gitlab) and publish your app on Pypi

# Introduction

This is just a sample _helloworld_ project which aims to provide some good (at least not so bad) praticies to start a new project.

Basically, you can clone this repository and run `sed -i 's/helloworld/YOURPROJECTNAME/g'` ;)

# Tools

There are multiple good Python IDE, but I'm would suggest using [vscodium](https://vscodium.com/) with at least these plugins:

- [Python](https://open-vsx.org/extension/ms-python/python) to add _python_ language support
- [Pyright](https://open-vsx.org/extension/ms-pyright/pyright) for better python programming
- [isort](https://open-vsx.org/extension/ms-python/isort) combined with [black](https://github.com/psf/black), your code will always be perfectly formatted
- [better-toml](https://open-vsx.org/extension/bungcip/better-toml) for a better _TOML_ file support (and poetry configuration file is a _toml_ file)

[Black](https://pypi.org/project/black/) is a strict code formatter that automatically format source code on save using _VSCodium_.

In the past years, I found [Gitmoji](https://gitmoji.dev/) quite useful to get a more efficient Git history.

[Poetry](https://python-poetry.org) is _THE PERFECT SOLUTION_ to avoid dealing with `setup.py`, `setup.cfg`, `requirements.txt`, `requirements-dev.txt` ... You will handle all common tasks easily:

- `poetry add` to add a new dependencies
- `poetry install` to create a _virtualenv_ with all needed libraries to run your app
- `poetry shell` to enter your _virtualenv_ and run your app or tests
- `poetry build` to create a distributable binary package of your app

# Start your new project

One way to start a project a new Python project is to clone this repository, rename some files and folders and init a new `.git` repository.

## Clone the project

```sh
$ git clone https://github.com/essembeh/python-helloworld cool-project
$ cd cool-project
```

## Rename your main python module (the folder that contains the source code)

```sh
$ mv helloworld cool_project
```

> Note: python modules cannot contain _dash_, you have to replace `-` with `_`

## Update the project metadata

Edit `pyproject.toml` and change the following lines:

- `name` with your project name (which can contain dash)
- `description` with a better description
- `homepage` to point to the homepage of your project
- `authors` with your name
- `classifiers` if you want to publish your project, it might be useful to add/remove some [classifiers](https://pypi.org/classifiers/)

## Configure the entrypoint(s)

The `pyproject.toml` file can also contains the _entrypoints_ of your project, which are the new commands you want to get when you install your project.

```toml
[tool.poetry.scripts]
cool-command = 'cool_project.cli:run'
```

Here, I declared a `cool-command` that runs the function `def run():` from my `cli.py` file in my `cool_project` module.

> Note: If you develop a library or you don't have any entrypoint, you should remove the `[tool.poetry.scripts]` section.

## Setup a new Git repository

You can remove the `.git` folder that contains the history of this _helloworld_ project, and initialize a new one

```sh
$ rm -rf .git
$ git init .

# you  can also commit your first version
$ git add .
$ git commit -m "🚀 First release"
```

## Run the tests

To run the tests, you need to be in the _virtualenv_

```sh
# init your virtualenv if it is not
$ poetry install

# enter your virtualenv
$ poetry shell

# note that your shell prompt is updated once you are in a virtualenv
(helloworld-py3.10) $ pytest
====================================== test session starts ======================================
platform linux -- Python 3.10.13, pytest-7.2.0, pluggy-1.0.0
rootdir: /home/seb/cool-project
plugins: dotenv-0.5.2, cov-4.0.0
collected 3 items

tests/test_cli.py ...                                                                     [ 66%]
tests/test_user.py .                                                                      [100%]

======================================= 3 passed in 0.07s =======================================
```

## Build your app

You can use _Poetry_ to build your app and get a `.whl`

```sh
$ poetry build
Building cool-project (0.1.0)
  - Building sdist
  - Built cool_project-0.1.0.tar.gz
  - Building wheel
  - Built cool_project-0.1.0-py3-none-any.whl

$ ls -l dist
total 20
-rw-r--r-- 1 seb users 8569 17 oct.  11:12 cool_project-0.1.0-py3-none-any.whl
-rw-r--r-- 1 seb users 7484 17 oct.  11:12 cool_project-0.1.0.tar.gz
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

## How to install your app

Install from the sources

```sh
$ pip3 install poetry
$ pip3 install git+https://github.com/jdoe/cool-project
$ cool-command --help
```

Install from [PyPI](https://pypi.org/) if you published it

```sh
$ pip3 install cool-project
$ cool-command --help
```
