#!/ usr / bin / env python3
"""Download and setup problems from Competitive Companion
Usage:
  parse_and_test.py --echo
  parse_and_test.py [<name>... | -n <number> | -b <batches> | --second <second>] [--dryrun] [-m|-t]
  parse_and_test.py [-c]

Options:
  -h --help                     Show this screen.
  --echo                        Just echo received responses and exit.
  --dryrun                      Don't actually create any problems
  -t , --test                   Test solution.
  -c , --clean                  Clean sample input and output.
  -m , --make_problem           Make problem folder only.

Download limit options:
  -n COUNT, --number COUNT      Number of problems.
  -b COUNT, --batches COUNT     Number of batches. (Default 1 batch)
  -s SECOND, --second SECOND    Timeout for listening to problems. in seconds

"""

from docopt import docopt

import sys
import http.server
import json
from pathlib import Path
import subprocess
import re
import colorama
from colorama import Fore
import os
import shutil

# Returns unmarshalled or None
root_name = "PROBLEM_NAME"
lang = "Cpp"


def listen_once(*, second=None):
    json_data = None

    class CompetitiveCompanionHandler(http.server.BaseHTTPRequestHandler):
        def do_POST(self):
            nonlocal json_data
            json_data = json.load(self.rfile)

    with http.server.HTTPServer(
        ("127.0.0.1", 12345), CompetitiveCompanionHandler
    ) as server:
        server.second = second
        server.handle_request()

    if json_data is not None:
        print(f"Got data {json.dumps(json_data)}")
    else:
        print("Got no data")
    return json_data


def listen_many(*, num_items=None, num_batches=None, second=None):
    if num_items is not None:
        res = []
        for _ in range(num_items):
            cur = listen_once(second=None)
            res.append(cur)
        return res

    if num_batches is not None:
        res = []

        batches = {}
        while len(batches) < num_batches or any(need for need, tot in batches.values()):
            print(f"Waiting for {num_batches} batches:", batches)
            cur = listen_once(second=None)
            res.append(cur)

            cur_batch = cur["batch"]
            batch_id = cur_batch["id"]
            batch_cnt = cur_batch["size"]
            if batch_id not in batches:
                batches[batch_id] = [batch_cnt, batch_cnt]
            assert batches[batch_id][0] > 0
            batches[batch_id][0] -= 1

        return res

    res = [listen_once(second=None)]
    while True:
        cnd = listen_once(second=second)
        if cnd is None:
            break
        res.append(cnd)
    return res


NAME_PATTERN = re.compile(r"^(?:Problem )?([A-Z][0-9]*)\b")


def get_prob_name(data):
    if "USACO" in data["group"]:
        if "fileName" in data["input"]:
            names = [
                data["input"]["fileName"].rstrip(".in"),
                data["output"]["fileName"].rstrip(".out"),
            ]
            if len(set(names)) == 1:
                return names[0]

    if "url" in data and data["url"].startswith("https://www.codechef.com"):
        return data["url"].rstrip("/").rsplit("/")[-1]

    patternMatch = NAME_PATTERN.search(data["name"])
    if patternMatch is not None:
        return patternMatch.group(1)

    print(f"For data: {json.dumps(data, indent=2)}")
    return input("What name to give? ")


def save_samples(data, prob_dir):
    with open(prob_dir / "problem.json", "w") as f:
        json.dump(data, f)

    for i, t in enumerate(data["tests"], start=1):
        with open(prob_dir / f"sample{i}.in", "w") as f:
            f.write(t["input"])
        with open(prob_dir / f"sample{i}.out", "w") as f:
            f.write(t["output"])


# Providing name = '.'
def make_prob(data, name=None):
    global root_name
    global lang
    if name is None:
        name = get_prob_name(data)
        if data is None:
            print("Unexpected error...")
            return

    prob_dir = Path(".") / name

    if root_name == "PROBLEM_NAME" and name is not None:
        root_name = name
    if name == ".":
        print("Using current directory...")
        pass
    elif prob_dir.exists() and prob_dir.is_dir():
        # Skip making it
        print(f"Already created problem {name}...")
    else:
        print(f"Choosen language: {lang}")
        print(f"Creating problem {name}...")

        MAKE_PROB = Path(sys.path[0]) / "make_problem.sh"
        try:
            subprocess.check_call(
                [MAKE_PROB, name, root_name,
                    lang], stdout=sys.stdout, stderr=sys.stderr
            )
        except subprocess.CalledProcessError as e:
            print(f"Got error {e}")
            return

    if data != None:
        print("Saving samples...")
        save_samples(data, prob_dir)


def run_prob(names):
    RUN_PROB = "run_problem.sh"
    EXECUTE_FILE = "PROBLEM_NAME"
    # if names is None:
    # for file in os.listdir("./"):
    #     if file.endswith(".cpp"):
    #         EXECUTE_FILE = os.path.splitext(file)[0]
    # else:
    for name in names:
        EXECUTE_FILE = name.split(".")[0]
    # EXECUTE_FILE = "build/" + EXECUTE_FILE
    print(EXECUTE_FILE)
    try:
        subprocess.check_call(
            [RUN_PROB, EXECUTE_FILE], stdout=sys.stdout, stderr=sys.stderr
        )
    except subprocess.CalledProcessError as e:
        print(f"Got error {e}")
        return


def create_project():
    # config for vscode
    if (Path(".") / ".vscode").exists():
        print("Exists folder .vscode")
    else:
        shutil.copytree(Path.home() / "Setup_CP/.template/.vscode", ".vscode")
        print("Create vscode config")


def main():
    global lang
    arguments = docopt(__doc__)

    if arguments["--echo"]:
        while True:
            print(listen_once())
    elif arguments["--clean"]:
        for filename in os.listdir("./"):
            if (
                filename.endswith(".in")
                or filename.endswith(".out")
                or filename.endswith(".res")
            ):
                os.remove(filename)
        print("Done clean all")
    else:
        dryrun = arguments["--dryrun"]
        make_prob_only = arguments["--make_problem"]
        test_problem = arguments["--test"]

        lang = input(
            "Enter the language (cpp: default, java): ") or "cpp"

        def run_make_prob(*args, **kwargs):
            nonlocal dryrun
            if dryrun:
                print(f"make_prob(*args={args}, **kwargs={kwargs})")
                return
            make_prob(*args, **kwargs)

        if names := arguments["<name>"]:
            # root_name = names[0]
            if test_problem:
                run_prob(names)
            elif not make_prob_only:
                create_project()
                datas = listen_many(num_items=len(names))
                for data, name in zip(datas, names):
                    run_make_prob(data, name)
            else:
                create_project()
                for name in names:
                    run_make_prob(None, name)
        elif cnt := arguments["--number"]:
            create_project()
            cnt = int(cnt)
            datas = listen_many(num_items=cnt)
            for data in datas:
                run_make_prob(data)
        elif batches := arguments["--batches"]:
            batches = int(batches)
            datas = listen_many(num_batches=batches)
            for data in datas:
                run_make_prob(data)
        elif second := arguments["--second"]:
            second = float(second)
            datas = listen_many(second=second)
            for data in datas:
                run_make_prob(data)
        # elif names := arguments["--make_problem"]:
        #     for name in names:
        #         run_make_prob(None, name)
        else:
            datas = listen_many(num_batches=1)
            for data in datas:
                run_make_prob(data)


if __name__ == "__main__":
    main()
