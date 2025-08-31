pragma Singleton
import Quickshell

Singleton {
  id: root

  // FIXME change name as desired
  readonly property string shellName: "rack-shell"
  readonly property string cache: `${Quickshell.env("XDG_CACHE_HOME")}/${shellName}`
  readonly property string config: `${Quickshell.env("XDG_CONFIG_HOME")}/${shellName}`
}
