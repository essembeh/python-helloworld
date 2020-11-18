# helloworld

This is just a sample helloworld project which aims to provide some good (at least not so bad) praticies to start a new project.

Basically, you can clone this repository and run `sed -i 's/helloworld/YOURPROJECTNAME/g'` ;)


# Install

This project uses [Poetry](https://python-poetry.org), ensure you have *Poetry* installed

```sh
$ pip3 install --user -U poetry
```

Clone the project
```sh
$ git clone https://github.com/essembeh/python-helloworld
$ cd python-helloworld
```

To setup the *virtualenv*:
```sh
$ poetry install # to install app with dev dependencies
$ poetry install --no-dev # to install app without dev depdencies
$ poetry shell
(venv) $ helloworld --help
```

To run the app:
```sh
$ poetry run helloworld --help
```

To run the tests:
```sh
$ poetry run pytest tests
$ poetry run pytest --cov=helloworld tests # To get the coverage
```

## Tools

[Poetry](https://python-poetry.org), a very useful tool to avoid boilerplate code (`setup.py`, `requirements.txt`, `requirements-dev.txt` ...)

[VSCodium](https://github.com/VSCodium/vscodium): a light IDE editor supporting Python with an extension.
Some workspace settings in `.vscode/settings.json` are configured for example to work with the *virtual environment*.

[Pylint](https://www.pylint.org/): to report many warnings/errors (and VSCodium is configured to show them).

[Black](https://pypi.org/project/black/): a strict code formatter that automatically format source code on save using *VSCodium*.

