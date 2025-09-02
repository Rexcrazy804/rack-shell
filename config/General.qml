pragma Singleton
import Quickshell
import Quickshell.Io

import qs.data as Dat
import qs.config as Cfg

Singleton {
  property alias data: adapter
  property alias bar: bar
  property alias child: child
  property alias widgets: widgets

  // maybe this should be a generic?
  FileView {
    path: Dat.Paths.config + "/general.json"
    watchChanges: true
    onAdapterUpdated: writeAdapter()
    onFileChanged: reload()

    onLoadFailed: err => {
      if (err == FileViewError.FileNotFound) {
        writeAdapter();
      }
    }

    // FIXME adjust these defaults I fucking eyeballed it alright?
    JsonAdapter {
      id: adapter
      property JsonObject bar: JsonObject {
        id: bar
        property int width: 50
        property int radius: 10
        property int margin: 4
        property string color: Cfg.Colors.data.base

        property int workspaceCount: 7
      }

      property JsonObject child: JsonObject {
        id: child
        property int margin: 5
        property int spacing: 8
        property int radius: 10
        property string color: Cfg.Colors.data.surface0
      }

      property JsonObject widgets: JsonObject {
        id: widgets
        property JsonObject cpuNmem: JsonObject {
          property int spacing: 5
          property bool showCpuLabel: true
          property bool showMemLabel: false
        }

        property JsonObject weather: JsonObject {
          property real longitude: 127.8014
          property real latitude: 26.3358
          property int interval_m: 10
        }
        property JsonObject time: JsonObject {
          property bool use24hfmt: true
        }
      }
    }
  }
}
