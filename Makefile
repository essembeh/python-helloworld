.PHONY: build install build publish publish-test docker-image docker-test

all: build

venv: requirements.txt requirements-dev.txt 
	python3 -m virtualenv -p python3 venv --no-site-packages
	./venv/bin/pip install -r requirements.txt
	./venv/bin/pip install -r requirements-dev.txt
	touch venv

install:
	test -n "$(VIRTUAL_ENV)"
	pip install -e .

build: venv
	test -n "$(VIRTUAL_ENV)"
	rm -rf dist/
	python3 setup.py sdist bdist_wheel

publish: build
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*

publish-test: build
	twine upload --repository-url https://upload.pypi.org/legacy/ dist/*
	

docker-image:
	docker build \
		--build-arg APT_EXTRA_PACKAGES="" \
		-t essembeh/multipy:latest \
		https://github.com/essembeh/multipy.git

docker-test:
	docker run \
		--rm \
		-it \
		--volume $(PWD):/src:ro \
		-e GIT_CLEAN=1 \
		-e TOXENV -e TOX_SKIP_ENV \
		essembeh/multipy:latest -- -x
