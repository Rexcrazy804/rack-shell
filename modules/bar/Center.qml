import QtQuick
import QtQuick.Layouts

import qs.config as Cfg
import qs.modules.bar.widgets as Wid

Item {
  height: col.implicitHeight

  ColumnLayout {
    id: col
    anchors.fill: parent
    spacing: Cfg.Bar.data.childrenSpacing

    Wid.Workspaces {}
  }
}
