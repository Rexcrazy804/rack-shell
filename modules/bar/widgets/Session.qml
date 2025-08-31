import QtQuick
import QtQuick.Layouts

import qs.components as Cmp
import qs.config as Cfg

Child {
  Layout.fillWidth: true
  implicitHeight: this.width * 1.1

  Cmp.StyledText {
    color: Cfg.Colors.data.red
    anchors.centerIn: parent
    text: "󰐥"
  }
}
