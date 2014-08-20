#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import with_statement
from os import walk, listdir
from glob import glob

from flask import Flask
from flask import render_template, request, redirect, url_for
import random

app = Flask(__name__)

imagedir = 'static/catpics/'
catpics  = []

with app.app_context ():
  catpics = listdir(imagedir);

@app.route('/')
def index ():
    return render_template('index.html')

@app.route('/cats/')
def list_cats ():
    return render_template('allcats.html', allcats = catpics)

@app.route('/cats/', methods=['POST'])
def  assign_cats ():
    if request.form['username']:
      user = request.form['username']
      return redirect(url_for('users_cat', user = user))
    else:
      return redirect(url_for('list_cats'))

@app.route('/cats/<user>')
def users_cat (user):
  if len(user) < 4:
    return render_template('shortname.html', username = user)
  else:
    catpic = random.choice(catpics)
    return render_template('userscat.html', username = user, catpic = catpic)

if __name__ == '__main__':
    app.run()

