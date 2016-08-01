c = get_config()

c.InteractiveShell.confirm_exit = False
c.InteractiveShellApp.exec_lines = [
    'import itertools',
    'import math',
    'import re',
    'import sys',
    'from pathlib import Path',
]
