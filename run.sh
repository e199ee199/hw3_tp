#!/bin/bash

command=$1

if [ "$command" = 'build_generator' ]; then
    docker build -t generator ./generator
elif [ "$command" = 'run_generator' ]; then
    docker run --rm -v "$(pwd)/data:/data" generator
elif [ "$command" = 'create_local_data' ]; then
    python3 generator/generate.py local_data
elif [ "$command" = 'build_reporter' ]; then
    docker build -t reporter ./reporter
elif [ "$command" = 'run_reporter' ]; then
    docker run --rm -v "$(pwd)/data:/data" reporter
elif [ "$command" = 'structure' ]; then
    find . | grep -v .git
elif [ "$command" = 'clear_data' ]; then
    rm -f data/*.csv data/*.html
elif [ "$command" = 'inside_generator' ]; then
    docker run --rm -v "$(pwd)/data:/data" --entrypoint sh generator -c 'ls -la /data'
elif [ "$command" = 'inside_reporter' ]; then
    docker run --rm -v "$(pwd)/data:/data" reporter ls -la /data
else
    echo "команда не найдена"
fi