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
    implicitWidth: Cfg.General.bar.width

    WlrLayershell.namespace: `${Dat.Paths.shellName}.bar.quickshell`
    WlrLayershell.exclusionMode: ExclusionMode.Auto
    WlrLayershell.layer: WlrLayer.Top

    Item {
      anchors.margins: Cfg.General.bar.margin
      // FIXME uncomment the bellow line, it looks ugly with my hyprconfig
      // anchors.rightMargin: 0
      anchors.fill: parent
      Rectangle {
        id: base
        radius: Cfg.General.bar.radius
        anchors.fill: parent
        color: Cfg.General.bar.color
      }

      Top {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: middleContainer.top
        anchors.margins: 4
      }
      Center {
        id: middleContainer
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 4
      }
      Bottom {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: middleContainer.bottom
        anchors.margins: 4
      }
    }
  }
}
