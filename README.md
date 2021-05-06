# JSON Schema generate Python types

Tools to generate Python types based on TypeDict from a JSON schema

## Quick start

install:

```bash
python3 -m pip install --user jsonschema-gentype
```

Convert a JSON schema to a Python file contains the types

```bash
jsonschema-gentype --json-schema=<JSON schema> --python=<destination Python>
```

## Config file

Cou can also vrite a config file named `jsonschema-gentypes.yaml` with:

```yaml
headers: >
    # Automatically generated file from a JSON schema
# Used to correctly format the generated file
callbacks:
    - - black
    - - isort
generate:
    - # Json schema file name
      source: jsonschema_gentypes/schema.json
      # Python file name
      destination: jsonschema_gentypes/configuration.py
      # The name of the root element
      root_name: Config
      # Argument passed to the API
      api_arguments:
          additional_properties: Only explicit
      # Rename an element
      name_mapping: {}
```

## Limitation

Requires Python 3.8

See [issues](https://github.com/camptocamp/jsonschema-gentypes/issues?q=is%3Aissue+is%3Aopen+label%3Alimitation) contains the limitations

## Contribute

The code should be formatted with `isort` and `black`.

The code should be typed.

The `prospector` tests should pass.

The code should be tested with `pytests`.
