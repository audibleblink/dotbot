# Set SSH to use gpg-agent
unset SSH_AGENT_PID
export SSH_AUTH_SOCK=/run/user/"$(id -u)"/gnupg/S.gpg-agent.ssh

# Start the gpg-agent if not already running
# if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
#   echo 'starting gpg agent for the first time'
#   eval $(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf)
# fi

# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
# gpg-connect-agent updatestartuptty /bye >/dev/null
