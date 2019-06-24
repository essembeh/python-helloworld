from argparse import ONE_OR_MORE, ArgumentParser

from helloworld.core import User


def main():
    parser = ArgumentParser(prog="helloworld", description="Simple hello world python sample")
    parser.add_argument(dest="users", nargs=ONE_OR_MORE, type=User, help="your name")
    args = parser.parse_args()
    for user in args.users:
        print("Hello {u.name}!".format(u=user))


if __name__ == "__main__":
    main()
