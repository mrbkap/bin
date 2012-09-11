#!/usr/bin/python

import sys
import os

path = sys.argv[1]
toplevel = path[:sys.argv[1].find('/')]

layout = ('content', 'dom', 'layout', 'editor', 'caps', 'media', 'ipc')

if "MAKEFLAGS" not in os.environ:
    os.environ["MAKEFLAGS"] = "-s -j8"

if toplevel in layout or \
        (toplevel == 'js' and sys.argv[1].find('xpconnect') >= 0):
    os.system('make -C %s && make -C layout/build && make -C toolkit/library' % path)
elif toplevel == 'js':
    os.system('make -C %s && make -C toolkit/library' % path)
else:
    os.system('make -C %s' % path);
