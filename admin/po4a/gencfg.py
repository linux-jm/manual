#!/usr/bin/env python

from jinja2 import Template
import sys
import re

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

def gencfg_header():
    print TEMPLATE_HEADER

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

if len(sys.argv) < 2:
    usage()

gencfg_header()
for p in sys.argv[1:]:
    gencfg_page(p)
