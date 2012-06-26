#!/usr/bin/env python

from jinja2 import Template
import sys
import re
import os.path
import argparse

TEMPLATE_HEADER = """[po_directory] po4a"""
TEMPLATE_PAGE = """
[type: man] original/{{ sec }}/{{ name }} $lang:draft/{{ sec }}/{{ name }} \\
       add_$lang:?po4a/add_$lang/copyright/{{ name }}.txt
"""

def usage():
    print 'Usage: %s pagename' % sys.argv[0]
    print
    print '(Example) %s connect.2' % sys.argv[0]
    sys.exit(1)

def gencfg_header(path=None):
    if path == None:
        print TEMPLATE_HEADER
    else:
        print os.path.join(TEMPLATE_HEADER, path)

def gencfg_page(name):
    try:
        sec = 'man' + re.sub('\.([1-9])$', ' \\1', name).split()[1]
    except Exception, e:
        print e
        usage()
    #with open(TEMPLATE_FILE, 'rb') as f:
    #    template = Template(f.read())
    template = Template(TEMPLATE_PAGE)
    print template.render(name=name, sec=sec)

#--------------------

parser = argparse.ArgumentParser(description="po4a config generator")
parser.add_argument('FILE', nargs='+')
parser.add_argument('-r', '--recursive', action='store_true')
args = parser.parse_args()
#print args.recursive
#print args.FILE

#if len(sys.argv) < 2:
#    usage()

if args.recursive:
    path = os.path.basename(args.FILE[0])
else:
    path = None
gencfg_header(path)

for p in args.FILE:
    gencfg_page(os.path.basename(p))
