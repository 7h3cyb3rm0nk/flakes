{pkgs21 }:
let

pythonEnv = pkgs21.python36.withPackages (ps:
          with ps; [
            pip
            wheel
            virtualenv
          ]
        );
in 
pkgs21.mkShell {
          name = "pythonEnv";
          buildInputs = [ pythonEnv ];

          nativeBuildInputs = with pkgs21;  [
            zlib
            glibc
            libffi
            openssl
            stdenv.cc
            stdenv.cc.libc
            gcc.libc
            stdenv.glibc
            
          ];

          shellHook = ''
          if [ ! -d ./venv ]; then 
            echo "creating virtualenv [venv]"
            python -m virtualenv venv
          fi
            echo "activating [venv]"
            source ./venv/bin/activate
            pip install -r requirements.txt

            python -V
          echo "EMBER env"
          export LD_LIBRARY_PATH=${pkgs21.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH

          '';     
}


