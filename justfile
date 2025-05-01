dev:
    NAVIGATOR_DATABASE_URL=postgresql://navigator:navigator@localhost/navigator pipenv run fastapi run ./app/main.py --port 8888

requirements:
    poetry export --without-hashes --without-urls --format requirements.txt | sed 's/ ;.*//'  > requirements.txt

ecr-login:
    aws ecr get-login-password --region eu-west-1 --profile $AWS_PROFILE | docker login --username AWS --password-stdin $(aws sts get-caller-identity --query 'Account' --output text --profile $AWS_PROFILE).dkr.ecr.eu-west-1.amazonaws.com

docker-run:
    docker run -p 8888:8888 -e NAVIGATOR_DATABASE_URL=postgresql://navigator:navigator@localhost/navigator documents-api

docker-build:
    docker build . -t documents-api

docker-push:
    docker tag documents-api $(aws sts get-caller-identity --query 'Account' --output text --profile $AWS_PROFILE).dkr.ecr.eu-west-1.amazonaws.com/documents-api:latest
    docker push $(aws sts get-caller-identity --query 'Account' --output text --profile $AWS_PROFILE).dkr.ecr.eu-west-1.amazonaws.com/documents-api:latest
