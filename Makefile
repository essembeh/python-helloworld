.PHONY: build install build publish publish-test clean test docker-image docker-test

all: build

clean:
	rm -vfr dist/ build/

venv: requirements.txt requirements-dev.txt 
	test -d venv || virtualenv -p python3 venv --no-site-packages
	bash -c "source venv/bin/activate && \
		pip install -r requirements.txt -r requirements-dev.txt"
	touch venv

install: venv
	bash -c "source venv/bin/activate && \
		pip install -e ."

test: venv
	bash -c "source venv/bin/activate && \
		tox"

build: clean test
	bash -c "source venv/bin/activate && \
		python3 setup.py sdist bdist_wheel"

publish-test: build
	bash -c "source venv/bin/activate && \
		twine upload --repository-url https://test.pypi.org/legacy/ dist/*"

publish: build
	bash -c "source venv/bin/activate && \
		twine upload --repository-url https://upload.pypi.org/legacy/ dist/*"

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
