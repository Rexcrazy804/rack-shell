import QtQuick
import QtQuick.Layouts
import qs.config as Cfg

Item {
  height: col.implicitHeight

  ColumnLayout {
    id: col
    visible: false
    anchors.fill: parent
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
