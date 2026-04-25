{ pkgs, ... }:

let
  gemini-cli-custom = pkgs.buildNpmPackage rec {
    pname = "gemini-cli";
    version = "v0.38.1"; # Ou un tag spécifique comme "1.1.0"

    src = pkgs.fetchFromGitHub {
      owner = "google-gemini";
      repo = "gemini-cli";
      rev = version;
      hash = "sha256-Iq/KxQ8rbLtXDbGzcZxspfFwar189H3mBWwOD4hO7HU=";
    };

    npmDepsHash = "sha256-T3fxNFvkLR7f49GQjzzTnl3VM+VUUgJfFF5d2GGe7L4=";
    makeCacheWritable = true;
    nativeBuildInputs = [ pkgs.pkg-config ];
    buildInputs = [ pkgs.libsecret ];

    # On demande à NPM d'installer uniquement le package final pour le CLI
    # et on nettoie les liens symboliques de développement qui cassent le build Nix
    postInstall = ''
      find $out/lib/node_modules -type l -exec rm {} +
    '';

    meta = with pkgs.lib; {
      description = "Gemini CLI (Node.js version) built from source";
      homepage = "https://github.com/google-gemini/gemini-cli";
      license = licenses.asl20;
      mainProgram = "gemini"; # Vérifie le nom de l'exécutable dans le package.json
    };
  };

  # Définition déclarative des extensions (Nix principle)
  # Chaque extension doit être un répertoire contenant un fichier gemini-extension.json
  gemini-extensions = {
    "conductor" = pkgs.fetchFromGitHub {
      owner = "gemini-cli-extensions";
      repo = "conductor";
      rev = "main";
      hash = "sha256-IuX9iijb176h1YBwtg6dK3qkXSwW+jKkFaWSGNDjVkw=";
    };
    "code-review" = pkgs.fetchFromGitHub {
      owner = "gemini-cli-extensions";
      repo = "code-review";
      rev = "main";
      hash = "sha256-dqzKBMkv5uJZbWcKRRhcBpBX6pmwQvtccKVQUZOscGU=";
    };
    "security" = pkgs.fetchFromGitHub {
      owner = "gemini-cli-extensions";
      repo = "security";
      rev = "main";
      hash = "sha256-zkhlQhfJNVtNjQoQafAysgZX1OQljPdFU39jpUtYRPE=";
    };
    "git-commit" = pkgs.fetchFromGitHub {
      owner = "q-sw";
      repo = "gemini-cli-extension-git-commit";
      rev = "main";
      hash = "sha256-iSHwv5g98CZWRlMgNhh8fAPETHGI5/p1kiwYsmKbQjE=";
    };
  };
in
{
  home.packages = [
    gemini-cli-custom
  ];

  # Déploiement des extensions dans le répertoire attendu par Gemini CLI (~/.gemini/extensions)
  home.file = pkgs.lib.mapAttrs'
    (name: src: {
      name = ".gemini/extensions/${name}";
      value = {
        source = src;
        recursive = true;
      };
    })
    gemini-extensions;

}
