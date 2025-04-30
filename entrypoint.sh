#!/bin/sh
echo "Hello entrypoint!"
NAVIGATOR_DATABASE_URL=postgresql://navigator:navigator@localhost/navigator fastapi run ./app/main.py --port 8080
