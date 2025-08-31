pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

import qs.config as Cfg

Singleton {
  id: root
  property real temperature
  property var jsonData
  property var cfg: Cfg.General.widgets.weather

  readonly property real lat: cfg.latitude
  readonly property real lon: cfg.longitude

  Process {
    id: getProc
    running: true
    command: ["curl", `https://api.open-meteo.com/v1/forecast?latitude=${root.lat}&longitude=${root.lon}&current=temperature_2m&timezone=auto`]
    stdout: StdioCollector {
      onStreamFinished: root.jsonData = JSON.parse(data)
    }
  }

  onLatChanged: getProc.running = true
  onLonChanged: getProc.running = true
  onJsonDataChanged: {
    temperature = jsonData.current.temperature_2m;
  }

  Timer {
    interval: root.cfg.interval_m * 60 * 100
    onTriggered: getProc.running = true
  }
}
