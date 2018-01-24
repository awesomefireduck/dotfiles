let
  vbox =
  {
    deployment.targetEnv = "virtualbox";
    deployment.virtualbox.headless = true;
  };
in
  {
    proxy = vbox;
    backend1 = vbox;
    backend2 = vbox;
    transmission = vbox;
  }
