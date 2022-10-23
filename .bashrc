# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
cd
export PATH="/home/minhduc/Downloads/cf_tool/cf_v1.0.0_linux_64:$PATH"
alias thwine='LANG=ja_JP.UTF8 wine'
alias c++="g++ -std=c++2a -lm -Wall -O2 -fmax-errors=5 -march=native -s -lncurses"
#yay warng
alias tldr="tldr -t base16"
alias free="free -lhm"
alias nvim="nvim -p"
alias thwinevn='LANG=vi_VN.utf8 wine'
alias cppcode="cd ~/Documents && nvim main.cpp input.txt output.txt && cd"
alias pythoncode="cd ~/Documents && nvim main.py pinput.txt poutput.txt && cd"
alias ll="ls -alFph --color=auto"
