{ pkgs, config, ... }: {
  languages.rust = {
    enable = true;
    channel = "nightly";
    targets = [ "wasm32-unknown-unknown" ];
    components = [ "rust-src" "rust-analyzer" ];
  };

  packages = [
    pkgs.cargo-leptos
    pkgs.wasm-bindgen-cli_0_2_100
    pkgs.dart-sass
    pkgs.diesel-cli
    pkgs.nodejs_22
    pkgs.openssl
    pkgs.pkg-config
  ];

  services.postgres = {
    enable = true;
    initialDatabases = [{ name = "itq"; }];
  };

  env.DATABASE_URL = "postgresql:///itq?host=${config.env.PGHOST}";
}
