# MaxiCoastRush — Build & Sign MSIX (GitHub Actions)

Rebuilds the patched MSIX using the official Windows SDK **`makeappx pack`** on a Windows runner — regenerates `AppxBlockMap.xml`, uses the standard MSIX compression, and signs it with a self-signed cert. Result matches the original UWP package layout exactly.

## Repo layout

```
.github/workflows/sign-msix.yml   # Windows workflow (pack + sign)
package/                          # Patched game source (post-edits)
├── AppxManifest.xml
├── [Content_Types].xml
├── Assets/
├── default.html
└── game/
README.md
```

`AppxBlockMap.xml` and `AppxSignature.p7x` are intentionally NOT in the repo — the workflow regenerates them on every run so hashes match the current file contents.

## Setup (once)

1. Create a GitHub repo (public or private).
2. Upload the contents of this zip:
   - Web UI: **Add file → Upload files** → drag all folders/files → Commit.
   - Or `git`:
     ```bash
     git init && git add . && git commit -m "Initial"
     git branch -M main
     git remote add origin https://github.com/<you>/<repo>.git
     git push -u origin main
     ```

## Run the workflow

1. Repo → **Actions** tab.
2. **Build & Sign MSIX** → **Run workflow** (main branch) → green button.
3. Wait 1–2 minutes for the green check.

## Download the outputs

From the completed run's **Artifacts**:

- **MaxiCoastRush-Patched-Signed** → the signed `.msix`
- **MaxiCoastRush-Certificate** → `MaxiCoastRush.cer` (public cert)

## Install on Windows

1. Right-click `MaxiCoastRush.cer` → **Install Certificate**.
2. Store Location: **Local Machine** → Next.
3. **Place all certificates in the following store** → Browse → **Trusted People** → OK → Next → Finish. *(One-time per PC.)*
4. Double-click the signed `.msix` → **Install**.

## Updating

Edit anything inside `package/` and push — the workflow re-runs, and you get a fresh signed MSIX with regenerated block map.

## Why this matches the original layout

`makeappx pack` is the Microsoft-official tool used by the Store and Visual Studio. It produces:
- `AppxManifest.xml` (yours, unchanged)
- `AppxBlockMap.xml` (regenerated: SHA-256 hashes of every 64 KB block of every file)
- `[Content_Types].xml`
- All your `game/`, `Assets/`, etc. with standard MSIX Deflate compression
- After `signtool`: `AppxSignature.p7x` embedded correctly

Byte-for-byte identical to what the original Store submission pipeline produces.
