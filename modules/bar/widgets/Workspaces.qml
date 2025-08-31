import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import qs.config as Cfg

Repeater {
  model: 7
  delegate: Rectangle {
    required property int modelData
    property bool active: (Hyprland.focusedWorkspace?.id - 1 ?? 0) == modelData
    color: active ? Cfg.Colors.data.blue : Cfg.Colors.data.text
    Layout.alignment: Qt.AlignHCenter
    implicitWidth: 12
    implicitHeight: this.implicitWidth * (active ? 2 : 1)
    radius: this.implicitWidth

    Behavior on implicitHeight {
      NumberAnimation {
        duration: 100
      }
    }
  }
}
