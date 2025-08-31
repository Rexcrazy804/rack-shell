pragma Singleton
import Quickshell
import Quickshell.Io

import qs.data as Dat
import qs.config as Cfg

Singleton {
  property alias data: adapter

  // maybe this should be a generic?
  FileView {
    path: Dat.Paths.config + "/bar.json"
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
      property int barWidth: 50
      property int barRadius: 10
      property string barColor: Cfg.Colors.data.base
      property int barMargin: 4
    }
  }
}
