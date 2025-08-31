import QtQuick
import QtQuick.Layouts

import qs.components as Cmp
import qs.config as Cfg
import qs.data as Dat

Child {
  Layout.fillWidth: true
  implicitHeight: col.implicitHeight + 8

  component StyledProgress: Cmp.CircularProgress {
    rotation: -180
    size: 28
    primaryColor: Cfg.Colors.data.lavender
    secondaryColor: Cfg.Colors.data.mantle
  }

  ColumnLayout {
    id: col
    spacing: 5
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter

    StyledProgress {
      Layout.alignment: Qt.AlignCenter
      value: Dat.Resources.cpuUsage
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
    StyledProgress {
      Layout.topMargin: 2
      Layout.alignment: Qt.AlignCenter
      value: Dat.Resources.memUsage
      primaryColor: Cfg.Colors.data.blue
    }
  }
}
