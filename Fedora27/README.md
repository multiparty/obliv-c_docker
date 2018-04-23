# Fedora 27

This file will build a Docker image capable of running Obliv-C on Fedora 27. User permissions are set to `USER 185`, so compiled OC programs must be written to the `/tmp/` directory (which can be set using the OC compiler's `-o` flag). 