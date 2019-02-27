find . -name "Makefile" -type f -delete
./genProject.sh
cd ext
make
cd ..