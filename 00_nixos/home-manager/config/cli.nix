{ pkgs, ... }:

let
  cli = pkgs.buildGoModule {
    pname = "cli";
    version = "v1.1.1";
    vendorHash = "sha256-Y/OQOYzCZ6Rv1T3FDWfFhdgskd1Ugv+RIfL6GCkDaOg=";
    src = pkgs.fetchFromGitHub {
      owner = "q-sw";
      repo = "cli";
      rev = "v1.1.1";
      hash = "sha256-pFENp38zF/pZkFzsFIdM2MG9Uma9in8xX6ocLKSv7hk=";
    };
  };
in
{
  home.packages = [ cli ];
  xdg.configFile."cliconfig.yaml".text = ''
    mainPath: /home/qsw
    toCheck:
      - path: "dev"
        is_repo: false
    gitConfigPath: ""
    kubeConfigPath: ""
    vpnConfigPath: ""
  '';
}
