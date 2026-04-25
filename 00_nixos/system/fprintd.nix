{ pkgs,lib, ... }:

{
  services.fprintd.enable = true;

  security.pam.services.login.fprintAuth = lib.mkForce true;
  security.pam.services.sudo.fprintAuth = lib.mkForce true;
  security.pam.services.gdm.fprintAuth = lib.mkForce true;
}
