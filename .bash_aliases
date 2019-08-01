# aliases to make life easier
alias ps='/bin/ps -u `whoami`'
alias pscpu='ps a --format pcpu,user,comm,etime --sort pcpu | sort -gr | head -n 25'
alias path='echo $PATH'
alias rr='rm `find . -name "*~"`'
alias ssh='/usr/bin/ssh -Y -o ServerAliveInterval=5 -o ServerAliveCountMax=1'
alias hgrep='history|grep'
alias findsortdate='{ name=$(cat -); find -name $name -exec stat -c "%y/ %n" {} \; | sort -k1; }<<<'

# ls aliases
alias ls='/bin/ls -p --color=auto'
alias ll='ls -la'
alias lssize='ll -Sr'
alias lstime='ll -tr'
alias lslen="ls | perl -e 'print sort { length(\$a) <=> length(\$b) } <>'"

# qpdfview for viewing portable document format
alias qv='qpdfview '
alias acroread='qpdfview '

# speed things up a little: no interactive (re)moves 
#unalias mv
#unalias rm

# aliases related to tex
alias rmtex='rm -rf auto *.idx *.log *.aux *.dvi *.tex~ *.bbl *.blg *.out *.rel *.toc *.lof *.lot *.fff *.ttt *.ind *.ilg'

# vncserver on lnx-rad-03
alias startvncserver='vncserver :9${HOSTNAME##*0} -name "${HOSTNAME}-${USER}" -geometry 1362x832 -depth 24'
alias killvncserver='vncserver -kill :9${HOSTNAME##*0}'

# aliases related to matlab and R
alias matlabshell='/usr/local/MATLAB/R2018a/bin/matlab -nodesktop -nosplash'
alias matlab='matlabshell;stty echo'
alias R='/usr/bin/R --no-save'

# aliases related to Groningen
alias inf='ssh wink@iwi123.iwinet.rug.nl'

# cluster login 
alias neugrid='ssh 130.37.210.243'

# 03 -> 04 login and v.v.
alias log03='ssh 10.144.40.47'
alias vnc03='vncviewer 10.144.40.47:93' 
alias log04='ssh 10.144.40.48'
alias vnc04='vncviewer 10.144.40.48:94' 

# aliases related to Cambridge
alias bcni='ssh -L5903:bcni3:5923 amw71@bcni.psychol.cam.ac.uk'
alias camvnc='vncviewer :03' 

# aliases related to the file system
alias anna='cd /anna/users/${USER}${PWD##*${USER}}'
alias haso='cd /haso/users/${USER}${PWD##*${USER}}'

# aliases related to NCAgrid
alias nca='ssh amwink@145.121.59.137'

# aliases for the ANW server (menno/anand)
alias anw="ssh a.wink@145.121.54.67"

# aliases for the radiology cloud (viktor/silvia)
alias cloud="ssh amwink@145.121.126.53"

# aliases for the alzheimer-analyse (betty)
alias aa="ssh amwink@145.121.54.155"

# aliases for the iac computer (remko) -- clinical studies
alias iac="ssh amwink@sp-ap-iaclnx02"

# aliases for the xnat computer (epad) -- clinical studies
alias xnat="ssh xnat@145.121.126.68"

# aliases for the Martijn's GPU computer (remko) -- deep learning
alias gpuhost="ssh amwink@10.119.24.104"

# aliases for the deep learning servers
alias dl1="ssh amwink@10.120.4.222"
alias dl2="ssh amwink@10.120.6.238"
