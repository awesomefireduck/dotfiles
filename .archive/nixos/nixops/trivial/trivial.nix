{
  network.description = "Web server";

  webserver =
  { config, pkgs, ... }:
  {
    imports = [
      ./new.nix
    ];
    services.httpd.enable = true;
    services.httpd.adminAddr = "vince+trivial@vince.lol";
    services.httpd.documentRoot = "${pkgs.valgrind.doc}/share/doc/valgrind/html";
    networking.firewall.allowedTCPPorts = [ 80 ];
    services.openssh.permitRootLogin = "no";
  };
}
