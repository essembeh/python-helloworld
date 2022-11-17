"""
Test command line usage
"""
import shlex
from re import fullmatch
from typing import List, Tuple
from unittest import mock

import pytest

from helloworld import __name__ as prog
from helloworld import cli


def run(capsys, args: str) -> Tuple[int, List[str], List[str]]:
    """
    Simulate a call to the command line tool by mocking arguments
    """
    with pytest.raises(SystemExit) as error:
        with mock.patch("sys.argv", [prog] + shlex.split(args)):
            cli.run()
    captured = capsys.readouterr()
    return (
        error.value.code,
        captured.out.splitlines(),
        captured.err.splitlines(),
    )  # pyright: reportGeneralTypeIssues=false


def test_help(capsys):
    """
    Check --version output
    """
    rc, stdout, stderr = run(capsys, "--help")
    assert rc == 0
    assert len(stdout) > 0
    assert prog in stdout[0]
    assert len(stderr) == 0


def test_hello(capsys):
    """
    Check usage with 2 arguments
    """
    rc, stdout, stderr = run(capsys, "foo bar")
    assert rc == 0
    assert len(stdout) == 2
    assert fullmatch(r"Hello .*foo.*", stdout[0])
    assert fullmatch(r"Hello .*bar.*", stdout[1])
    assert len(stderr) == 0
