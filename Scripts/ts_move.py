#! /usr/bin/env python
# -*- coding: utf-8 -*-

import os
import re
import shutil
import sys

source = sys.argv[1]
destination = sys.argv[2]

regex = re.compile("(?P<name>[a-zA-Z0-9\.]+)\.s(?P<season>\d{2})e\d{2}", re.I)

tv_shows = dict(filter(
    lambda x: os.path.isdir(x[1]),
    map(lambda x: (x.lower(), os.path.join(destination, x)), os.listdir(destination))
))

for entry in os.listdir(source):
    result = regex.search(entry)
    if not result: continue

    name = result.group('name').lower().replace('.', ' ')
    season_directory = "S%02d" % int(result.group('season'))

    if name in tv_shows:
        destination = os.path.join(tv_shows[name], season_directory)
        print "%s >> %s" % (entry, destination)

        try:
            os.makedirs(destination)
        except OSError:
            pass

        shutil.move(os.path.join(source, entry), destination)
    else:
        print "TV Show not found : %s" % name
