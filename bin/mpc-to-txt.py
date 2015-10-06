#!/usr/bin/env python
"""mpc-to-txt.py

Usage:
    mpc-to-txt.py <source> <output>

Options:
    -h --help  Show this message.
"""

import os
import sys

if any(x in sys.argv for x in ('-h', '--help',)) or len(sys.argv) < 3:
    print __doc__
    sys.exit(0)

source = sys.argv[1]
output = sys.argv[2]

# get file list from mpc import playlist
raw = []
with open(source, 'r') as f:
    raw = f.readlines()

# convert files to their proper basename
files = [os.path.basename(x.strip().split(',', 2)[-1].replace('\\', '/'))
        for x in raw if 'filename' in x]

# write new list of files
with open(output, 'w') as f:
    f.write('\n'.join(files))
