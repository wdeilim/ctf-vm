# CTF VM

An Ubuntu 16.04 x64 VM for binary exploitation and reversing CTF problems. For a 14.04 VM, checkout the `ubuntu14.04` branch. For a Windows 7 CTF VM, see https://github.com/gsingh93/ctf-vm-windows7.

## Installation

```
git clone git@github.com:wdeilim/ctf-vm.git
cd ctf-vm
vagrant up
```

## Packages

Included packages

- pwndbg
- peda
- pwntools
- Pin
- AFL
- ROPgadget
- rp++
- xrop
- QEMU with ARM support
- angr
- zsh