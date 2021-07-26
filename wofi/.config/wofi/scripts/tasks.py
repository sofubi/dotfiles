#!/usr/bin/env python3

import subprocess
import functools
import sys
from typing import Callable, Union

ACTIONS: list = [
        'Add A Task',
        'Edit A Task',
        'Delete A Task',
        'Get Task Info'
        ]

enter: str = '\n'

basic_proc: Callable = functools.partial(subprocess.Popen,
                               shell=True,
                               stdout=subprocess.PIPE)


def prompt() -> bytes:
    return enter.join(ACTIONS).encode('UTF-8')


def show_wofi_main(prompt: bytes) -> str:
    command = 'wofi -p "Select a Task Action: " -d -i --hide-scroll'

    process = basic_proc(command, stdin=subprocess.PIPE)

    return process.communicate(input=prompt)[0]


def show_wofi_action(action: str) -> str:
    action = action.strip()
    command = f'wofi -p "{action}: " -d -i --hide-scroll'

    process = basic_proc(command, stdin=subprocess.PIPE)

    return process.communicate()[0]


def select_action(selection: str) -> Union[Callable, None]:
    if selection == ACTIONS[0]:
        return create_task
    elif selection == ACTIONS[2]:
        return parse_active_tasks
    else:
        return


def create_task() -> str:
    task = show_wofi_action(ACTIONS[0].encode('UTF-8')).decode('UTF-8').rstrip()

    command = f'task add {task}'

    process = basic_proc(command)

    return process.communicate()[0]


def parse_active_tasks() -> list:
    command = 'task'

    process = basic_proc(command)

    task_list = process.communicate()[0]

    tasks = task_list.decode('UTF-8').split('\n')
    
    print(tasks[3:-3])

if __name__ == '__main__':
    get_selection = show_wofi_main(prompt())
    action = select_action(get_selection.decode('UTF-8').rstrip())
    if action is not None:
        action()
    else:
        sys.exit(0)
