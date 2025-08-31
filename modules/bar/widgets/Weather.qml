import QtQuick
import QtQuick.Layouts

import qs.components as Cmp
import qs.config as Cfg

Child {
  Layout.fillWidth: true
  implicitHeight: this.width * 1.4

  Item {
    anchors.fill: parent
    anchors.margins: 5

    Cmp.StyledText {
      anchors.right: parent.right
      anchors.top: parent.top
      color: Cfg.Colors.data.text
      text: "󰖨"
      font.pointSize: 11
    }

    // TODO complete logic for getting weather information
    Cmp.StyledText {
      anchors.left: parent.left
      anchors.bottom: parent.bottom
      color: Cfg.Colors.data.text
      text: "50°"
      font.pointSize: 12
    }
  }
}
