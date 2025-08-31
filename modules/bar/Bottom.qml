import QtQuick
import QtQuick.Layouts
import qs.config as Cfg

Item {
  ColumnLayout {
    id: colBot
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    spacing: Cfg.Bar.data.childrenSpacing

    Rectangle {
      Layout.fillWidth: true
      implicitHeight: this.width
    }
    Rectangle {
      Layout.fillWidth: true
      implicitHeight: this.width
    }
    Rectangle {
      Layout.fillWidth: true
      implicitHeight: this.width
    }
  }
}
