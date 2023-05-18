# Quality Pipeline (python)

This GitHub Action sets up a quality pipeline that runs tests, generates test coverage reports, performs linting, and checks for security vulnerabilities. It can be used to ensure the code quality of your project.

## Inputs

- **omit**: The files to omit in the coverage report. \
  **Default:** tests/*.

- **min_coverage**: The minimum required test coverage percentage. \
  **Default:** 100.

- **min_lint_rate**: The minimum required pylint rate. \
  **Default:** 8.0.

## Usage example
```yaml
name: Quality pipeline workflow

on: push

jobs:
  run-quality-pipeline:
    runs-on: ubuntu-latest

    steps:

      ...

      - name: Run quality checks
        uses: cromai/pipelines/pyhon-quality@main
        with:
          omit: "tests/*"
          min_coverage: 90
          min_lint_rate: 9
```

## Steps

- **Install dependencies:** Installs the necessary dependencies for running tests, generating test coverage reports, performing linting, and checking for security vulnerabilities. Dependencies include pytest, coverage, pylint, and bandit.

- **Run tests**: Executes the test suite using pytest.

- **Check Coverage:** Generates a coverage report and checks if the coverage percentage meets the minimum required coverage specified by the min_coverage input.
 
- **Run lint:** Runs pylint to perform linting on Python files in the project. It checks if the pylint rate meets the minimum required rate specified by the min_lint_rate input.

- **Run security check:** Executes bandit to check for security vulnerabilities in the project.

**Note:** Make sure to configure the on field in the workflow file to trigger the quality pipeline on the desired events (e.g., push, pull request).


## Requirements
This action assumes your project use:
- pytest 
- coverage 
- pylint 
- bandit

**Obs.:** Before call the action in your workflow make sure your are in the environment with all dependencies installed.
