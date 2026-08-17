# Ce mai trebuie adăugat

Deck-ul are machete HTML de rezervă pentru tot — dacă un fișier lipsește,
se afișează automat o machetă. Dar cu capturile reale e mai convingător.

## Capturi de pus (nume exacte, în `deck-assets/`)

| Fișier | Slide | Ce trebuie să conțină |
|--------|-------|------------------------|
| `haveibeenpwned-dima.png` | 6 | Captura ta de pe haveibeenpwned.com — „Oh no — pwned!" + breșa Nitro (Sept 2020) |
| `chatgpt-share-google.png` | 10 | Captura DuckDuckGo cu `site:https://chatgpt.com/share` |
| `nicmd-maigov.png` | 17 | nic.md: „DA! maigov.md este disponibil pentru inregistrare" |
| `nicmd-mtenders.png` | 17 | nic.md: „DA! mtenders.md este disponibil pentru inregistrare" |
| `nicmd-customsgov.png` | 17 | nic.md: „DA! customsgov.md este disponibil pentru inregistrare" |

Nu trebuie schimbat nimic în `slides.html` — imaginile se încarcă singure când apar.

## QR-uri (slide 34)

- `qr-telegram.svg` — **gata**, generat pentru `https://t.me/+E9aPhptp_2QxZDdk`
  (verificat: se decodează corect la scanare)
- `qr-linkedin.svg` — **lipsește URL-ul**. Se generează cu:

```bash
python3 -c "import segno; segno.make('URL_LINKEDIN', error='h').save(
  'qr-linkedin.svg', scale=10, border=2, dark='#0F172A', light='#FFFFFF')"
```

Apoi în `slides.html`, pe ultimul slide, înlocuiește `linkedin.com/in/…`
din `<div class="qr-url">` cu adresa reală.

## Ce e deja aici

- `dima-summit.jpg` — slide 2
- `notebooklm-asistent-fiscal.png` — slide 21
- `notebooklm-3panel.gif` — slide 23
- `qr-telegram.svg` — slide 34
