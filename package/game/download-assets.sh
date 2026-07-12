#!/bin/bash
# Run ONCE on a machine with internet, from the game folder.
# Mirrors the painted art + sound effects into assets/cdn/ so the
# packaged game runs 100% offline.
set -e
mkdir -p assets/cdn
while read -r f; do
  [ -z "$f" ] && continue
  echo "  $f"
  curl -sfL "https://d8j0ntlcm91z4.cloudfront.net/user_36vHR3g6PFbZ743GYNcYpzsyXRd/$f" -o "assets/cdn/$f"
done << 'LIST'
hf_20260707_152734_938a9b77-fb03-4951-87da-60859e37b68b.png
hf_20260707_152746_5fb55845-7477-40ea-acec-dca8805de14f.png
hf_20260707_152755_3b482363-012c-4a1d-9a17-86e215d05f4e.png
hf_20260707_152821_916e9273-21ea-483c-9bde-29582dd7531d.png
hf_20260707_152831_cf463bf6-a327-4a70-b2fe-0e3eedc5028b.png
hf_20260707_152917_7ada5403-a7b5-4b0f-90fa-d18ed4fb53a0.mp3
hf_20260707_152925_c1dc2918-6fcf-4d62-8610-d65eed931acd.mp3
hf_20260707_152936_ae308f1a-e785-42fc-860a-2f6ac8ae76a0.mp3
hf_20260707_152943_b7ef29a5-1ffe-4e26-b2ee-5a5052a1ecbf.mp3
hf_20260707_152952_2f6d0ab4-9a63-4d95-a7de-916ba17761ae.mp3
hf_20260707_180620_084e6bb7-7ddb-47a5-8f3a-3941227738c2.png
hf_20260707_184220_51693c13-1892-4958-8b36-fdaaccbf44bf.png
hf_20260707_184455_3966b0cd-79f8-4f2d-8d54-1756181f233c.png
hf_20260707_201358_232701be-ceec-48f1-af5f-7c4e41e92213.png
LIST
echo "All assets mirrored. The game is now fully offline."
