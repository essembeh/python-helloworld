PYTHON_VERSION := 3.7.3

.PHONY: install watch publish clean test coverage flake8

all: clean test coverage flake8

devenv: 
	./tools/python-install.sh install $(PYTHON_VERSION) devenv/

venv: requirements.txt
	virtualenv -p devenv/bin/python3 venv --no-site-packages
	./venv/bin/pip install -r requirements.txt
	touch venv

clean:
	rm -rf flake-report coverage-report .coverage tests.xml

flake8:
	flake8 src/

coverage:
	pytest --cov=helloworld src/
	coverage html --directory=coverage-report
	coverage report

tests: 
	pytest --junitxml=tests.xml src/

install:
	test -n "$(VIRTUAL_ENV)"
	python3 setup.py install
	#python3 setup.py install_data

watch:
	test -n "$(VIRTUAL_ENV)"
	rerun  -d src -p "*.py" -x "make install >/dev/null 2>&1"

publish:
	test -n "$(VIRTUAL_ENV)"
	python3 setup.py sdist bdist_wheel
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*
