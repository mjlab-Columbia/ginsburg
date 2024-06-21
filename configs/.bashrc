#! /bin/bash .bashrc

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Alias for small working node for light tasks
alias smol='srun --pty -t 0-04:00 -A mjlab --mem=16G -N 1 -c 1 /bin/bash'

# Alias for larger working node where I might need some multi-processing
alias sesh='srun --pty -t 0-04:00 -A mjlab --mem=32G -N 1 -c 4 /bin/bash'

# High-memory instance with maximum possible memory in a node (768 Gb)
alias highmem='srun --pty -t 0-06:00 -A mjlab -C mem768 -N 1 -c 16 /bin/bash'

# High-memory instance with maximum possible memory in a node (768 Gb)
alias highcore='srun --pty -t 0-06:00 -A mjlab -N 1 -c 32 --mem=64G /bin/bash'

# Aliases for GPU based sessions
alias gpu='srun --pty -t 0-04:00 -c 4 --gres=gpu:1 --constraint=rtx8000 --mem=32G -A mjlab /bin/bash'
alias gpu2='srun --pty -t 0-12:00 --gres=gpu:2 --constraint=rtx8000 --mem=64G -A mjlab /bin/bash'
alias gpu4='srun --pty -t 0-12:00 --gres=gpu:4 --constraint=rtx8000 --mem=64G --nodes 2 -A mjlab /bin/bash'

alias pro='cd /burg/mjlab/projects/'
alias cleanjobs="squeue --me -h | grep -v 'bash' | awk '{print $1}' | xargs -I {} scancel {}"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
