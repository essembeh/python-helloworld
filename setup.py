#!/usr/bin/env python3

from setuptools import setup


def readfile(file):
    with open(file) as f:
        return f.read()


setup(
    name="helloworld",
    license="Apache License 2.0",
    author="Sébastien MB",
    author_email="seb@essembeh.org",
    description="Simple python3 hello world",
    long_description=readfile("README.md"),
    long_description_content_type="text/markdown",
    use_scm_version={"version_scheme": "post-release"},
    setup_requires=["setuptools_scm"],
    package_dir={"": "src"},
    packages=["helloworld"],
    entry_points={"console_scripts": ["helloworld = helloworld.__main__:main"]},
    classifiers=[
        "Development Status :: 4 - Beta",
        "Topic :: Utilities",
        "License :: OSI Approved :: Apache Software License",
        "Programming Language :: Python :: 3.4",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
    ],
)
