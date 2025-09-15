install:
	pip install -r requirements.txt


format:
	black .

all: install format
