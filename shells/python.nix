{pkgs }:
 pkgs.mkShell {
    packages = with pkgs; [
    python312
    python312Packages.virtualenv
    poetry

    ];

  }

