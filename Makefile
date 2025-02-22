install:
	@pip install -r requirements.txt
colab:
	@pip install -r requirements.txt
	@pip install -r requirements_dev.txt
	@pip install -r requirements_test.txt
clear:
	@rm -rf access.txt flask_session/ instance/ migrations/
init:
	@python -m flask db init
	@python -m flask db migrate
	@python -m flask db upgrade
	@python -m flask createroles
	@python -m flask createsu
server:
	@python -m flask run --debug
server-production:
	# Altere FLASK_ENV para production em .flaskenv
	@python -m flask run
migrate:
	@python -m flask db migrate
	@python -m flask db upgrade
format:
	@python -m black -l 79 .
	@python -m isort .
lint:
	@python -m black -l 79 --check .
	@python -m isort --check .
test:
	# @pytest tests/units/test_hash_generator.py -v
	# @pytest tests/units/test_password_generator.py -v
sec:
