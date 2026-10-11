# apps.nix

Every app in the [ruby-gtk-project](https://github.com/ruby-gtk-project) port
campaign as a Nix package — each one a Ruby GTK4 / Libadwaita port of a GNOME
app, built by its own fork's flake.

```console
$ nix run github:ruby-gtk-project/apps.nix#commit-rb
$ nix shell github:ruby-gtk-project/apps.nix#gnome-mahjongg-rb
```

Attribute names are the gem names, so `nix run .#commit-rb` is the same app
`gem install commit-rb` gives you.

## Use it

```nix
{
  inputs.ruby-gtk-apps.url = "github:ruby-gtk-project/apps.nix";

  # home-manager
  home.packages = with inputs.ruby-gtk-apps.packages.${pkgs.system}; [
    commit-rb
    gnome-mahjongg-rb
    planify-rb
  ];
}
```

Each app is whatever its fork's flake builds: a `bundlerEnv` of the port's
runtime gems — the ruby-gnome GTK4 bindings are not in nixpkgs, so they are
built from the port's own pinned `nix/gemset.nix` — wrapped with the typelib and
`XDG_DATA_DIRS` the GTK stack needs.

## How it is put together

`registry.yml` in [ruby-gtk-project/.github][hub] is the list: one entry per
app, naming the fork that holds its Ruby port and upstream's licence. Every fork
carries a flake on its `ruby` branch that outputs `packages.default` and
`apps.default`. This flake takes one input per fork and re-exports them, with
`inputs.<port>.inputs.nixpkgs.follows = "nixpkgs"` so the whole set resolves
against one nixpkgs instead of one per port.

`scripts/update.py` regenerates `flake.nix`, `apps.json` and the list below from
the registry, so adding an app to the campaign adds it here.

A port only appears in `packages` once its fork's flake builds for your system.
One that is mid-rollout stays in `apps.json` and out of `packages`, the way
krew.nix only exposes plugins with a build for your platform. `nix flake show`
tells you which is which.

[hub]: https://github.com/ruby-gtk-project/.github

## Without flakes

`overlay.nix` exposes the inventory only — the apps themselves are built by
flakes, so there is no non-flake path to a built app:

```nix
let
  apps = fetchTarball "https://github.com/ruby-gtk-project/apps.nix/archive/main.tar.gz";
  pkgs = import <nixpkgs> { overlays = [ (import (apps + "/overlay.nix")) ]; };
in
pkgs.ruby-gtk-apps        # { commit-rb = { app = "Commit"; license = ...; }; ... }
```

## Licences

Each port inherits its upstream's licence and never gets a new one, so the set
is a mix — mostly GPL-3.0-or-later and GPL-2.0-or-later, with some MIT,
Apache-2.0, BSD and CC0. The licence of each is in the table and in `apps.json`.

## Apps

<!-- BEGIN GENERATED APP LIST -->
89 apps.

| Attribute | Upstream | Port | Licence |
|---|---|---|---|
| `amberol-rb` | [Amberol](https://gitlab.gnome.org/World/amberol) | [Amberol-rb](https://github.com/ruby-gtk-project/Amberol-rb) | `GPL-3.0-or-later` |
| `apostrophe-rb` | [Apostrophe](https://github.com/ApostropheEditor/Apostrophe) | [Apostrophe-rb](https://github.com/ruby-gtk-project/Apostrophe-rb) | `GPL-3.0-or-later` |
| `audiosharing-rb` | [Audio Sharing](https://gitlab.gnome.org/World/AudioSharing) | [AudioSharing-rb](https://github.com/ruby-gtk-project/AudioSharing-rb) | `GPL-3.0-or-later` |
| `authenticator-rb` | [Authenticator](https://github.com/bilelmoussaoui/Authenticator) | [Authenticator-rb](https://github.com/ruby-gtk-project/Authenticator-rb) | `GPL-2.0-or-later` |
| `baobab-rb` | [baobab](https://github.com/GNOME/baobab) | [baobab-rb](https://github.com/ruby-gtk-project/baobab-rb) | `GPL-2.0-or-later` |
| `bazaar-rb` | [bazaar](https://github.com/bazaar-org/bazaar) | [bazaar-rb](https://github.com/ruby-gtk-project/bazaar-rb) | `GPL-3.0-or-later` |
| `biblioteca-rb` | [Biblioteca](https://github.com/workbenchdev/Biblioteca) | [Biblioteca-rb](https://github.com/ruby-gtk-project/Biblioteca-rb) | `GPL-3.0-or-later` |
| `binary-rb` | [binary](https://github.com/fizzyizzy05/binary) | [binary-rb](https://github.com/ruby-gtk-project/binary-rb) | `GPL-3.0-or-later` |
| `blanket-rb` | [blanket](https://github.com/rafaelmardojai/blanket) | [blanket-rb](https://github.com/ruby-gtk-project/blanket-rb) | `GPL-3.0-or-later` |
| `boatswain-rb` | [Boatswain](https://gitlab.gnome.org/World/boatswain) | [Boatswain-rb](https://github.com/ruby-gtk-project/Boatswain-rb) | `GPL-3.0-or-later` |
| `bobby-rb` | [Bobby](https://github.com/hbons/Bobby) | [Bobby-rb](https://github.com/ruby-gtk-project/Bobby-rb) | `GPL-3.0-or-later` |
| `bustle-rb` | [bustle](https://github.com/wjt/bustle) | [bustle-rb](https://github.com/ruby-gtk-project/bustle-rb) | `LGPL-2.1-or-later AND GPL-3.0-only` |
| `cartridges-rb` | [cartridges](https://github.com/kra-mo/cartridges) | [cartridges-rb](https://github.com/ruby-gtk-project/cartridges-rb) | `GPL-3.0-or-later` |
| `chess-clock-rb` | [Chess Clock](https://gitlab.gnome.org/World/chess-clock) | [Chess-Clock-rb](https://github.com/ruby-gtk-project/Chess-Clock-rb) | `GPL-3.0-or-later` |
| `citations-rb` | [Citations](https://gitlab.gnome.org/World/citations) | [Citations-rb](https://github.com/ruby-gtk-project/Citations-rb) | `GPL-3.0-or-later` |
| `clairvoyant-rb` | [clairvoyant](https://github.com/cassidyjames/clairvoyant) | [clairvoyant-rb](https://github.com/ruby-gtk-project/clairvoyant-rb) | `GPL-3.0-or-later` |
| `collision-rb` | [Collision](https://github.com/GeopJr/Collision) | [Collision-rb](https://github.com/ruby-gtk-project/Collision-rb) | `BSD-2-Clause` |
| `commit-rb` | [Commit](https://github.com/sonnyp/Commit) | [Commit-rb](https://github.com/ruby-gtk-project/Commit-rb) | `GPL-3.0-or-later` |
| `console-rb` | [console](https://github.com/GNOME/console) | [console-rb](https://github.com/ruby-gtk-project/console-rb) | `GPL-3.0-or-later` |
| `constrict-rb` | [Constrict](https://github.com/Wartybix/Constrict) | [Constrict-rb](https://github.com/ruby-gtk-project/Constrict-rb) | `GPL-3.0-or-later` |
| `curtail-rb` | [Curtail](https://github.com/Huluti/Curtail) | [Curtail-rb](https://github.com/ruby-gtk-project/Curtail-rb) | `GPL-3.0-or-later` |
| `decibels-rb` | [decibels](https://github.com/GNOME/decibels) | [decibels-rb](https://github.com/ruby-gtk-project/decibels-rb) | `GPL-3.0-or-later` |
| `dialect-rb` | [dialect](https://github.com/dialect-app/dialect) | [dialect-rb](https://github.com/ruby-gtk-project/dialect-rb) | `GPL-3.0-or-later` |
| `drum-machine-rb` | [drum-machine](https://github.com/Revisto/drum-machine) | [drum-machine-rb](https://github.com/ruby-gtk-project/drum-machine-rb) | `GPL-3.0-or-later` |
| `eartag-rb` | [eartag](https://github.com/serialuart/eartag) | [eartag-rb](https://github.com/ruby-gtk-project/eartag-rb) | `MIT` |
| `epiphany-rb` | [epiphany](https://github.com/GNOME/epiphany) | [epiphany-rb](https://github.com/ruby-gtk-project/epiphany-rb) | `GPL-3.0-or-later` |
| `errands-rb` | [Errands](https://github.com/mrvladus/Errands) | [Errands-rb](https://github.com/ruby-gtk-project/Errands-rb) | `MIT` |
| `extension-manager-rb` | [Extension Manager](https://github.com/mjakeman/extension-manager) | [Extension-Manager-rb](https://github.com/ruby-gtk-project/Extension-Manager-rb) | `GPL-3.0-or-later` |
| `eyedropper-rb` | [eyedropper](https://github.com/FineFindus/eyedropper) | [eyedropper-rb](https://github.com/ruby-gtk-project/eyedropper-rb) | `GPL-3.0-or-later` |
| `forge-sparks-rb` | [forge-sparks](https://github.com/rafaelmardojai/forge-sparks) | [forge-sparks-rb](https://github.com/ruby-gtk-project/forge-sparks-rb) | `MIT` |
| `fretboard-rb` | [fretboard](https://github.com/bragefuglseth/fretboard) | [fretboard-rb](https://github.com/ruby-gtk-project/fretboard-rb) | `GPL-3.0-or-later` |
| `frogr-rb` | [frogr](https://github.com/GNOME/frogr) | [frogr-rb](https://github.com/ruby-gtk-project/frogr-rb) | `GPL-3.0-only` |
| `gaphor-rb` | [gaphor](https://github.com/gaphor/gaphor) | [gaphor-rb](https://github.com/ruby-gtk-project/gaphor-rb) | `Apache-2.0` |
| `gnome-calculator-rb` | [gnome-calculator](https://github.com/GNOME/gnome-calculator) | [gnome-calculator-rb](https://github.com/ruby-gtk-project/gnome-calculator-rb) | `GPL-3.0-or-later` |
| `gnome-calendar-rb` | [gnome-calendar](https://github.com/GNOME/gnome-calendar) | [gnome-calendar-rb](https://github.com/ruby-gtk-project/gnome-calendar-rb) | `GPL-3.0-or-later` |
| `gnome-characters-rb` | [gnome-characters](https://github.com/GNOME/gnome-characters) | [gnome-characters-rb](https://github.com/ruby-gtk-project/gnome-characters-rb) | `BSD-3-Clause` |
| `gnome-clocks-rb` | [gnome-clocks](https://github.com/GNOME/gnome-clocks) | [gnome-clocks-rb](https://github.com/ruby-gtk-project/gnome-clocks-rb) | `GPL-2.0-or-later` |
| `gnome-connections-rb` | [gnome-connections](https://github.com/GNOME/gnome-connections) | [gnome-connections-rb](https://github.com/ruby-gtk-project/gnome-connections-rb) | `GPL-3.0-or-later` |
| `gnome-contacts-rb` | [gnome-contacts](https://github.com/GNOME/gnome-contacts) | [gnome-contacts-rb](https://github.com/ruby-gtk-project/gnome-contacts-rb) | `GPL-2.0-or-later` |
| `gnome-control-center-rb` | [gnome-control-center](https://github.com/GNOME/gnome-control-center) | [gnome-control-center-rb](https://github.com/ruby-gtk-project/gnome-control-center-rb) | `GPL-2.0-or-later` |
| `gnome-disk-utility-rb` | [gnome-disk-utility](https://github.com/GNOME/gnome-disk-utility) | [gnome-disk-utility-rb](https://github.com/ruby-gtk-project/gnome-disk-utility-rb) | `GPL-2.0-or-later` |
| `gnome-font-viewer-rb` | [gnome-font-viewer](https://github.com/GNOME/gnome-font-viewer) | [gnome-font-viewer-rb](https://github.com/ruby-gtk-project/gnome-font-viewer-rb) | `GPL-2.0-or-later` |
| `gnome-logs-rb` | [gnome-logs](https://github.com/GNOME/gnome-logs) | [gnome-logs-rb](https://github.com/ruby-gtk-project/gnome-logs-rb) | `GPL-3.0-or-later` |
| `gnome-mahjongg-rb` | [gnome-mahjongg](https://github.com/GNOME/gnome-mahjongg) | [gnome-mahjongg-rb](https://github.com/ruby-gtk-project/gnome-mahjongg-rb) | `GPL-3.0-or-later` |
| `gnome-maps-rb` | [gnome-maps](https://github.com/GNOME/gnome-maps) | [gnome-maps-rb](https://github.com/ruby-gtk-project/gnome-maps-rb) | `GPL-2.0-or-later` |
| `gnome-music-rb` | [gnome-music](https://github.com/GNOME/gnome-music) | [gnome-music-rb](https://github.com/ruby-gtk-project/gnome-music-rb) | `GPL-2.0-or-later AND LGPL-2.0-or-later AND CC-BY-SA-4.0` |
| `gnome-podcasts-rb` | [gnome-podcasts](https://github.com/alatiera/gnome-podcasts) | [gnome-podcasts-rb](https://github.com/ruby-gtk-project/gnome-podcasts-rb) | `GPL-3.0-or-later` |
| `gnome-software-rb` | [gnome-software](https://github.com/GNOME/gnome-software) | [gnome-software-rb](https://github.com/ruby-gtk-project/gnome-software-rb) | `GPL-2.0-or-later` |
| `gnome-system-monitor-rb` | [gnome-system-monitor](https://github.com/GNOME/gnome-system-monitor) | [gnome-system-monitor-rb](https://github.com/ruby-gtk-project/gnome-system-monitor-rb) | `GPL-2.0-or-later` |
| `gnome-text-editor-rb` | [gnome-text-editor](https://github.com/GNOME/gnome-text-editor) | [gnome-text-editor-rb](https://github.com/ruby-gtk-project/gnome-text-editor-rb) | `GPL-3.0-or-later` |
| `gnome-tour-rb` | [gnome-tour](https://github.com/GNOME/gnome-tour) | [gnome-tour-rb](https://github.com/ruby-gtk-project/gnome-tour-rb) | `GPL-3.0-or-later` |
| `gnome-weather-rb` | [gnome-weather](https://github.com/GNOME/gnome-weather) | [gnome-weather-rb](https://github.com/ruby-gtk-project/gnome-weather-rb) | `GPL-2.0-or-later` |
| `gradia-rb` | [Gradia](https://github.com/AlexanderVanhee/Gradia) | [Gradia-rb](https://github.com/ruby-gtk-project/Gradia-rb) | `GPL-3.0-or-later` |
| `graphs-rb` | [Graphs](https://github.com/sstendahl/Graphs) | [Graphs-rb](https://github.com/ruby-gtk-project/Graphs-rb) | `GPL-3.0-or-later` |
| `gtk-demos-and-examples` | [gtk-demos-and-examples](https://github.com/GNOME/gtk) | [gtk-demos-and-examples](https://github.com/ruby-gtk-project/gtk-demos-and-examples) | `LGPL-2.1-or-later` |
| `hieroglyphic-rb` | [Hieroglyphic](https://github.com/FineFindus/Hieroglyphic) | [Hieroglyphic-rb](https://github.com/ruby-gtk-project/Hieroglyphic-rb) | `GPL-3.0-or-later` |
| `impression-rb` | [Impression](https://github.com/adhami3310/Impression) | [Impression-rb](https://github.com/ruby-gtk-project/Impression-rb) | `GPL-3.0-or-later` |
| `junction-rb` | [Junction](https://github.com/sonnyp/Junction) | [Junction-rb](https://github.com/ruby-gtk-project/Junction-rb) | `GPL-3.0-or-later` |
| `keypunch-rb` | [keypunch](https://github.com/bragefuglseth/keypunch) | [keypunch-rb](https://github.com/ruby-gtk-project/keypunch-rb) | `GPL-3.0-or-later` |
| `loupe-rb` | [loupe](https://github.com/GNOME/loupe) | [loupe-rb](https://github.com/ruby-gtk-project/loupe-rb) | `GPL-3.0-or-later` |
| `mousai-rb` | [Mousai](https://github.com/SeaDve/Mousai) | [Mousai-rb](https://github.com/ruby-gtk-project/Mousai-rb) | `GPL-3.0-or-later` |
| `nautilus-rb` | [nautilus](https://github.com/GNOME/nautilus) | [nautilus-rb](https://github.com/ruby-gtk-project/nautilus-rb) | `GPL-3.0-or-later` |
| `paper-clip-rb` | [Paper-Clip](https://github.com/Diego-Ivan/Paper-Clip) | [Paper-Clip-rb](https://github.com/ruby-gtk-project/Paper-Clip-rb) | `GPL-3.0-or-later` |
| `papers-rb` | [papers](https://github.com/GNOME/papers) | [papers-rb](https://github.com/ruby-gtk-project/papers-rb) | `GPL-2.0-or-later` |
| `pika-backup-rb` | [pika-backup](https://github.com/pika-backup/pika-backup) | [pika-backup-rb](https://github.com/ruby-gtk-project/pika-backup-rb) | `GPL-3.0-or-later` |
| `planify-rb` | [planify](https://github.com/alainm23/planify) | [planify-rb](https://github.com/ruby-gtk-project/planify-rb) | `GPL-3.0-or-later` |
| `polari-rb` | [polari](https://github.com/GNOME/polari) | [polari-rb](https://github.com/ruby-gtk-project/polari-rb) | `GPL-2.0-or-later` |
| `raider-rb` | [raider](https://github.com/ADBeveridge/raider) | [raider-rb](https://github.com/ruby-gtk-project/raider-rb) | `GPL-3.0-or-later` |
| `resources-rb` | [resources](https://github.com/nokyan/resources) | [resources-rb](https://github.com/ruby-gtk-project/resources-rb) | `GPL-3.0-or-later` |
| `sessions-rb` | [sessions](https://github.com/pojntfx/sessions) | [sessions-rb](https://github.com/ruby-gtk-project/sessions-rb) | `AGPL-3.0-or-later` |
| `share-preview-rb` | [share-preview](https://github.com/rafaelmardojai/share-preview) | [share-preview-rb](https://github.com/ruby-gtk-project/share-preview-rb) | `GPL-3.0-or-later` |
| `showtime-rb` | [showtime](https://github.com/GNOME/showtime) | [showtime-rb](https://github.com/ruby-gtk-project/showtime-rb) | `GPL-3.0-or-later` |
| `simple-scan-rb` | [simple-scan](https://github.com/GNOME/simple-scan) | [simple-scan-rb](https://github.com/ruby-gtk-project/simple-scan-rb) | `GPL-3.0-or-later` |
| `snapshot-rb` | [snapshot](https://github.com/GNOME/snapshot) | [snapshot-rb](https://github.com/ruby-gtk-project/snapshot-rb) | `GPL-3.0-or-later` |
| `solanum-rb` | [Solanum](https://github.com/BrainBlasted/Solanum) | [Solanum-rb](https://github.com/ruby-gtk-project/Solanum-rb) | `GPL-3.0-or-later` |
| `sudoku-rb` | [Sudoku](https://github.com/sepehr-rs/Sudoku) | [Sudoku-rb](https://github.com/ruby-gtk-project/Sudoku-rb) | `GPL-3.0-or-later` |
| `switcheroo-rb` | [Switcheroo](https://github.com/adhami3310/Switcheroo) | [Switcheroo-rb](https://github.com/ruby-gtk-project/Switcheroo-rb) | `GPL-3.0-or-later` |
| `tally-rb` | [tally](https://github.com/vtrlx/tally) | [tally-rb](https://github.com/ruby-gtk-project/tally-rb) | `GPL-3.0-or-later` |
| `tangram-rb` | [Tangram](https://github.com/sonnyp/Tangram) | [Tangram-rb](https://github.com/ruby-gtk-project/Tangram-rb) | `GPL-3.0-or-later` |
| `textpieces-rb` | [textpieces](https://github.com/liferooter/textpieces) | [textpieces-rb](https://github.com/ruby-gtk-project/textpieces-rb) | `GPL-3.0-or-later` |
| `tuba-rb` | [Tuba](https://github.com/GeopJr/Tuba) | [Tuba-rb](https://github.com/ruby-gtk-project/Tuba-rb) | `GPL-3.0-or-later` |
| `valuta-rb` | [valuta](https://github.com/ideveCore/Valuta) | [valuta-rb](https://github.com/ruby-gtk-project/valuta-rb) | `GPL-3.0-or-later` |
| `webfont-kit-generator-rb` | [webfont-kit-generator](https://github.com/rafaelmardojai/webfont-kit-generator) | [webfont-kit-generator-rb](https://github.com/ruby-gtk-project/webfont-kit-generator-rb) | `GPL-3.0-or-later` |
| `wike-rb` | [Wike](https://github.com/hugolabe/Wike) | [Wike-rb](https://github.com/ruby-gtk-project/Wike-rb) | `GPL-3.0-or-later` |
| `wordbook-rb` | [Wordbook](https://github.com/mufeedali/Wordbook) | [Wordbook-rb](https://github.com/ruby-gtk-project/Wordbook-rb) | `GPL-3.0-or-later` |
| `workbench` | [workbench](https://github.com/workbenchdev/Workbench) | [workbench](https://github.com/ruby-gtk-project/workbench) | `GPL-3.0-or-later` |
| `workbench-demos` | [workbench-demos](https://github.com/workbenchdev/demos) | [workbench-demos](https://github.com/ruby-gtk-project/workbench-demos) | `CC0-1.0` |
| `workbench-rb` | [Workbench](https://github.com/workbenchdev/Workbench) | [Workbench-rb](https://github.com/ruby-gtk-project/Workbench-rb) | `GPL-3.0-or-later` |
| `yelp-rb` | [yelp](https://github.com/GNOME/yelp) | [yelp-rb](https://github.com/ruby-gtk-project/yelp-rb) | `GPL-2.0-or-later` |
<!-- END GENERATED APP LIST -->
