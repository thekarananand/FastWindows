# Remove all pinned apps in Start menu
$shell = New-Object -ComObject Shell.Application
$folder = $shell.NameSpace("shell:::{4234d49b-0245-4df3-b780-3893943456e1}")
$items = $folder.Items()
foreach ($item in $items) {
    $verb = $item.Verbs() | where {$_.Name -eq "Unpin from Start"}
    if ($verb) {
        $verb.DoIt()
    }
}
