## Use the official Python 3.9 image
FROM python:3.9

## Set working directory to /code
WORKDIR /code

## Copy the current directory contents in the container at /code
COPY ./requirements.txt /code/requirements.txt

## Install the requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

## Set up new user
RUN useradd user

## Swtich to the created user
USER user

## Set home to user's home directory
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:${PATH}

## Set working directory to user's home directory
WORKDIR $HOME/app

## Copy current directory contents into container at $HOME/app
COPY --chown=user . $HOME/app

## Start the FastAPI App on port 7860
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "7860"]