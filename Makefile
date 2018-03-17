SSL_PATH='/etc/keys/defdonthireme/ssl/'
KEYFILE=$(SSL_PATH)'defdonthire.me.key'
CERTFILE=$(SSL_PATH)'defdonthire.me.crt'

.PHONY: venv
venv: setup.py requirements*.txt
	tox --recreate -e venv

.PHONY: js
js: 
	npm install
	webpack

.PHONY: run
run: venv js
	sudo venv/bin/gunicorn --reload --bind 0.0.0.0:80 autoapp:app &
	sudo venv/bin/gunicorn --config gunicorn_conf.py autoapp:app

.PHONY: devsite
devsite: venv js
	venv/bin/gunicorn --reload --bind 0.0.0.0:5000 --keyfile=$(KEYFILE) --certfile=$(CERTFILE) autoapp:app

.PHONY: webpack
webpack:
	webpack --watch
