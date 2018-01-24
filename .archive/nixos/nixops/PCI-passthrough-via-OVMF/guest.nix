let
  backend =
    { config, pkgs, ... }:
    { services.httpd.enable = true;
      services.httpd.adminAddr = "vince+backend@vince.lol";
      services.httpd.documentRoot = "${pkgs.valgrind.doc}/share/doc/valgrind/html";
      networking.firewall.allowedTCPPorts = [ 80 ];
    };

  proxy =
    { config, pkgs, nodes, ... }:
    { services.httpd.enable = true;
      services.httpd.adminAddr = "vince+proxy@vince.lol";
      services.httpd.extraModules = [ "proxy_balancer"  "lbmethod_byrequests"];
      services.httpd.extraConfig =
      ''
        <Proxy balancer://cluster>
          Allow from all
          BalancerMember http://backend1 retry=0
          BalancerMember http://backend2 retry=0
        </Proxy>
        ProxyPass         /doc/                 balancer://cluster
        ProxyPassReverse  /doc/                 balancer://cluster

        ProxyRequests On
        ProxyPreserveHost Off
        RewriteEngine On
        RewriteRule /transmission[/]?$ /transmission/web/ [R=permanent]

        ProxyPass         /transmission/    http://transmission:9001/transmission/
        ProxyPassReverse  /transmission/    http://transmission:9001/transmission/
      '';
      networking.firewall.allowedTCPPorts = [ 80 ];
    };

    transmission =
      {config, pkgs, ...}:
      {
        services.transmission.enable = true;
        services.transmission.port   = 9001;
        services.transmission.settings = {
          download-dir = "/tmp/torrents/";
          incomplete-dir = "/tmp/torrents/.incomplete/";
          incomplete-dir-enabled = true; rpc-whitelist = "0.0.0.0,192.168.*.*";
        };
        networking.firewall.allowedTCPPorts = [ 9001 ];
      };
in
  {
    network.description = "Load balancing network";
    inherit proxy;
    #backend1 = backend;
    #backend2 = backend;
    inherit transmission;
  }
