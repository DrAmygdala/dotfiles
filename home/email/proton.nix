{
  services.protonmail-bridge.enable = true;
  programs.thunderbird = {
    enable = true;
    profiles = {
      primary = {
        isDefault = true;
        search = {
          default = "ddg";
          privateDefault = "ddg";
          force = true;
        };
      };
    };
  };
}
