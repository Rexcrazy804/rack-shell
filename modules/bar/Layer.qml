import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.data as Dat
import qs.config as Cfg

Variants {
  model: Quickshell.screens
  PanelWindow {
    required property ShellScreen modelData
    screen: modelData
    anchors {
      left: true
      bottom: true
      top: true
    }

    color: "transparent"
    // FIXME I eyeballed the width (ts gives me cancer / I couldn't find the width)
    implicitWidth: 60

    WlrLayershell.namespace: `${Dat.Paths.shellName}.bar.quickshell`
    WlrLayershell.exclusionMode: ExclusionMode.Auto
    WlrLayershell.layer: WlrLayer.Top

    Item {
      anchors.margins: 8
      anchors.fill: parent
      Rectangle {
        radius: 13
        anchors.fill: parent
        color: Cfg.Colors.data.base
      }
    }
  }
}
