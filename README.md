# my-environment

Repository for my bash environment for Linux and MacOS.

## Initialize

Add below to `~/.bash_profile` file:

```bash
source <path/to/this/repo>/bash/bash-env.sh
```

Run install script:

```bash
bash <path/to/this/repo>/bash/install-all.sh
```

Generate symbolic links and copy configuration files:

```bash
bash <path/to/this/repo>/make-links.sh
```

Modify copied configuration files for own environment:

* `~/.gitconfig`
* `~/.gitconfig-myprofile`

## Additional settings

Disable bash session timeout (when `TMOUT` is set):

```bash
export TMOUT=0
```

Change tmux socket file location, add below to `~/.bash_profile`:

```bash
alias tmux = 'tmux -S ~/.tmux.socket
```
