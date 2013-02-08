# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

##### Default to human readable figures
 alias df='df -h'
 alias du='du -h'

##### Misc :)
# alias less='less -r'                          # raw control characters
 alias whence='type -a'                        # where, of a sort
 alias grep='grep --color'                     # show differences in colour
 alias dstamp='date +%Y%m%d'									#	generates a datestamp like 20120228
 alias tstamp='date +%Y%m%d_%H%M%S'						#	generates a time stamp like 2012022_123456
 
##### SCREEN aliases
 alias screens='screen -list'			# shows list of screens
 alias screenu='screen -mS'			# creates new screen by name
 alias screenr='screen -r'			# resumes specified screen
 alias screenl='screenr `ls -t $(screen -list|grep -P -o "[a-zA-Z0-9/]+S\-$(whoami)")/ |head -n1|grep -Po [0-9]+\.[a-zA-Z0-9\-_]+`' # resumes the last used screen

##### DEBUG aliases
 alias php5='/cygdrive/c/Program\ Files\ \(x86\)/NuSphere/PhpED/php5/php.exe'
 alias php='/cygdrive/c/Program\ Files\ \(x86\)/NuSphere/PhpED/php/php.exe'
 alias php53='/cygdrive/c/Program\ Files\ \(x86\)/NuSphere/PhpED/php53/php.exe'

##### GIT aliases
 alias git-ignore='echo $1 >> `pwd`/.gitignore'
 alias git-lastcommit='git log -n1|grep -Eo "([a-z0-9]{40})"' 
 alias git-commitlist='git log|grep commit|grep -P -o [a-z0-9]{40}$'
# alias git-addnew='for i in `git status -s |grep ??`; do if [ $i != "??" ]; then git add ${i}; fi; done'
 alias gatus='git status'
 alias granch='git branch -a'
 alias giff='git diff'
 alias gadd='git add'
  
##### Some shortcuts for different directory listings
 alias ls='ls -hF --color=tty'                 # classify files in colour
 alias ll='ls -l'                              # long list
 alias la='ls -Al'                              # all but . and ..
 alias l='ls -CF'                              #
 alias lr='l -R'
 alias llr='ll -R'
 alias cl='clear;l'				# clears screen then runs l
 alias cll='clear;ll'				# clears screen then runs ll
# DOS
 alias dir='ls --color=auto --format=vertical'
 alias vdir='ls --color=auto --format=long'

##### Some hosting related ones
 alias pods='~/bin/pod'

#####	Dir changing aliases
 alias gcd='cd ${CROOT}/$1'
 alias scd='cd ${SROOT}/$1'
 
##### comparisons
 alias compare='WinMergeU /r'
 