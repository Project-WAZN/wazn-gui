WAZN GUI Wallet
======================

[![License](https://img.shields.io/badge/license-GPL--3.0-blue)](https://opensource.org/licenses/GPL-3.0)

## Table of Contents

- [Development resources](#development-resources)
- [Announcements](#announcements)
- [Introduction](#introduction)
- [Build Status](#build-status)
- [About this project](#about-this-project)
- [Contributing](#contributing)
- [Scheduled software upgrades](#scheduled-software-upgrades)
- [Release staging schedule and protocol](#release-staging-schedule-and-protocol)
- [Compiling WAZN from source](#compiling-wazn-from-source)
  - [Dependencies](#dependencies)
  - [Cloning the repository](#cloning-the-repository)
  - [Build instructions](#build-instructions)
- [License](#license)

## Development resources

- Web: [wazn.io](https://wazn.io)
- GitHub: [github.com/vermin/wazn-gui](https://github.com/vermin/wazn-gui)
- Mail: [dev@wazn.io](mailto:dev@wazn.io)

## Announcements

- Subscribe to our Reddit for important announcements regarding WAZN future (https://www.reddit.com/r/WAZN/)

## Introduction

WAZN is a private, secure, untraceable, decentralized digital currency. You are your bank, you control your funds, and nobody can trace your transfers unless you allow them to do so.

**Privacy:** WAZN uses a cryptographically sound system to allow you to send and receive funds without your transactions being easily revealed on the blockchain (the ledger of transactions that everyone has). This ensures that your purchases, receipts, and all transfers remain absolutely private by default.

**Security:** Using the power of a distributed peer-to-peer consensus network, every transaction on the network is cryptographically secured. Individual wallets have a 25 word mnemonic seed that is only displayed once, and can be written down to backup the wallet. Wallet files are encrypted with a passphrase to ensure they are useless if stolen.

**Untraceability:** By taking advantage of ring signatures, a special property of a certain type of cryptography, WAZN is able to ensure that transactions are not only untraceable, but have an optional measure of ambiguity that ensures that transactions cannot easily be tied back to an individual user or computer.

## Build Status

These builds are from latest release branch and available for download:

* **Sweet Chestnut GUI** [wazn-gui-v1.1.0-linux64.tar.gz](https://github.com/project-wazn/wazn/releases/download/v1.1.0/wazn-gui-v1.1.0-linux64.tar.gz)  
* **Sweet Chestnut GUI** [wazn-gui-v1.1.0-win64.zip](https://github.com/project-wazn/wazn/releases/download/v1.1.0/wazn-gui-v1.1.0-win64.zip)

| Operating System      | Processor | Status |
|-----------------------|-----------|--------|
| Win10 (MSYS2/MinGW)   |    amd64    | [![Build](https://img.shields.io/badge/passing-brightgreen)](https://github.com/project-wazn/wazn-gui/releases)
| Win10 (MSYS2/MinGW)   |    IA-32    | [![Build](https://img.shields.io/badge/failed-red)](https://github.com/project-wazn/wazn-gui/releases)
| macOS 10.13           |    amd64    | [![Build](https://img.shields.io/badge/unknown-lightgrey)](https://github.com/project-wazn/wazn-gui/releases)
| macOS 10.14           |    IA-32    | [![Build](https://img.shields.io/badge/failed-red)](https://github.com/project-wazn/wazn-gui/releases)
| Ubuntu 18.04          |    amd64    | [![Build](https://img.shields.io/badge/passing-brightgreen)](https://github.com/project-wazn/wazn-gui/releases)
| Ubuntu 18.04          |    IA-32    | [![Build](https://img.shields.io/badge/failed-red)](https://github.com/project-wazn/wazn-gui/releases)
| Ubuntu 18.04          |  ARMv8 x64  | [![Build](https://img.shields.io/badge/unknown-lightgrey)](https://github.com/project-wazn/wazn-gui/releases)
| Raspbian 9 Stretch    |  ARMv8 x64  | [![Build](https://img.shields.io/badge/failed-red)](https://github.com/project-wazn/wazn-gui/releases)

## About this project

This is the GUI for the [core WAZN implementation](https://github.com/project-wazn/wazn). It is open source and completely free to use without restrictions, except for those specified in the license agreement below. There are no restrictions on anyone creating an alternative implementation of WAZN that uses the protocol and network in a compatible manner.

As with many development projects, the repository on Github is considered to be the "staging" area for the latest changes. Before changes are merged into that branch on the main repository, they are tested by individual developers in their own branches, submitted as a pull request, and then subsequently tested by contributors who focus on testing and code reviews. That having been said, the repository should be carefully considered before using it in a production environment, unless there is a patch in the repository for a particular show-stopping issue you are experiencing. It is generally a better idea to use a tagged release for stability.

**Anyone is welcome to contribute to WAZN's codebase!** If you have a fix or code change, feel free to submit it as a pull request directly to the "master" branch. In cases where the change is relatively small or does not affect other parts of the codebase it may be merged in immediately by any one of the collaborators. On the other hand, if the change is particularly large or complex, it is expected that it will be discussed at length either well in advance of the pull request being submitted, or even directly on the pull request.

## Contributing

If you want to help out, see [CONTRIBUTING](CONTRIBUTING.md) for a set of guidelines.

## Compiling the WAZN GUI Wallet from source

### On Linux:

(Tested on Ubuntu 17.10 x64, Ubuntu 18.04 x64 and Gentoo x64)

1. Install WAZN dependencies

  - For Debian distributions (Debian, Ubuntu, Mint, Tails...)

	`sudo apt install build-essential cmake libboost-all-dev miniupnpc libunbound-dev graphviz doxygen libunwind8-dev pkg-config libssl-dev libzmq3-dev libsodium-dev libhidapi-dev`

  - For Gentoo

	`sudo emerge app-arch/xz-utils app-doc/doxygen dev-cpp/gtest dev-libs/boost dev-libs/expat dev-libs/openssl dev-util/cmake media-gfx/graphviz net-dns/unbound net-libs/ldns net-libs/miniupnpc net-libs/zeromq sys-libs/libunwind dev-libs/libsodium dev-libs/hidapi`

2. Install Qt:

  *Note*: Qt 5.7 is the minimum version required to build the GUI. This makes **some** distributions (mostly based on debian, like Ubuntu 16.x or Linux Mint 18.x) obsolete. You can still build the GUI if you install an [official Qt release](https://wiki.qt.io/Install_Qt_5_on_Ubuntu), but this is not officially supported.

  - For Ubuntu 17.10+

    `sudo apt install qtbase5-dev qt5-default qtdeclarative5-dev qml-module-qtquick-controls qml-module-qtquick-controls2 qml-module-qtquick-dialogs qml-module-qtquick-xmllistmodel qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel qttools5-dev-tools qml-module-qtquick-templates2`

  - For Gentoo

    `sudo emerge dev-qt/qtcore:5 dev-qt/qtdeclarative:5 dev-qt/qtquickcontrols:5 dev-qt/qtquickcontrols2:5 dev-qt/qtgraphicaleffects:5`

  - Optional : To build the flag `WITH_SCANNER`

    - For Ubuntu

      `sudo apt install qtmultimedia5-dev qml-module-qtmultimedia libzbar-dev`

    - For Gentoo

      The *qml* USE flag must be enabled.

      `emerge dev-qt/qtmultimedia:5 media-gfx/zbar`


3. Clone repository

    `git clone https://github.com/project-wazn/wazn-gui`

4. Build

    ```
    cd wazn-gui
    QT_SELECT=5 ./build.sh
    ```

The executable can be found in the build/release/bin folder.

### On OS X:

1. Install Xcode from AppStore

2. Install [homebrew](http://brew.sh/)

3. Install [WAZN](https://github.com/project-wazn/wazn) dependencies:

  `brew install boost --c++11`

  `brew install openssl` - to install openssl headers

  `brew install pkgconfig`

  `brew install cmake`

  `brew install zeromq`

  *Note*: If cmake can not find zmq.hpp file on OS X, installing `zmq.hpp` from https://github.com/zeromq/cppzmq to `/usr/local/include` should fix that error.

4. Install Qt:

  `brew install qt5`  (or download QT 5.8+ from [qt.io](https://www.qt.io/download-open-source/))

  If you have an older version of Qt installed via homebrew, you can force it to use 5.x like so:

  `brew link --force --overwrite qt5`

5. Add the Qt bin directory to your path

    Example: `export PATH=$PATH:$HOME/Qt/5.8/clang_64/bin`

    This is the directory where Qt 5.x is installed on **your** system

6. Grab an up-to-date copy of the wazn-gui repository

  `git clone https://github.com/project-wazn/wazn-gui.git`

7. Go into the repository

  `cd wazn-gui`

8. Start the build

  `./build.sh`

The executable can be found in the `build/release/bin` folder.

**Note:** Workaround for "ERROR: Xcode not set up properly"

Edit `$HOME/Qt/5.8/clang_64/mkspecs/features/mac/default_pre.prf`

replace
`isEmpty($$list($$system("/usr/bin/xcrun -find xcrun 2>/dev/null")))`

with
`isEmpty($$list($$system("/usr/bin/xcrun -find xcodebuild 2>/dev/null")))`

More info: http://stackoverflow.com/a/35098040/1683164


### On Windows:

The WAZN GUI Wallet on Windows is 64 bits only; 32-bit Windows GUI builds are not officially supported anymore.

1. Install [MSYS2](https://www.msys2.org/), follow the instructions on that page on how to update system and packages to the latest versions

2. Open an 64-bit MSYS2 shell: Use the *MSYS2 MinGW 64-bit* shortcut, or use the `msys2_shell.cmd` batch file with a `-mingw64` parameter

3. Install MSYS2 packages for WAZN dependencies; the needed 64-bit packages have `x86_64` in their names

    ```
    pacman -S mingw-w64-x86_64-toolchain make mingw-w64-x86_64-cmake mingw-w64-x86_64-boost mingw-w64-x86_64-openssl mingw-w64-x86_64-zeromq mingw-w64-x86_64-libsodium mingw-w64-x86_64-hidapi
    ```

    You find more details about those dependencies in the [WAZN documentation](https://github.com/project-wazn/wazn). Note that that there is no more need to compile Boost from source; like everything else, you can install it now with a MSYS2 package.

4. Install Qt5

    ```
    pacman -S mingw-w64-x86_64-qt5
    ```

    There is no more need to download some special installer from the Qt website, the standard MSYS2 package for Qt will do in almost all circumstances.

    **Note:** There is a known issue that GUI won't lauch properly when building tag v0.13.0.3 with Qt 5.11.2.

    If your encounter issue with that, please remove current Qt by: `pacman -R mingw-w64-x86_64-qt5`

    And install 5.11.1 instead by: `pacman -U http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-qt5-5.11.1-3-any.pkg.tar.xz`

5. Install git

    ```
    pacman -S git
    ```

6. Clone repository

    ```
    git clone https://github.com/project-wazn/wazn-gui.git
    ```

7. Build

    ```
    cd wazn-gui
    source ./build.sh release-static
    cd build
    make deploy
    ```

**Note:** The use of `source` above is a dirty workaround for a suspected bug in the current QT version 5.11.2-3 available in the MSYS2 packaging system, see https://github.com/monero-project/monero-gui/issues/1559 for more info.

The executable can be found in the `.\release\bin` directory.


## License
```
Licensed under the GPL-3.0
Copyright (c) 2019 WAZN Project  
Copyright (c) 2018-2019 uPlexa  
Copyright (c) 2014-2018 The Monero Project  
Copyright (c) 2012-2013 The Cryptonote developers
```
