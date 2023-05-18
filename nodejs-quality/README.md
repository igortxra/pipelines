# Quality Pipeline (nodejs)

This GitHub Action sets up a quality pipeline that runs tests, generates test coverage reports, and performs linting. It can be used to ensure the code quality of your project.

## Usage

```yaml
name: Quality pipeline
description: Run tests, test coverage, and lint
on: [push, pull_request]

jobs:
  quality_pipeline:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Run quality pipeline
        uses: cromai/pipelines/nodejs-quality@main
```

## Steps

1. **Run tests capturing coverage:** Executes the test suite and captures test coverage using `npm run test:coverage`.
2. **Check coverage:** Checks the generated test coverage report using `npm run test:coverage:check`.
3. **Run lint:** Performs linting on the project using `npm run lint`.

## Requirements
This action assumes that your project has the following commands in _package.json_:
- test:coverage
- test:coverage:check
- lint
