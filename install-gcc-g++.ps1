# Download the GCC and G++ installers
$gcc_installer = "https://sourceforge.net/projects/mingw/files/installer/mingw-w64-x86_64-gcc-11.2.0-win32-setup.exe"
$g++_installer = "https://sourceforge.net/projects/mingw/files/installer/mingw-w64-x86_64-g++-11.2.0-win32-setup.exe"

# Install the GCC and G++ compilers
Start-Process $gcc_installer
Start-Process $g++_installer

# Get the current PATH variable
$current_path = $env:PATH

# Add the path to the GCC and G++ installers to the PATH variable
$current_path += ";$env:TEMP\mingw64\bin"

# Set the PATH variable
Set-EnvironmentVariable -Name "PATH" -Value $current_path

# Verify that the GCC and G++ compilers are installed
gcc --version
g++ --version
