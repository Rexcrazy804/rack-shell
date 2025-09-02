import QtQuick
import QtQuick.Layouts

import qs.components as Cmp
import qs.config as Cfg
import qs.data as Dat

Child {
  Layout.fillWidth: true
  implicitHeight: this.width * 1.8

  // FIXME eyeballed might need adjustments
  component TimeText: Cmp.StyledText {
    required property string time
    color: Cfg.Colors.data.text
    text: time
    font.pointSize: 14
    font.styleName: "Bold"
    horizontalAlignment: Text.AlignHCenter
  }

  TimeText {
    readonly property int hour: parseInt(Qt.formatDateTime(Dat.SysClock.date, "hh"))
    readonly property bool use24h: Cfg.General.widgets.time.use24hfmt
    time: (use24h) ? hour : (hour === 12 || hour === 24) ? 12 : hour % 12
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: center.top
  }

  // NOTE we could use layouts to avoid this
  // but anchors perform better than layouts
  Item {
    id: center
    anchors.centerIn: parent
  }

  TimeText {
    time: Qt.formatDateTime(Dat.SysClock.date, "mm")
    anchors.top: center.bottom
    anchors.left: parent.left
    anchors.right: parent.right
  }
}
