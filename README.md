# my-environment

Repository for my bash environment for Linux and MacOS.

## Prepare for Mac OS

Homebrew must be installed first.

Below command installs Homebrew under `/opt/homebrew/` path:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/imjang57/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/imjang57/.bash_profile
```

Refer http://brew.sh or https://github.com/Homebrew/brew for details.

Install bash:

```
brew install bash

# Add "/opt/homebrew/bin/bash" to /etc/shells file.
sudo bash -c 'echo /opt/homebrew/bin/bash >> /etc/shells'

# And run below command
chsh -s /opt/homebrew/bin/bash

# And re-open terminal then new Bash session will be opened.
# Check current shell after re-login
echo $SHELL
```

## Setting basic local shell environment

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

## GPG key import

Download my GPG Key files and import GPG Key to gpg database:

```
gpg --import <my-secret-key-file>
```

Refer [GnuPG](manual/gpg.md) for details.

## Install packages

Run install script:

```bash
brew install git
bash <path/to/this/repo>/bash/install-all.sh
```

## Additional terminal settings

Disable bash session timeout (when `TMOUT` is set):

```bash
export TMOUT=0
```

Change tmux socket file location, add below to `~/.bash_profile`:

```bash
alias tmux = 'tmux -S ~/.tmux.socket
```

## Miscellaneous

Mac OS:

* [Mac OS Initial Settings](manual/macos/mac_os_initial_settings.md)
* [Apps for Mac OS](manual/macos/apps_for_mac_os.md)
