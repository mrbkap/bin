#!/usr/bin/python

import sys
import os

path = sys.argv[1]

toplevel,_ = os.path.split(path)
if toplevel is '':
    toplevel = _
else:
    dirname = toplevel
    while dirname is not '':
        toplevel = dirname
        dirname, _ = os.path.split(toplevel)

layout = ('content', 'dom', 'layout', 'editor', 'caps', 'media', 'ipc')
libxul = ('js', 'embedding', 'storage')

if "MAKEFLAGS" not in os.environ:
    os.environ["MAKEFLAGS"] = "-s -j8"

if toplevel in layout or \
        (toplevel == 'js' and sys.argv[1].find('xpconnect') >= 0):
    os.system('make -C %s && make -C layout/build && make -C toolkit/library' % path)
elif toplevel in libxul:
    os.system('make -C %s && make -C toolkit/library' % path)
else:
    os.system('make -C %s' % path);
