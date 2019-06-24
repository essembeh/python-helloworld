# helloworld

This is just a sample helloworld project which aims to provide some good (at least not so bad) praticies to start a new project.

Basically, you can clone this repository and run `sed -i 's/helloworld/YOURPROJECTNAME/g'` ;)

## Setup a development environment

If you target a python version which is not bundled by your distribution (for example, I want to use python 3.7 and I'm working on Debian9 which bundles python 3.5), you can install the needed python from the source with `make devenv`. Then we need to create a *virtualenv* with the needed libraries from `requirements.txt` with `make venv`.


```sh
$ make devenv
$ ./devenv/bin/python3 --version
Python 3.7.3
$ make venv
$ source venv/bin/activate
(venv) $ which python
$PWD/venv/bin/python
$ python --version
Python 3.7.3
```

The `make devenv` command will simply call the `tools/python-install.sh` script that will:
- download the source from [Python.org](https://python.org)
- Install needed *apt* packages to compile python
- Compile python and install in the workspace

This script can be used to install multiple versions of python in the `devenv/` folder to use [Tox](https://tox.readthedocs.io/en/latest/)


## Coding and testing

[VSCodium](https://github.com/VSCodium/vscodium) is a good editor and the Python support is pretty nice. 
Some workspace settings in `.vscode/settings.json` are configured for example to work with the *virtual environment*.

[Flake8](https://pypi.org/project/flake8/) is configured with some plugins to report many warnings/errors (and VSCodium is configured to show them).

[Black](https://pypi.org/project/black/) code formatter will automatically format source code on save using *VSCodium*.


Some usefull `make` targets:
- The `make install` command will install the project in the *virtualenv*.
- The `make watch` will automatically install the project when the source code changes (you need to install `rerun`).
- To run the tests, use `make test` which generated a *junit-like* report.
- *Coverage* and *Flake8* reports are generated with `make coverage` and `make flake8`
- The `make all` target will run the unit tests and generate a *Coverage* report and a *Flake8* report.
- Finally the `make publish` will build and publish the project on [PyPI](https://pypi.org/).
