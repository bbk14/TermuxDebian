#!/bin/bash
if [[ -n $(pgrep tmux) ]]; then
tmux kill-server
fi
