
{config, pkgs, ...}:
{
    programs.git = {
        enable = true;
        userName = "q-sw";
        userEmail = "quentin@q-sw.xyz";
    };
}
