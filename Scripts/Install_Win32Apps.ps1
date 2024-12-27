$apps = @(
    "Microsoft.VisualStudioCode",
    "Microsoft.git",
    "Mozilla.Firefox",
    "VideoLAN.VLC"
)

foreach ($app in $apps) {
    winget install -s winget --id $app
}