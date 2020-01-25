#!/bin/python
import datetime
import sys
import os
import glob

prefix = os.path.expanduser('~') + '/gdrive/notes'


def get_todays_filename():
  today = datetime.datetime.today()
  return today.strftime('%Y-%m-%d.txt')

def get_n_days_ago(n):
  today = datetime.datetime.today()
  n_days_ago = today - datetime.timedelta(n)
  return n_days_ago.strftime('%Y-%m-%d.txt')

def get_todays_path(filename):
  folder = filename[:filename.index('-')]
  return prefix + '/' + folder + '/' + filename

def match_path():
    arg = sys.argv[1]
    realpath = os.path.realpath(prefix + '/**/*')
    paths = glob.glob(realpath)
    paths.sort(reverse=True)
    for path in paths:
      if arg in path:
        return path

def get_path():
  if len(sys.argv) == 1:
    return get_todays_path(get_todays_filename())
  else:
    return match_path()

def launch_vim(path):
  os.system("vim '%s'" % get_path())

def main():
  launch_vim(get_path())

if __name__ == '__main__':
  main()
