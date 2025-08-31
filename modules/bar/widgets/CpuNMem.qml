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

  component Label: Item {
    required property real usage
    Layout.fillWidth: true
    implicitHeight: 10
    Cmp.StyledText {
      anchors.centerIn: parent
      color: Cfg.Colors.data.text
      text: (parent.usage * 100).toFixed(0) + "%"
      font.pointSize: 11
    }
  }

  ColumnLayout {
    id: col
    spacing: Cfg.General.widgets.cpuNmem.spacing
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter

    StyledProgress {
      Layout.alignment: Qt.AlignCenter
      value: Dat.Resources.cpuUsage
    }

    Label {
      visible: Cfg.General.widgets.cpuNmem.showCpuLabel
      usage: Dat.Resources.cpuUsage
    }

    StyledProgress {
      Layout.topMargin: 2
      Layout.alignment: Qt.AlignCenter
      value: Dat.Resources.memUsage
      primaryColor: Cfg.Colors.data.blue
    }

    Label {
      visible: Cfg.General.widgets.cpuNmem.showMemLabel
      usage: Dat.Resources.memUsage
    }
  }
}
