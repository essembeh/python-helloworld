# helloworld

This is just a sample helloworld project which aims to provide some good (at least not so bad) praticies to start a new project.

Basically, you can clone this repository and run `sed -i 's/helloworld/YOURPROJECTNAME/g'` ;)


# Install

Install latest version using pip
```sh
$ pip3 install --user git+https://github.com/essembeh/python-helloworld
```

Or setup a development environment
```sh
$ git clone https://github.com/essembeh/python-helloworld
$ cd python-helloworld
$ make venv
$ source venv/bin/activate
(venv) $ pip install -e .
```


## Coding and Testing

[VSCodium](https://github.com/VSCodium/vscodium) is a good editor and the Python support is pretty nice. 
Some workspace settings in `.vscode/settings.json` are configured for example to work with the *virtual environment*.

[Flake8](https://pypi.org/project/flake8/) is configured with some plugins (in `requirements-dev.txt`) to report many warnings/errors (and VSCodium is configured to show them).

[Black](https://pypi.org/project/black/) code formatter will automatically format source code on save using *VSCodium*.


Some usefull commands:
- `make venv` to create or update the virtualenv in the folder named `venv`
- `make install`, simple alias to `pip install -e .` to install your app in the virtualenv in development mode, ie: no need to reinstall when the code changes
- `pytest` to run the tests
- `tox` to run all the test with coverage and flake8 analysis
- `make docker-test` to run *tox* in a docker image containing all supported Python versions, see [multipy](https://github.com/essembeh/multipy)
- Finally the `make publish` (or `make publish-test`) to build and publish the project on [PyPI](https://pypi.org/).
