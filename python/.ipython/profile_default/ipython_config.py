import sys

c = get_config()

c.InteractiveShell.confirm_exit = False
c.InteractiveShellApp.exec_lines = [
    'import itertools',
    'import math',
    'import re',
    'import sys',
]

if sys.version_info >= (3, 4):
    c.InteractiveShellApp.exec_lines += [
        'from pathlib import Path',
    ]
