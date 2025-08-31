import QtQuick

Text {
  // FIXME select your font and adjust hinting and whatever else
  // maybe I should make a general.json for storing generic config?
  font.family: "Iosevka"
  font.hintingPreference: Font.PreferFullHinting
  renderType: Text.NativeRendering
}
