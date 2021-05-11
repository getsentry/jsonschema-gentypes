.PHONY: docker
docker:
	docker build --tag=camptocamp/jsonschema-gentypes .

.PHONY: prospector
prospector: docker
	docker run prospector --output=pylint

.PHONY: pytest
pytest: docker
	docker run pytest --verbose --cov=jsonschema_gentypes -vv --cov-report=term-missing

.PHONY: jsonschema-gentypes
jsonschema-gentypes: docker
	docker run --rm --user=$(id --user) --volume=$(pwd):/src camptocamp/jsonschema-gentypes
