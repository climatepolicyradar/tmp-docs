#!/bin/sh
echo "Hello entrypoint 111!"
# pipenv run fastapi run ./app/main.py --port 8080
pipenv run fastapi run ./app/main.py --port 8080
# NAVIGATOR_DATABASE_URL=postgresql://navigator:navigator@localhost/navigator fastapi run ./app/main.py --port 8080
