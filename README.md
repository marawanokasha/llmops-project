# LLMOps Project

[![Python 3.13](https://img.shields.io/badge/python-3.13-blue.svg)](https://www.python.org/downloads/release/python-3120/)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)

<br />
<div align="center">

[🤖 Overview](#overview) |
[🚀 Quick Start](#quick-start) |
[⚙️ Setup](#setup) |
[🏃 Running Locally](#run-locally) |
[📏 Coding Standards](#coding-standards) |

</div>

## 🤖 Overview

| Documentation | Link |
|-------------------|------------------------------------------------------------------------------------------------------|

## 🚀 Quick Start <a name="quick-start"></a>

To quickly check the web application locally, you can run it in a docker container using:

```bash
docker compose up --build
```

Then go to [http://localhost:8501](http://localhost:8501) for the webapp and [http://localhost:8000](http://localhost:8000) for the API.

## ⚙️ Setup <a name="setup"></a>

To begin working on the project:

1. Create a python environment and install the requirements:

   ```bash
   make init-local
   ```

## 🏃 Running Locally <a name="run-locally"></a>

### 🌐 Webapp <a name="webapp"></a>

To run the webapp:

```bash
uv run streamlit run src/webapp.py
```

or add it to your IDE's run configuration. Now go to http://localhost:8501 to access the webapp.

### 📡 API <a name="api"></a>

To run the API:

```bash
uv run fastapi dev src/api.py
```

or add it to your IDE's run configuration. Now go to http://localhost:8000 to access the API's docs.

### 📡 MLFlow <a name="mlflow"></a>

To run the API:

```bash
uv run mlflow server --host 0.0.0.0 --port 8080
```

Now go to http://localhost:8080 to access the local MLFlow.

### 📓 Notebooks

In the [notebooks](notebooks) folder you can find notebooks that can be used to test the functionality of the package and can be used for active development and quick iterations.

## 📏 Coding Standards <a name="coding-standards"></a>

### 🔧 Config Management

We use [Dynaconf](https://www.dynaconf.com) for providing configuration management and environment switching. The configuration files can be found under [config](./config/) and the config module can be found under [src/llmops_project/config.py](./src/llmops_project/config.py).

The default environment when developing locally is the `local` environment and its config file can be found here: [config/application-local.yaml](./config/application-local.yaml).

### 📋 Logging

We use [Structlog](https://www.structlog.org/en/stable/) for logging.

Logging Configuration can be found [here](./src/llmops_project/utils/logger.py).

### 🔍 Pre-commit hooks

On commit, we run pre-commit hooks on the code before allowing the commit to proceed. You can find the list of checks in the [.pre-commit-config.yaml](./.pre-commit-config.yaml) file.

The pre-commit hooks will be automatically installed once you run `make init-local`.

Now every time you commit, those hooks will be run automatically. If you ever want to disable checks on a python line you can add [`# noqa`](https://docs.astral.sh/ruff/linter/#error-suppression) beside that line, but try not do that too often since it adds visual noise to the code.

To run the checks on the whole repo (usually not needed except when adding/modifying a hook that would have an effect on all the files in the repo):

```bash
make pre-commit-all
```

### 🛠️ Code Quality Tooling

We use [pylint](https://pylint.readthedocs.io/en/stable/index.html) for automated helpful code quality suggestions. To run it:

```bash
make code-quality
```

### 📦 Env Management

We use `uv` for environment management and requirement pinning.

For adding a new requirement, run

```bash
uv add <name_of_package> [--optional dev]
```

to update both the [pyproject.toml](pyproject.toml) and [uv.lock](uv.lock) files and install the package.

For updating an existing requirement:

```bash
uv lock  --upgrade-package <name_of_package>
```

For updating all packages:

```bash
uv lock  --upgrade
```
