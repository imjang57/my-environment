# Mac OS Initial Settings

## Keyboard notation

* `CONTROL + b, c`는 `CONTROL` 키를 누른 상태에서 `b`를 누르고, `CONTROL` 키와 `b`에서 손을 뗀 후 `c`를 누르라는 의미이다.
* `CONTROL + b, CONTROL + c`는 `CONTROL` 키를 누른 상태에서 `b`를 누르고, `b`에서 손을 뗀 후 `c`를 누르라는 의미이다.
* `CTRL`, `CONTROL`은 같은 키를 의미한다.
* `OPT`, `OPTION`은 같은 키를 의미한다.
* `CMD`, `COMMAND`는 같은 키를 의미한다.

## Mac OS System Preferences

* `General` > `Login Items & Extensions` > Add items such as Bitwarden, Rectangle, and etc
* `Control Center` > customize Control Center and menu bar
* `Desktop & Dock` > `Dock` > disable `Show suggested and recent app in Dock`
* `Desktop & Dock` > `Mission Control` > disable `When switching to an application, switch to a Space with open windows for the application`
* `Desktop & Dock` > `Mission Control` > enable `Displays have separate Spaces`
* `Desktop & Dock` > `Mission Control` > enable `Group windows by application`
* `Desktop & Dock` > `Hot Corners` > Set `Left bottom` to `Mission Control`
* `Desktop & Dock` > `Hot Corners` > Set `Right bottom` to `Mission Control`
* `Spotlight` > `Search Results` > disable unnecessary search results
* `Lock Screen` > `Require password` > `immediately`
* `Lock Screen` > `Show a message when the screen is locked` > input phone number, e-mail address, name, etc
* `Keyboard` > `Text` > disable all automatic and smart options
* `Keyboard` > `Keyboard Shortcuts` > `Mission Control` > `Mission Control` > set to `CTRL + F3`
* `Keyboard` > `Keyboard Shortcuts` > `Mission Control` > `Show Destop` > set to `CTRL + F4`
* `Keyboard` > `Keyboard Shortcuts` > `Mission Control` > `Move left a Space` > set to `CTRL + F1`
* `Keyboard` > `Keyboard Shortcuts` > `Mission Control` > `Move right a Space` > set to `CTRL + F2`
* `Keyboard` > `Keyboard Shortcuts` > `Keyboard` > `Move focus to next window` > set to `CMD + ```````
* `Keyboard` > `Keyboard Shortcuts` > `Input Source` > `Select the previous input source` > set to `CTRL + SPACE`
* `Keyboard` > `Keyboard Shortcuts` > `Input Source` > `Select next source in input menu` > set to `CTRL + OPTION + SPACE`
* `Keyboard` > `Keyboard Shortcuts` > `Screenshots` > `Save picture of screen as a file` > set to `CMD + SHIFT + 3`
* `Keyboard` > `Keyboard Shortcuts` > `Screenshots` > `Save picture of screen to the clipboard` > set to `CMD + CTRL + SHIFT + 3`
* `Keyboard` > `Keyboard Shortcuts` > `Screenshots` > `Save picture of selected area as a file` > set to `CMD + SHIFT + 4`
* `Keyboard` > `Keyboard Shortcuts` > `Screenshots` > `Save picture of selected area to the clipboard` > set to `CMD + CTRL + SHIFT + 4`
* `Keyboard` > `Keyboard Shortcuts` > `Screenshots` > `Screenshot and recording options` > set to `CMD + SHIFT + 5`
* `Keyboard` > `Keyboard Shortcuts` > `Spotlight` > `Show Spotlight search` > set to `CMD + SPACE`
* `Keyboard` > `Keyboard Shortcuts` > `Spotlight` > `Show Finder search window` > set to `CMD + OPT + SPACE`
* `Keyboard` > `Keyboard Shortcuts` > `Function Keys` > `Use F1, F2, etc. keys as standard function keys`
* `Keyboard` > `Keyboard Shortcuts` > `Modifier Keys...` > Select profer keyboard > `Caps Lock Key` > set to `Control`
* `Keyboard` > `Keyboard Shortcuts` > Disable all other shortcuts
* `Trackpad` > `Point & Click` > `Tab to click`

## Mac OS Finder Preferences

* `General` > `New Finder windows show:` > my home directory
* `Advanced` > check `Show all filename extensions`
* `Sidebar` > `Favorites` > check my home directory and others according to needs

## Install Authentication Application

Install from Mac OS App Store:

