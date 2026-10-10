# Deploying to a Phone

How to get a debug build onto a physical Android phone from this machine. Written after a real
session where USB debugging needed several fixes before it worked — the troubleshooting steps
below are the ones that actually fixed it, not generic advice.

Device used so far: a **Pixel 9 Pro Fold**, adb serial `4C161FDKD00100`. Android application id:
`com.example.pokedex_app` (from `android/app/build.gradle`, `applicationId`).

**Default to USB.** Wireless pairing (Option B) became persistently broken on 2026-10-08: every
`adb pair` attempt failed identically (`protocol fault (couldn't read status message)`, with
`ADB_TRACE=all` showing the *local* adb daemon return a bare `FAIL` and drop the connection the
moment it tried to reach the phone — not a phone-side or network-reachability problem; the raw
TCP port was confirmed open with `nc` every time). This survived, in order: clearing
`~/.android/adb_known_hosts.pb`, upgrading platform-tools 36.0.2 → 37.0.1, toggling Wireless
debugging off/on on the phone, a full phone reboot, regenerating the Mac's adb identity key pair
(`~/.android/adbkey*`), and removing the Mac from the phone's paired-devices list. Ten-plus fresh
pairing codes, all with the identical failure. USB worked immediately throughout this. Don't spend
time on Option B again unless USB itself stops working — in which case revisit Option B, but
expect to hit this same wall, and don't expect another round of these resets to fix it either.

## Option A: USB cable (try this first)

1. Plug the phone into the Mac with a data-capable cable (not a charge-only one).
2. On the phone, check **Settings → Connected devices → USB** and set it to **File Transfer**
   (not "No data transfer" / charging only). Pixels sometimes silently revert to charge-only,
   especially after the screen locks — if the phone drops off adb mid-session, this is the first
   thing to check again.
3. Check for an **"Allow USB debugging?"** popup on the phone and tap **Allow**. If no popup
   appears and `adb devices` still shows nothing or `unauthorized`:
   - Unlock the phone screen (the popup only shows when unlocked).
   - **Settings → Developer options → Revoke USB debugging authorizations**, then unplug and
     replug the cable to force a fresh prompt.
4. Confirm it's ready:
   ```bash
   adb devices -l
   # should show:  4C161FDKD00100   device   ...
   ```
   If it stays `unauthorized` or disappears entirely after `adb kill-server && adb start-server`,
   stop troubleshooting USB and use Option B — that's what worked last time.

## Option B: Wireless debugging (fallback that worked)

Use this if USB keeps bouncing between `unauthorized` and not-listed. Phone and Mac must be on
the **same Wi-Fi network**.

1. On the phone: **Settings → Developer options → Wireless debugging** (toggle on).
2. Tap the **"Wireless debugging"** row itself (not just the toggle) to open its detail screen.
3. Tap **"Pair device with pairing code"**. It shows an IP:port and a 6-digit code — **both
   expire in well under a minute**, so have the pairing command ready before reading it out.
4. Pair:
   ```bash
   adb pair <ip>:<port> <6-digit-code>
   ```
   Use the **numeric IP address**, not the `.local` mDNS hostname the dialog may also show — mDNS
   resolution from this Mac failed for this phone's network (`ping: cannot resolve ...local`),
   while the plain IP worked immediately. If the IP isn't visible anywhere convenient, get it from
   **Settings → Network & internet → Internet → (gear icon on the connected Wi-Fi network) → IP
   address**.
5. After a successful pair, adb usually auto-connects (mDNS discovery for the *connect* step
   seems to work even when it didn't for the hostname above). Check:
   ```bash
   adb devices -l
   # look for something like:
   # adb-4C161FDKD00100-XXXXXX._adb-tls-connect._tcp   device   model:Pixel_9_Pro_Fold
   ```
   If it didn't auto-connect, go back to the **Wireless debugging** main screen (not the pairing
   sub-screen) — it shows a persistent **"IP address & Port"** for an already-paired device — and
   run `adb connect <that-ip>:<that-port>` directly; re-pairing isn't needed once a pair has
   succeeded, unless the phone's Wi-Fi network or adb keys change.

## Build and install (either option, once a device shows as `device`)

```bash
cd /Users/jonathanarndt/dev/pokedex_app
flutter build apk --debug
adb -s <serial-or-adb-id-from-devices--l> install -r build/app/outputs/flutter-apk/app-debug.apk
adb -s <same-id> shell monkey -p com.example.pokedex_app -c android.intent.category.LAUNCHER 1
```

`<serial-or-adb-id>` is whatever `adb devices -l` printed in the first column — the plain serial
for USB, or the `adb-...-tls-connect...` string for a wireless connection.

For quicker iteration instead of a one-off install, `flutter run -d <id>` builds, installs, and
launches in one step, with hot reload — but it's an interactive/foreground command, so it isn't
used in this doc's build-and-install sequence (which assumes a non-interactive shell).

## Notes

- Nothing here is committed to git by this process — it deploys whatever is currently on disk,
  uncommitted changes included.
- Wireless debugging's pairing persists, but the phone's IP (DHCP) and the wireless-debugging
  connect port can change between sessions, so `adb devices -l` coming up empty next time doesn't
  mean the pairing was lost — try `adb connect <current-ip>:<current-port>` from the Wireless
  debugging main screen before redoing the full pairing-code dance.
