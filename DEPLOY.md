# macOS:

Use macOS 10.12 - 10.13 for better backwards compability.

1. `HOMEBREW_OPTFLAGS="-march=core2" HOMEBREW_OPTIMIZATION_LEVEL="O0" brew install boost zmq libpgm miniupnpc libsodium expat libunwind-headers protobuf libgcrypt hidapi`

2. Get the latest LTS from here: https://www.qt.io/offline-installers and install

3. `git clone --recursive -b v0.X.Y.Z --depth 1 https://github.com/project-wazn/wazn-gui`

4. `CMAKE_PREFIX_PATH=~/Qt5.12.8/5.12.8/clang_64 make release`

5. `cd build/release && make deploy`

6. Replace the `waznd` binary inside `wazn-wallet-gui.app/Contents/MacOS/` with one built using deterministic builds / gitian.

## Codesigning and notarizing

1. Save the following text as `entitlements.plist`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
        <key>com.apple.security.cs.disable-executable-page-protection</key>
        <true/>
</dict>
</plist>
```

2. `codesign --deep --force --verify --verbose --options runtime --timestamp --entitlements entitlements.plist --sign 'XXXXXXXXXX' wazn-wallet-gui.app`

You can check if this step worked by using `codesign -dvvv wazn-wallet-gui.app`

3. `hdiutil create -fs HFS+ -srcfolder wazn-gui-v0.X.Y.Z -volname wazn-wallet-gui wazn-gui-mac-x64-v0.X.Y.Z.dmg`

4. `xcrun altool -t osx --file wazn-gui-mac-x64-v0.X.Y.Z.dmg --primary-bundle-id io.project-wazn.wazn-wallet-gui.dmg --notarize-app --username email@address.org`

5. `xcrun altool --notarization-info aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeee -u email@address.org`

6. `xcrun stapler staple -v wazn-gui-mac-x64-v0.X.Y.Z.dmg`
