#!/bin/bash

install_poetry=false
comment_coverage=false
fail_under=90

# Define what o omit in test coverage report
omit="tests/*,*/interfaces/*,app/repositories/*,app/container.py"

# Loop through all parameters
while (( $# >= 1 )); do 
    case $1 in
    --install-poetry) install_poetry=true;;
    --comment-coverage) comment_coverage=true;;
    --fail-under) fail_under=$2; shift;;
    *) break;
    esac;
    shift
done

# Install poetry if necessary
if [ "$install_poetry" = true ]; then

  curl -sSL https://install.python-poetry.org | python3 -
  poetry config virtualenvs.create false

fi

# Install dependencies and run tests with coverage
poetry install --no-interaction --no-ansi --no-root
coverage run -m pytest -v

# Generate coverage report and output it
report=$(coverage report --omit=$omit --fail-under=$fail_under)
echo $report

# Comment the coverage report if necessary
if [ "$comment_coverage" = true ]; then

  report=$(coverage report --omit=$omit --format=markdown)

  gh pr comment $GITHUB_PR_NUMBER --body=" $report "

fi
