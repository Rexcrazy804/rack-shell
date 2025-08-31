import QtQuick
import QtQuick.Layouts

import qs.components as Cmp
import qs.config as Cfg
import qs.data as Dat

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
      text: Dat.Weather.temperature.toFixed(0) +  "°"
      font.pointSize: 12
    }
  }
}
