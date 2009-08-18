#!/usr/bin/env python
# Script downloaded from:
# http://yiqiang.org/blog/2008/07/04/publishing-your-dotfiles/
import os, sys

def symlink(source, dest):
    try:
        print "Symlinking %s to %s" % (source, dest)
        os.symlink(source, dest)
    except Exception, msg:
        print "Failed to symlink %s to %s " % (source, dest)
        print msg


home = os.path.abspath(os.environ['HOME'])
path = os.path.join(home, '.dotfiles') 
deep_dir_bases = ['gconf/apps']
excludes = ['gtk-2.0', 'create_symlink.py']

deep_dir_heads = [os.path.split(deep_dir)[0] for deep_dir in deep_dir_bases]

files = None
if len(sys.argv) > 1:
    # Take options from the command line
    files = sys.argv[1:]
else:
    # Process all of the files 
    files = filter(lambda x: x not in deep_dir_heads, os.listdir(path))
    files.extend(deep_dir_bases)


for f in files:
    if f.startswith('.'):
        continue

    if f not in excludes and f not in deep_dir_heads:
        src = os.path.abspath(f)
        dst = os.path.join(home, '.' + f)
        symlink(src, dst)

    elif f in deep_dir_bases:
        for dir in os.listdir(os.path.join(path, f)):
            src = os.path.abspath(os.join(f, dir))
            dst = os.join(home, '.' + f, dir)
            symlink(src, dst)

    elif os.path.join(os.path.split(f)[:-1]) in deep_dir_bases:
        src = os.path.abspath(f)
        dst = os.join(home, '.' + f)
        symlink(src, dst)

