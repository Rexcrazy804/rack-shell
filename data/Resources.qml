// basically imported my resources.qml but chopped it down and improved things
pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root

  property alias cpu: cpuInfo
  property alias mem: memInfo

  readonly property real cpuUsage: 1 - (cpu.idleSec / cpu.totalSec)
  readonly property real memUsage: (1 - (mem.free / mem.total))

  // stolen from what friday stole from pterror
  FileView {
    id: cpuInfo

    property int idle
    property int idleSec
    property int total
    property int totalSec

    path: "/proc/stat"

    onLoaded: {
      const data = cpuInfo.text();
      if (!data) {
        return;
      }
      const cpuText = data.match(/^.+/)[0];
      const [user, nice, system, newIdle, iowait, irq, softirq, steal, guest, guestNice] = cpuText.match(/\d+/g).map(Number);
      const newTotal = user + nice + system + newIdle + iowait + irq + softirq + steal + guest + guestNice;
      cpuInfo.idleSec = newIdle - cpuInfo.idle;
      cpuInfo.totalSec = newTotal - cpuInfo.total;
      cpuInfo.idle = newIdle;
      cpuInfo.total = newTotal;
    }
  }

  // also stolen https://github.com/FridayFaerie/quickshell/blob/main/io/External.qml
  FileView {
    id: memInfo

    property int free
    property int total

    path: "/proc/meminfo"

    onLoaded: {
      const text = memInfo.text();
      if (!text) {
        return;
      }

      memInfo.total = Number(text.match(/MemTotal: *(\d+)/)[1] ?? 1);
      memInfo.free = Number(text.match(/MemAvailable: *(\d+)/)[1] ?? 0);
    }
  }

  Timer {
    interval: 1000
    repeat: true
    running: true

    onTriggered: {
      cpuInfo.reload();
      memInfo.reload();
    }
  }
}
