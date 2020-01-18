import sys

c = get_config()

c.InteractiveShell.confirm_exit = False
c.InteractiveShellApp.exec_lines = [
    'from datetime import datetime, timedelta',
    'import itertools',
    'import math',
    'import random',
    'import re',
    'import sys',
]

if sys.version_info >= (3, 4):
    c.InteractiveShellApp.exec_lines += [
        'from pathlib import Path',
    ]
