#!/bin/bash

env=$(pyenv virtualenvs | fzf | awk '{print $1}')
pyenv activate $env
pyenv virtualenvs
