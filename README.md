# my-environment

Repository for my bash environment for Linux and MacOS.

Install and initialize:

```bash
cd ${HOME}

# Install.
git clone https://github.com/imjang57/my-environment
echo "source ${HOME}/my-environment/bash/bash-env.sh" >> ${HOME}/.bash_profile

# Initialize - generate symbolic links and copy configuration files.
cd my-environment
bash make-links.sh
```

Modify copied configuration files for own environment:

* `~/.gitconfig`
* `~/.gitconfig-myprofile`

## Install packages

Run install script:

```bash
bash <path/to/this/repo>/bash/install-base.sh
```

## Additional settings

Disable bash session timeout (when `TMOUT` is set):

```bash
export TMOUT=0
```

Change tmux socket file location, add below to `~/.bash_profile`:

```bash
alias tmux = 'tmux -S ~/.tmux.socket
```
