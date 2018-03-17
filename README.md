# defdonthire.me
defdonthire.me is a personal site under the domain defdonthire.me

## How to run
`make run` runs the prod service.  
`make devsite` runs a dev site on port 5000.  
`make webpack` runs a webpack watcher that will rebuild your js when your files change.  
`make venv` and `make js` will install the python virtualenv and the js environment, respectively.

## How to set up
SSL certing files need to be in `/etc/keys/defdonthireme/ssl/defdonthire.me.(key/crt)`.  
defdonthire.me must also point to the server's IP (obviously). If not, the certificates will fail to validate.
