{pkgs }:
pkgs.mkShell {
          name = "pythonEnv";
          buildInputs = [ pythonEnv ];

          nativeBuildInputs = with pkgs;  [
            zlib
            glibc
            libffi
            openssl
            stdenv.cc
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
          '';     
}


