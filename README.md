# EECE 435L Lab 11 – Configuration and Deployment Tools

**Student:** Line Faour  
**GitHub:** [faourline](https://github.com/faourline)

This lab packages a simple Hello World application as:

- **MSI** (Windows) via WiX Toolset
- **DEB** (Debian/Ubuntu) via `dpkg-deb` on WSL

Application output:

```text
Hello, World from Line_Faour!
```

## Repository layout

```text
source/                 # C source code
  helloworld.c
docs/                   # README + user guide packaged with installers
  README.md
  user_guide.txt
msi/                    # WiX project + Windows binary
  Product.wxs
  helloworld.exe
deb/                    # Debian control metadata
  control
packages/               # Built submission artifacts
  helloworld_Line_Faour.msi
  helloworld_Line_Faour.deb
  control
  source.zip
screenshots/            # Add your own screenshots here (see checklist below)
```

## Compile and run (source)

### Windows (MinGW)

```powershell
gcc -o helloworld.exe source\helloworld.c
.\helloworld.exe
```

### Linux / WSL

```bash
gcc -o helloworld source/helloworld.c
./helloworld
```

## Packages

| Artifact | Path |
|----------|------|
| MSI | `packages/helloworld_Line_Faour.msi` |
| DEB | `packages/helloworld_Line_Faour.deb` |
| Source zip | `packages/source.zip` |
| Debian control file | `packages/control` (also `deb/control`) |

### Install MSI (Windows)

```powershell
msiexec /i packages\helloworld_Line_Faour.msi
```

Installed under `Program Files\HelloWorld_Line_Faour\`.

### Install DEB (WSL / Ubuntu)

```bash
sudo dpkg -i packages/helloworld_Line_Faour.deb
helloworld
dpkg -l | grep helloworld
```

### Rebuild DEB (optional)

```bash
wsl -d Ubuntu-24.04 -- bash "/mnt/c/Users/Dr. Ghaleb Faour/Downloads/Lab11_435L/build_deb.sh"
```

### Rebuild MSI (optional)

```powershell
cd msi
wix build Product.wxs -o ..\packages\helloworld_Line_Faour.msi --acceptEula wix7
```

## Screenshots (you take these)

Do **not** rely on automated screenshots. Capture and place images in `screenshots/`:

1. **MSI creation** – WiX / installer project showing the package
2. **MSI installed** – app listed in Windows Apps / Add or Remove Programs
3. **MSI install + run** – installing the MSI and running `helloworld.exe`
4. **DEB creation** – terminal showing `dpkg-deb --build` (or this repo’s build script output)
5. **DEB installed** – `dpkg -l | grep helloworld` or `apt list --installed | grep helloworld`
6. **DEB install + run** – installing the `.deb` and running `helloworld`
7. **MSI metadata** – package properties in WiX, or `msiexec /i helloworld_Line_Faour.msi` / package details

Suggested filenames:

- `01_msi_creation.png`
- `02_msi_installed_apps.png`
- `03_msi_run.png`
- `04_deb_build.png`
- `05_deb_installed.png`
- `06_deb_run.png`
- `07_msi_metadata.png`
