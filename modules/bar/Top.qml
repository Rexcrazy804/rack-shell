import QtQuick
import QtQuick.Layouts
import qs.config as Cfg

Item {
  ColumnLayout {
    id: col
    anchors.top: parent.top
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
