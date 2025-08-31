pragma Singleton
import Quickshell
import Quickshell.Io

import qs.data as Dat
import qs.config as Cfg

Singleton {
  property alias data: adapter

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
        property int width: 50
        property int radius: 10
        property int margin: 4
        property string color: Cfg.Colors.data.base

        property int workspaceCount: 7
      }

      property JsonObject child: JsonObject {
        property int margin: 5
        property int spacing: 8
        property int radius: 10
        property string color: Cfg.Colors.data.surface0
      }
    }
  }
}
