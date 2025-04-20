# no greeting
set fish_greeting

# use the Secure Enclave™ 
set -x SSH_AUTH_SOCK /Users/hamish/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

# shortcuts
alias .. "cd .."
alias cd.. "cd .."
alias ll "ls -la"
alias t="tmux"
alias vim="nvim"
alias v="nvim"
alias v.="nvim ."

# python sucks
function venv
    if not test -d "./.venv"
        python3.12 -m venv .venv
    end
    source .venv/bin/activate.fish
end

# modern tooling (see https://github.com/ibraheemdev/modern-unix)
alias ls eza
alias cat bat
alias rt trash

# holy webshit
alias s spotify_player

# typos
alias gti git

# quick and lazy git
function lg
    #echo -e "\e[0;32m Checking your Git status... \e[0m"
    git status -s -u -v
    #echo -e "\e[0;32m Adding all changes... \e[0m"
    git add . -v

    #echo -e "\e[0;32m Please enter your commit message: \e[0m"
    read commit_message

    #echo -e "\e[0;32m Committing changes... \e[0m"
    git commit -a -s -v -m "$commit_message"

    #echo -e "\e[0;32m Pushing to the remote repository... \e[0m"
    git push -v

    echo $(~/.local/scripts/commits.sh) >/tmp/commits
end

# quick project setup
function qp
    if test -z "$argv[1]"
        echo "Usage: qp <name>"
        return 1
    end

    # Get the current year and month
    set year (date +%Y)
    set month (date +%m)

    # Build the directory name
    set dir_name "$year-$month-$argv[1]"

    # Create the main directory and subdirectories
    mkdir -p "$dir_name/assets"
    mkdir -p "$dir_name/repos/$argv[1]"

    # Navigate to the target subdirectory
    cd "$dir_name/repos/$argv[1]"

    # Initialize a new git repository
    git init

    # push to github
    # gh repo create

    echo "Directory structure created and Git repository initialized."
end
#

set -Ux GPG_TTY (tty)

fish_add_path /Users/hamish/Documents/20-dev/25-scripts/quote.sh
/Users/hamish/.local/bin/mise activate fish | source
