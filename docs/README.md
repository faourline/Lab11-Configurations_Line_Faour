# Hello World from Line_Faour

Simple Hello World application packaged as MSI (Windows) and DEB (Debian/Ubuntu).

## Message

```
Hello, World from Line_Faour!
```

## Compile and run (Windows)

```powershell
gcc -o helloworld.exe helloworld.c
.\helloworld.exe
```

## Compile and run (Linux / WSL)

```bash
gcc -o helloworld helloworld.c
./helloworld
```

## Install packages

### Windows MSI

```powershell
msiexec /i helloworld_Line_Faour.msi
```

After install, run from the install directory or Start Menu shortcut (if configured).

### Debian / Ubuntu DEB

```bash
sudo dpkg -i helloworld_Line_Faour.deb
helloworld
```

## Files included in packages

- Binary: `helloworld` / `helloworld.exe`
- Documentation: `README.md`, `user_guide.txt`
