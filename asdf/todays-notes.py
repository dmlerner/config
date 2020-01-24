#!/bin/python
import datetime
import sys
import os


def get_todays_filename():
      today = datetime.datetime.today()
        return today.strftime('%Y-%m-%d.txt')

    def get_n_days_ago(n):
          today = datetime.datetime.today()
            n_days_ago = today - datetime.timedelta(n)
              return n_days_ago.strftime('%Y-%m-%d.txt')

          def get_todays_path(filename):
                folder = filename[:filename.index('-')]
                  prefix = '~/gdrive/notes'
                    return prefix + '/' + folder + '/' + filename

                os.system('vim ' + get_todays_path(get_todays_filename()))
