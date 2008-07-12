#!/usr/bin/env python
# Script downloaded from:
# http://yiqiang.org/blog/2008/07/04/publishing-your-dotfiles/
import os
home = os.path.abspath(os.environ['HOME'])
path = os.path.join(home, '.dotfiles') 
excludes = ['gtk-2.0', 'create_symlinks.py']
for f in os.listdir(path):
    if f.startswith('.'):
        continue
    if f not in excludes:
        dst = os.path.join(home, '.' + f)
        src = os.path.abspath(f)
        try:
            print "Symlinking %s to %s" % (src, dst)
            os.symlink(src, dst)
        except Exception, msg:
            print "Failed to symlink %s to %s " % (src, dst)
            print msg
