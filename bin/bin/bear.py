#!/usr/bin/env python3
from argparse import ArgumentParser, Namespace
from urllib.parse import urlencode
from http.client import HTTPConnection


parser = ArgumentParser(
    prog="BearCLI", description="Quick CLI to interface with Bear Notes"
)


subparsers = parser.add_subparsers(required=True)

parser_create = subparsers.add_parser("create", help="create help")
parser_create.add_argument("--text", "-t", required=True, type=str, help="Body text")
parser_create.add_argument("--title", "-i", type=str, help="Header")
parser_create.add_argument("--tags", "-g", type=str, help="Comma separated tags")
parser_create.add_argument(
    "--show",
    "-w",
    type=str,
    default="no",
    choices=["no", "yes"],
    help="Optionally open Bear on create",
)


def create(args: Namespace) -> None:
    params = urlencode(
        {
            "text": args.text,
            "title": args.title,
            "tags": args.tags,
            "show": args.show,
        }
    )

    print(r1.status)


def main():
    args = parser.parse_args()

    args.func(args)


if __name__ == "__main__":
    main()
