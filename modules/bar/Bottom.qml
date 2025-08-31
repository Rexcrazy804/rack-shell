import QtQuick
import QtQuick.Layouts

import qs.config as Cfg
import qs.modules.bar.widgets as Wid

Item {
  ColumnLayout {
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    spacing: Cfg.General.child.spacing

    Wid.Time {}
    Wid.Session {}
  }
}
