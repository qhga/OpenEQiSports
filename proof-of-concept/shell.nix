with import <nixpkgs> {};
let
  dotnet-combined = (with dotnetCorePackages; combinePackages [
    sdk_8_0
    sdk_7_0
  ]).overrideAttrs (finalAttrs: previousAttrs: {
    # This is needed to install workload in $HOME
    # https://discourse.nixos.org/t/dotnet-maui-workload/20370/2

    postBuild = (previousAttrs.postBuild or '''') + ''

        for i in $out/sdk/*
        do
          i=$(basename $i)
          mkdir -p $out/metadata/workloads/''${i/-*}
          touch $out/metadata/workloads/''${i/-*}/userlocal
        done
      '';
  });
in
pkgs.mkShell {
  packages = [
    mono
    msbuild
    dotnet-combined
  ];
}