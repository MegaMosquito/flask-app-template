# flask-app-template

An example Flask app hosted as a WSGI VirtualServer inside apache2

### Usage:

1. Edit the `app/app.py` file to contain your Flask application.
2. Edit the `app/app.wsgi` file to set your own `application.secret.key`
3. `make build`
4. `make run`
5. `make test`

### Why

I built this because I was tired of getting warning messages like these from Flask apps:

```
 * Serving Flask app "app" (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://0.0.0.0:80/ (Press CTRL+C to quit)
```

So this is Flask app properly deployed within a production WSGI server.
