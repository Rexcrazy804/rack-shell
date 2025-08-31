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
    implicitWidth: Cfg.Bar.data.barWidth

    WlrLayershell.namespace: `${Dat.Paths.shellName}.bar.quickshell`
    WlrLayershell.exclusionMode: ExclusionMode.Auto
    WlrLayershell.layer: WlrLayer.Top

    Item {
      anchors.margins: Cfg.Bar.data.barMargin
      // FIXME uncomment the bellow line, it looks ugly with my hyprconfig
      // anchors.rightMargin: 0
      anchors.fill: parent
      Rectangle {
        id: base
        radius: Cfg.Bar.data.barRadius
        anchors.fill: parent
        color: Cfg.Bar.data.barColor
      }
    }
  }
}
