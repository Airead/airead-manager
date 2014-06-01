# -*- coding: utf-8 -*-
#
# created: Sun May 11 16:15:22 2014
#

__author__ = 'Airead Fan <fgh1987168@gmail.com>'
__version__ = '0.0.1'

import os

from flask import Flask, redirect
from model import db
from logbook import Logger

import config
import blueprints
import utils

log = Logger(__name__)


def create_app(config_object):
    _app = Flask(__name__)

    for (name, bp) in blueprints.blueprints.iteritems():
        print 'load %s blueprint' % name
        _app.register_blueprint(bp.blueprint)
    db.init_app(_app)

    _app.config.from_object(config_object)
    override_env_name = 'FLASK_SEED_CONFIG'
    if _app.config.from_envvar(override_env_name, silent=True):
        path = os.environ[override_env_name]
        print 'Overriding config by environment variable: %s = %s' % (override_env_name, path)

    return _app


### MAIN

config_name = os.getenv('CONFIG', 'Default')
app = create_app(config_object=config.defined[config_name])

if app.config['LOG_LEVEL'] == 'INFO':
    log_setup = utils.LoggingSetup(app.config['LOG_LEVEL'])
else:
    log_setup = utils.ProdLoggingSetup(app.config['LOG_LEVEL'],
                                       app.config['LOG_DIR'] + '%s.log' % app.config['APP_NAME'])

nested_log_setup = log_setup.get_default_setup()


@app.route('/')
def index():
    return redirect('static/index.html')


def main():
    app.debug = True
    app.run()

if __name__ == '__main__':
    with nested_log_setup.applicationbound():
        log.debug('Starting application...')
        main()