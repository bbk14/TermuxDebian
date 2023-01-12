#!/bin/bash
#if Tmux work stop it. When you reopen Termux, Tmux duplicate sessions
if [[ -n $(pgrep tmux) ]]; then
tmux kill-server
fi
