#! /usr/bin/env python

from __future__ import print_function
from os import environ, getcwd, symlink, listdir, makedirs, name, unlink, walk
from os.path import dirname, exists, isdir, isfile, islink, join, sep
from shutil import copyfile, rmtree


def git_modules():
    lines = map(lambda l: l.split(), open('.gitmodules'))
    return [l[2] for l in lines if l[0] == 'path']


def filenames():
    for root, dirs, files in walk('.'):
        directory = root[2:]

        for filename in files:
            yield join(directory, filename)


def filter_filenames(filenames, ignore_list):
    for filename in filenames:
        if any(map(lambda i: filename.startswith(i), ignore_list)): continue

        yield filename


def install(sources, destinations):
    for source, destination in zip(sources, destinations):
        directory = dirname(destination)

        if not exists(directory):
            makedirs(directory)

        if exists(destination):
            if isfile(destination) or islink(destination):
                unlink(destination)
            if isdir(destination):
                rmtree(destination)

        print('%s -> %s' % (source, destination))
        symlink(source, destination)


def linux(home_directory, working_directory):
    modules = git_modules()
    ignore_list = ['.git', 'README.md', __file__[2:], 'scripts'] + modules

    filenames = list(filter_filenames(filenames(), ignore_list)) + modules
    sources = map(lambda f: join(working_directory, f), filenames)
    destinations = map(lambda f: join(home_directory, '.'+f), filenames)

    install(sources, destinations)


def windows(home_directory, working_directory):
    windows_path = join(home_directory, sep.join((
        'AppData',
        'Roaming',
        'Sublime Text 3',
        'Packages',
        'User'
    )))

    linux_path = sep.join((
        'config',
        'sublime-text-3',
        'Packages',
        'User'
    ))

    sublime_text_files = [
        (join(working_directory, linux_path, f), join(windows_path, f))
        for f in listdir(linux_path)
    ]

    for source, destination in sublime_text_files:
        print(destination)
        copyfile(source, destination)


if __name__ == '__main__':
    home_directory = environ['HOME']
    working_directory = getcwd()

    if name == 'nt':
        windows(home_directory, working_directory)
    else:
        linux(home_directory, working_directory)
