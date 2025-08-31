import QtQuick
import QtQuick.Layouts

import qs.components as Cmp
import qs.config as Cfg
import qs.data as Dat

Child {
  Layout.fillWidth: true
  implicitHeight: this.width * 2.4

  ColumnLayout {
    spacing: 2
    anchors.fill: parent
    anchors.topMargin: 4
    anchors.bottomMargin: 4
    Cmp.CircularProgress {
      rotation: -180
      Layout.alignment: Qt.AlignCenter
      size: 28
      value: Dat.Resources.cpuUsage
      primaryColor: Cfg.Colors.data.lavender
    }
    Item {
      Layout.fillWidth: true
      implicitHeight: 10
      Cmp.StyledText {
        anchors.centerIn: parent
        color: Cfg.Colors.data.text
        text: (Dat.Resources.cpuUsage * 100).toFixed(0) + "%"
        font.pointSize: 11
      }
    }
    Cmp.CircularProgress {
      Layout.topMargin: 2
      rotation: -180
      Layout.alignment: Qt.AlignCenter
      size: 28
      value: Dat.Resources.memUsage
      primaryColor: Cfg.Colors.data.blue
    }
  }
}
