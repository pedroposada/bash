# change my bash prompt to show my working directory
PS1='\w\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FUNCTIONS
# short for adding aws personal profile
awspersonal () {                    
  AWS_PROFILE=personal ${@}
}
# short form docker-compose
dockerc () {                        
  docker-compose ${@}
}
# remove all dangling images, images with no tag
dockerm () {                        
  IMAGES=$(docker images | grep "^<none>" | awk '{print $3}')
  [[ -z "${IMAGES}" ]] && echo "there are no danglign images to remove"
  [[ -z "${IMAGES}" ]] || docker rmi -f ${IMAGES}
}
# remove all exited containers
dockerd () {                        
  CONTS=$(docker container ls -f status=exited -q)
  [[ -z "${CONTS}" ]] && echo "there are no exited containers to remove"
  [[ -z "${CONTS}" ]] || docker container rm ${CONTS}
}

# ALIASES
alias ll="ls -al"
alias awspersonal=awspersonal
alias dockerc=dockerc
alias dockerm=dockerm
alias dockerd=dockerd
alias hlpr=~/Sites/rocky/helper.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# add java 1.8.x to PATH
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export PATH="$PATH:$JAVA_HOME"

# add android to PATH
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/pedro-local/.nvm/versions/node/v6.9.5/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/pedro-local/.nvm/versions/node/v6.9.5/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/pedro-local/.nvm/versions/node/v6.9.5/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/pedro-local/.nvm/versions/node/v6.9.5/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash