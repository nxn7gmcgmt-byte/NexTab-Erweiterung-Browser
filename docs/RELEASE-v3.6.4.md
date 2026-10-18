# NexTab 3.6.4 – Auto-Sync Reconnect Fix

Built locally: `NexTab-Engine-v3.6.4-Sync-Fix.zip` (manifest version 3.6.4, archive integrity OK, `node --check` OK). Based on v3.6.1 sources; this is a focused synchronization hotfix, not a certified upgrade of all features from the independently released v3.6.3.

Changes: force fresh sync on tab focus/visibility restoration; include the Native Messaging bridge media URL in the wallpaper fingerprint so a restarted bridge does not leave stale URLs; clear cache on bridge failures and browser media-loading errors, enabling retry on subsequent polls; guard against stale poll results after mode changes.

Constraints: `.pkg` direct native rendering is not implemented. The built-in monitor-sharing beta shows a consented capture of the entire selected display. Go/Windows live tests incomplete. Do not claim universal Wallpaper Engine compatibility.

For the current 10-minute GitHub updater to install 3.6.4, create a **public release tagged `v3.6.4`** with asset `NexTab-Engine-v3.6.4-Sync-Fix.zip` (the updater accepts names matching `NexTab-Engine-v[0-9].*.zip`). The current GitHub connector cannot attach the binary automatically; committing this documentation alone does not install the update.
