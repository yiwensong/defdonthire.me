import smtplib
import flask
import yaml

from flask import Flask
from flask_mail import Mail
from flask_mail import Message

app = Flask('defdonthireme')

@app.before_request
def before_request():
    if flask.request.url.startswith('http://'):
        url = flask.request.url.replace('http://', 'https://', 1)
        code = 301
        return flask.redirect(url, code=code)


@app.route('/')
def index():
    content = ''
    return flask.render_template('index.html', content=content)


@app.route('/CNAME')
def cname():
    return app.send_static_file('CNAME')


@app.errorhandler(404)
def page_not_found(exception):
    return flask.render_template('404.html'), 404
