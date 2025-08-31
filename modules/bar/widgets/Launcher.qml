import QtQuick
import QtQuick.Layouts

import qs.components as Cmp
import qs.config as Cfg

Child {
  Layout.fillWidth: true
  implicitHeight: this.width * 1.1

  Rectangle {
    opacity: (mArea.containsMouse) ? (mArea.containsPress) ? 0.08 : 0.1 : 0
    anchors.fill: parent
    radius: parent.radius
    color: icon.color
  }

  Cmp.StyledText {
    id: icon
    color: Cfg.Colors.data.text
    anchors.centerIn: parent
    text: "󱢦"
  }

  MouseArea {
    id: mArea
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    // FIXME
    // do something on launch
    onPressed: console.log("I've been touched :>")
  }
}