* Bitwarden
    - [Home page](https://bitwarden.com/)
    - [App Store link](https://apps.apple.com/kr/app/bitwarden/id1352778147?l=en&mt=12)

## Install Xcode Command Line Tools

Xcode를 설치해야 ***gcc*** 등의 개발 도구를 사용할 수 있다. Xcode 전체를 설치할 필요가 없다면 ***Xcode Command Line Tools***만 따로 설치할 수도 있다.

```
xcode-select --install
```

참고로 Mac 에서는 ***gcc***가 아니라 ***llvm***을 사용한다. ***gcc*** 명령을 실행하면 실제로는 ***llvm***의 C언어 front-end인 ***clang*** 명령이 실행된다.

## Install Homebrew

Homebrew:

* [Web site](https://brew.sh/)
* [GitHub](https://github.com/Homebrew/brew)

Homebrew는 Mac에서 패키지 설치와 관리를 쉽게 해주는 도구이다. 다양한 개발 도구들을 쉽게 구성할 수 있다.

* 다양한 프로그램 패키지들을 자동으로 매우 쉽게 설치/삭제/업그레이드 할 수 있다.
* 자동으로 의존성 관리를 해준다.
* 패키지와 관련된 파일들을 특정한 위치 (default prefix : `/opt/homebrew/Cellar`) 아래에 모두 설치하여 관리가 쉽고 설정이 꼬이는 경우가 적다.
* 필요한 경우 formula(Homebrew 에서 하나의 패키지를 나타내는 단위)를 직접 작성하여 추가할 수 있다.
* Git 과 Ruby 만 설치되어 있으면 동작한다.

Homebrew 설치:

```
> /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

> echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/youngho/.bash_profile
> eval "$(/opt/homebrew/bin/brew shellenv)"

> /opt/homebrew/bin/brew shellenv
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

> brew help
```

Homebrew update:

```
> brew update
```

Remove unused packages:

```
# Remove all the hanging, no longer needed packages, unneeded dependencies
> brew autoremove

# Remove downloads for outdated formulas and casks
> brew cleanup
```

Show brew help:

```
> brew help <command>
```

## Install Packages

Install basic modules:

```
# Install basic CLI tools.
brew install gcc bash git vim gnupg pinentry-mac tree findutils
brew install wget httpie iproute2mac

# Install basic MacOS Applications.
brew install --cask rectangle

# Install collaboration tools
brew install --cask slack

# Install dev tools
brew install --cask iterm2 visual-studio-code
```

Make  bash as default shell:

```
# Check newly installed bash
/opt/homebrew/bin/bash --version

# Add new installed bash shell to shell list in /etc/shells file
sudo bash -c 'echo /opt/homebrew/bin/bash >> /etc/shells'

# Change default login shell to new installed bash shell
chsh -s /opt/homebrew/bin/bash

# Check current shell after re-login
echo $SHELL
```

Make tools installed by `findutils` as default command adding below to `.bash_profile`:

```
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
```

Install [D2Coding font](https://github.com/naver/d2codingfont):

```
brew install font-d2coding
```

Alternative font: [Ubuntu Mono derivative Powerline](https://github.com/powerline/fonts/tree/master/UbuntuMono)

### Rectangle Window Manager settings

Related resources:

* web site : [https://rectangleapp.com](https://rectangleapp.com/)
* Github : [https://github.com/rxhanson/Rectangle](https://github.com/rxhanson/Rectangle)

Add Rectangle to Accessibility Application list:

* `Security & Privacy` > `Accessibility` > Add Rectangle to list

My Key settings:

* `Control + Option + Command + f`: Maximize
* `Control + Option + Command + h`: Left Half
* `Control + Option + Command + j`: Top Half
* `Control + Option + Command + k`: Bottom Half
* `Control + Option + Command + l`: Right Half
* `Control + Option + Command + u`: Upper Left
* `Control + Option + Command + i`: Upper Right
* `Control + Option + Command + m`: Lower Left
* `Control + Option + Command + ,`: Lower` Right
* `Control + Option + Command + ]`: Make Larger
* `Control + Option + Command + [`: Make Smaller
* `Control + Option + Command + Right Arrow`: Next Display
* `Control + Option + Command + Left Arrow`: Previous Display
* Disable others

Preferences:

* Check `Launch on login`
* Repeated commands > Select `cycle sizes on half actions`
* Uncheck `Snap windows by dragging`
* Uncheck `Restore window size when unsnapped`

### iTerm2 Settings

To use bash shell shortcuts in emacs mode, map `OPTION` Key to `META` key which is `ALT` key in linux:

1. `CMD + ,` to open iTerm2 preferences.
2. Go to `Profiles` tab.
3. Select profile to edit.
4. Go to `Keys` tab.
5. Choose `Left/Right Option Key` as `Esc+`.

Preferences(`COMMAND + ,`):

* `Profiles` > select profile > `Terminal` > `Scrollback Buffer` > check `Unlimited scrollback`
* `Preferences` > select profile > `Profiles` > `Colors` > `Color Presets` > Select `Tango Dark`
* `Preferences` > select profile > `Profiles` > `Text` > `Font` > Select `D2 Coding`
* `Preferences` > select profile > `Profiles` > `Text` > `Font` > Set text size to `13`
* `Preferences` > select profile > `Window` > Set `Columns` to `120`, `Rows` to `30`

## Setting Java Development Environment

Install [SDKMAN](https://sdkman.io/):

```
curl -s "https://get.sdkman.io" | bash
source "/Users/imjang57/.sdkman/bin/sdkman-init.sh"
sdk list java
```

Install Java 22 Eclipse Temurin JDK:

```
sdk install java 21.0.6-tem
sdk current
```

Switch Java version:

```
sdk use java 22.0.1-tem
```

Set default java version:

```
sdk default java 22.0.1-tem
```

Install other JDK-based components:

```
sdk install maven
sdk install gradle
sdk install scala
sdk install sbt
```
