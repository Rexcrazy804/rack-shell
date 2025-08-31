import QtQuick
import QtQuick.Layouts

import qs.config as Cfg
import qs.modules.bar.widgets as Wid

Item {
  ColumnLayout {
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    spacing: Cfg.General.child.spacing

    Wid.Launcher {}
    Wid.CpuNMem {}
    Wid.Weather {}
  }
}
