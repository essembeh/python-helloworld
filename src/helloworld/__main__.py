from argparse import ONE_OR_MORE, ArgumentParser

from pytput import strcolor

from helloworld import __description__, __title__, __version__
from helloworld.core import User


def main():
    parser = ArgumentParser(prog=__title__, description=__description__)
    parser.add_argument(
        "--version", action="version", version="version {0}".format(__version__)
    )
    parser.add_argument(dest="users", nargs=ONE_OR_MORE, type=User, help="your name")
    args = parser.parse_args()
    for user in args.users:
        print(strcolor("{'Hello':bold,yellow} {u.name:purple}!").format(u=user))
    return 0


if __name__ == "__main__":
    exit(main())
