
# - Generate a list of extensions to be uninstalled
#    - Create an empty array
$vscode_exts = @()

#    - run shell command to list VSCode extension and tore the output in the array
$vscode_exts = Invoke-Command { code --list-extensions }

# - Loop through array and uninstall each extension
#    - loop through the array
foreach ($ext in $vscode_exts) {
  #      - for each item in array, run uninstall command
  Add-Content .\uninstalled_exts.log -Value $ext
  Invoke-Command { code --uninstall-extension $ext }
}