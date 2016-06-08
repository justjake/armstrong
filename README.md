# armstrong

this is the very beginning of my journey with NixOS, which seems to push all
the right buttons as far as an OS goes:

 - everything about the OS is defined in one place using one language, including services and build instructions;
 - very flexible system that avoids dependency hells;
 - declarative, purely-functional system administration built-in, no need to fiddle around with Chef et al;
 - promising approach for building containers and packaging applications for reliabe distribution;

To reproduce the initial armstrong system:

1. get the NixOS virtual appliance: https://nixos.org/releases/nixos/latest-ova-x86_64-linux (16.03 was initially used)
2. replace /etc/nixos/configuration.nix with this repository's configuration.nix
3. run `sudo nixos-rebuild switch`
4. run `sudo reboot`
5. log in as jitl and then change the password
