# NexTab v3.5.0 – Scene ID Sync

Built ZIP: NexTab-Engine-v3.5.0.zip, manifest version 3.5.0.

The Windows bridge now provides a stable wallpaperId for each active Wallpaper Engine scene, allowing NexTab to match mapped video recordings by ID rather than by potentially duplicated title. The library is refreshed periodically when scene sync is active. Windows bridge binary rebuilt.

Tests: go test ./... passed; GOOS=windows GOARCH=amd64 go build passed; node --check newtab.js passed; ZIP integrity passed. No Brave/Windows live test yet.

Important: Wallpaper Engine .pkg is NOT actually live rendered in Brave in this build. Only native video wallpapers and user-mapped video recordings play as video; proprietary scenes without recordings still use a still preview. True live capture requires separate Windows capture/streaming support.

To deploy: publish a public GitHub release tag v3.5.0 with asset NexTab-Engine-v3.5.0.zip. The Windows 10-minute updater only updates browser extension files. After upgrading, close Brave, extract the zip and run UPDATE/BRIDGE-AKTUALISIEREN.cmd to replace the already registered bridge executable (backup preserved), then restart Brave.