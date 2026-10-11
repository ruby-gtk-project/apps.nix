# The app inventory, as a nixpkgs overlay.
#
# Unlike krew.nix, this overlay cannot build the apps: each app is built by its
# own fork's flake, which is where that port's runtime gemdir, gemConfig and GTK
# closure live. What the overlay provides is the inventory — every app, its
# upstream, its port and its licence — so that stable (non-flake) Nix can read
# it:
#
#   (import ./overlay.nix pkgs pkgs).ruby-gtk-apps
#
# Building and running an app needs flakes; see the README.
final: _prev:
{
  ruby-gtk-apps = final.lib.importJSON ./apps.json;
}
