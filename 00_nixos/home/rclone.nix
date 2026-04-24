{pkgs, ...}:
{
    xdg.configFile."rclone/drive.conf".text = ''
    [drive]
    type = drive
    scope = drive
    token = {"access_token":"","token_type":"Bearer","refresh_token":"","expiry":""}
    team_drive =
    '';
    systemd.user.services.rclone-gdrive-mount = {
        Unit = {
            Description = "Service that connects to Google Drive";
        };
        Install = {
            WantedBy = [ "default.target" ];
        };

        Service = let
            gdriveDir = "%h/Documents/notes";
        in
            {
            Type = "simple";
            ExecStartPre = "/run/current-system/sw/bin/mkdir -p ${gdriveDir}";
            ExecStart = "${pkgs.rclone}/bin/rclone mount --vfs-cache-mode full drive:notes ${gdriveDir}";
            ExecStop = "/run/current-system/sw/bin/fusermount -u ${gdriveDir}";
            Restart = "on-failure";
            RestartSec = "10s";
            Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
        };
    };
}
