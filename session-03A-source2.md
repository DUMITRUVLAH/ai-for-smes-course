# Sesiunea 3A — Sursa 2 (transcript curs complet Claude Code, 3+ ore)
> **Subiect:** Curs complet Claude Code — de la instalare la sisteme agentice complexe
> **Sursă:** transcript video YouTube (curs în rusă, structurat pe blocuri)
> **Stare:** draft brut — text trunchiat (transcript parțial), de completat dacă apare restul
> **Relație cu Sursa 1:** sursa 1 = filosofie & arhitecturi (cele 3 căi, 5 pattern-uri). Sursa 2 = implementare practică, setup tehnic, demo live.

---

## BLOC 0 — Cine e autorul & ce promite cursul

Autorul lucrează cu Claude Code zilnic de la lansare. A construit cu el:
- Sistem agențial global pentru gestiunea întregii afaceri
- Parsare automată a concurenților
- Analiza tuturor metricilor, materialelor, task-urilor
- CRM, vânzări, marketing — totul rulează fără intervenție umană

**Ocupația:** automatizări în afaceri (5+ ani) + training oameni pe Claude Code și agenți — atât pentru sarcini personale cât și pentru business.

**Promisiunea cursului:** Claude Code înmulțește productivitatea. Nu necesită cunoștințe tehnice — autorul nu a scris nicio linie de cod manual.

**Structura cursului (ce se acoperă):**
- Instalare & configurare Claude Code de la zero (Mac, Windows, Linux)
- Medii de dezvoltare: terminal, VS Code, desktop app
- Principii de bază: cum să formulezi, token-uri, fereastră de context, costuri
- Modele disponibile în Claude Code, mod thinking
- Creierul proiectului: fișierul `CLAUDE.md` (instrucțiunea sistemului)
- Crearea unui site real cu module externe conectate
- Skills, folderul `.claude`, slash-comenzi, hooks, MCP servers, CLI tools
- Sub-agenți, Agent Teams, ramuri GitHub
- Sistem agențial complet oferit gratuit în canalul Telegram

---

## BLOC 1 — Abonamente & prețuri

**Opțiuni:**
- Gratuit: Claude Code indisponibil
- Pro: ~17$ (mai puțin de 20$ cu taxe) — punct de start recomandat
- Max 5×: 100$ — pentru proiecte mari
- Max 20×: 200$ — dacă Pro nu e suficient

**Sfat practic:** Începe cu Pro. Dacă limitele nu ajung → upgrade la Max. Valoarea e mult mai mare decât prețul.

**Pentru utilizatorii fără card internațional:** există servicii pentru numere de telefon internaționale, plată cu card local, sau conturi gata cumpărate — link-uri în canalul Telegram.

---

## BLOC 2 — Variantele de Claude Code (comparație)

| Variantă | Caracteristici | Recomandat? |
|---|---|---|
| **Web version** | Fără acces la fișiere locale; doar GitHub repo | Doar când ești departe de PC |
| **Desktop app** | Aproape identic cu web; poți conecta fișiere locale | Bun dacă nu ai nevoie de profunzime |
| **Aplicație telefon** | Versiune redusă | Nu |
| **Terminal (CLI)** | Cel mai avansat; acces complet la funcții; slash-comenzi avansate | ✅ Recomandat profesional |
| **Extensie VS Code / Cursor** | User-friendly; bun pentru editare fișiere; unele funcții lipsesc față de terminal | ✅ Recomandat (alternativă la terminal) |

**Concluzie:** pentru utilizare serioasă → terminal sau extensie VS Code/Cursor. Web & desktop app = versiuni limitate.

---

## BLOC 3 — De ce Claude Code și nu un chat obișnuit

Chat-ul obișnuit (ChatGPT, Claude.ai):
- Întrebare → Răspuns → Un ciclu. Atât.
- Nu poate executa acțiuni, nu are instrumente reale

Claude Code:
- Are acces la **sistemul de fișiere** (în folderul proiectului)
- Are acces la **comenzi de terminal**
- Poate conecta **servicii externe** (MCP servers)
- Execută **lanțuri de acțiuni** multi-pas: citește fișier → scrie cod → rulează comandă → verifică rezultat → continuă
- Poate construi **arhitecturi agențiale complexe**: mai mulți agenți, fiecare cu instrucțiuni proprii, skills, servicii conectate

Analogia autorului: Claude Code = o corporație sau companie întreagă care execută funcții variate, nu un chatbot.

---

## BLOC 4 — Instalare Claude Code în terminal

**MacOS:**
```
# Mergi pe claude.ai/code sau caută "claude code" pe Google
# Copiezi comanda de instalare pentru MacOS
# O lipești în Terminal → Enter → aștepți ~2 minute
# Lansare: tastezi "claude" în terminal → Enter
```

**Windows:** același proces, dar folosești Terminal sau PowerShell.

**Verificare instalare:** dacă ai deja desktop app sau web version, Claude Code în terminal NU e instalat automat — trebuie instalat separat.

---

## BLOC 5 — Interfața terminalului — ce vezi și de ce contează

La lansare în terminal, Claude Code afișează:
- **Modelul curent** conectat
- **Procentul de context utilizat** — CRITIC de urmărit (mai jos)
- **Numărul de token-uri** în context
- **Limitele rămase** (5h și 7 zile) — poate fi personalizat în status line
- **Folderul curent** în care lucrezi
- **Versiunea Claude Code** instalată

**De ce procentul de context e important:**
- Cu cât mai mult context e încărcat → cu atât modelul devine mai lent și mai „prost"
- Cu cât mai mult context → cu atât mai repede consumi limitele
- **Regula de aur:** nu depăși 50% context per dialog dacă poți evita
- **Regula de lucru:** O sarcină = Un dialog (nu mai multe task-uri în același chat)

---

## BLOC 6 — Bypass Permissions — ce e și când îl folosești

**Ce face:** permite Claude Code să execute TOATE acțiunile (editare fișiere, comenzi terminal, servicii externe) fără să ceară confirmare la fiecare pas.

**Fără el:** fiecare acțiune necesită aprobare manuală — click după click.

**Cu el:** agentul lucrează complet autonom.

**Atenție:** folosește cu precauție — agentul poate face modificări care nu le vrei dacă instrucțiunea nu e clară.

---

## BLOC 7 — VS Code / Cursor: de ce ai nevoie de un IDE

**Problema cu terminalul pur:**
- Nu vezi ce fișiere a creat/modificat agentul
- Trebuie să deschizi File Explorer separat → cauți fișierele → deschizi în altă aplicație → înapoi
- Foarte ineficient

**Ce rezolvă VS Code / Cursor:**
- **File Explorer în stânga** — toate fișierele proiectului, vizibile instant
- **Editor în centru** — fișierele se deschid direct, fără aplicații separate
- **Terminal în jos sau dreapta** — Claude Code rulează chiar acolo
- **Extensia Claude Code** — interfață grafică pentru Claude, în panoul drept
- Poți deschide **mai multe ferestre de terminal simultan** (mai mulți agenți în paralel)

**Instalare VS Code:**
- visualstudio.com → Download pentru OS-ul tău → instalare standard
- Deschizi o folder goală → asta e proiectul tău
- Instalezi extensia „Claude Code" din Extensions (pictograma puzzle) → `claude login`

**Instalare Cursor / Antigravity:**
- antigravity.google → Download → necesită cont Google
- Recomandat dacă ai Google AI Pro (are AI agent integrat)

---

## BLOC 8 — Extensia Claude Code în VS Code: ce ai și ce lipsește vs. terminal

**Ce ai în extensie:**
- Istoricul dialogurilor (locale + web)
- Dialog nou cu buton
- Adaugă fișiere din proiect la context
- Activare browsing (agent vede site-uri)
- Slash-comenzi și skills în meniu
- Mod Bypass Permissions

**Ce lipsești față de terminal:**
- Nu vezi procentul de context în timp real (apare doar o iconiță când depășești 50%)
- Nu vezi limitele în timp real (trebuie să deschizi menu → Account & Usage)
- Unele slash-comenzi avansate există DOAR în terminal

**Recomandare practică:** folosește extensia pentru lucrul zilnic + deschide un terminal când ai nevoie de slash-comenzi avansate sau să monitorizezi context/limite.

---

## BLOC 9 — CLAUDE.md: creierul proiectului (fișierul-cheie)

**Ce este CLAUDE.md:**
- Fișierul pe care Claude Code îl citește PRIMUL la fiecare dialog nou
- Conține toată arhitectura proiectului: ce e proiectul, unde sunt fișierele, cum e structurat, ce trebuie să știe agentul
- Fără el, agentul trebuie să citească TOATE fișierele ca să înțeleagă proiectul → risipă de context
- Cu el, citind un singur fișier → înțelege totul

**Analogie:** CLAUDE.md = briefing-ul complet pe care îl dai unui angajat nou în prima zi, ca să nu trebuiască să exploreze singur fiecare sertar din birou.

**Cum se creează (fluxul recomandat):**
1. Creezi un fișier Markdown (ex: `instructions.md`) cu ce vrei să construiești
2. Îl trimiți agentului: „@instructions.md — pune-mi întrebări de clarificare, apoi creează CLAUDE.md, așteptă aprobarea mea, și după aceea începe implementarea"
3. Răspunzi la întrebări (sau spui „la discreția ta" pentru detalii minore)
4. Agentul creează CLAUDE.md → tu îl revizuiești și aprobi
5. Nou dialog → agent citește CLAUDE.md → începe lucrul

**Exemplu de conținut CLAUDE.md (din demo-ul din curs):**
- Numele companiei și ce face
- Structura site-ului (10 secțiuni)
- Paleta de culori & fonturi
- Stack tehnic (React, etc.)
- Fișierele și folderele proiectului
- Reguli de cod

---

## BLOC 10 — Fișierele Markdown (.md): standardul de lucru cu agenții

**De ce Markdown:**
- Toate modelele AI lucrează cel mai bine cu Markdown
- Format text ușor de citit atât de om cât și de agent
- Suportă: titluri, liste, tabele, cod, bold/italic
- E „Word-ul" pentru lucrul cu AI

**În VS Code:** extensii pentru preview Markdown (Ctrl+Shift+V pentru preview live)

**Regula:** dacă scrii instrucțiuni pentru un agent → scrie-le în `.md`.

---

## BLOC 11 — Demo live: construirea unui site de la zero

**Procesul demonstrat:**
1. Folder gol creat
2. `instructions.md` creat cu cerința (scurt, informal — „ce vreau să arate site-ul")
3. Agentul e rugat să pună întrebări de clarificare pe: branding, hero section, conținut, stack tehnic, animații, temă dark/light
4. Autorul răspunde (parte din întrebări → „la discreția ta")
5. Agentul creează `CLAUDE.md` cu: 10 secțiuni, paletă culori (alb + gri deschis + portocaliu accent), 3D effects (Three.js + React), 5 case studies placeholder
6. Aprobat → agent pornește implementarea
7. Agent creează TODO list vizibil (task-uri cu bifă în timp real)
8. Execută comenzi bash (Bash Tool) pentru a crea structura React
9. Timp total: 5-10 minute

**Ce se vede în terminal în timp real:**
- Tool calls (Read, Write, Bash)
- Fișierele create/modificate
- Token-uri consumate
- Procentul de context

---

## BLOC 12 — Gestionarea contextului: reguli practice

**Regula 1:** O sarcină = Un dialog nou
- CLAUDE.md → dialog 1
- Implementare → dialog 2 (nou, curat)

**Regula 2:** Monitorizează procentul de context
- Sub 50%: lucrezi normal
- Peste 50%: consideră un dialog nou
- Terminal arată procentul în timp real
- Extensia VS Code arată doar icoaniță la 50%+

**Regula 3:** Proiecte mari → dialog nou obligatoriu
- Dacă `instructions.md` e mare → dialog nou pentru implementare
- Spune agentului: „Ai fișierul X cu specificațiile. Pornește implementarea."

**Regula 4:** Nu lucra cu un singur chat pe tot proiectul
- Vechiul mod: chat lung cu zeci de mesaje → context plin → model prost
- Noul mod: dialoguri scurte, focalizate, cu CLAUDE.md ca memorie persistentă

---

## BLOC 13 — Sub-agenți și Agent Teams (preview din curs)

**Ce sunt sub-agenții:**
- Agenți secundari lansați de agentul principal
- Fiecare are propriul context izolat
- Pot rula în paralel (mai repede) sau secvențial (dacă depind unul de altul)

**Exemplu din proiect demo (Agent Teams News Intelligence Pipeline):**
- **Coordinator** — orchestrează ceilalți agenți
- **Scraper** — colectează știri
- **Analyst** — analizează conținutul
- **Reporter** — generează raportul final

Datele trec în lanț: Scraper → Analyst → Reporter → Coordinator primește rezultatul final.

**Output final al sistemului:**
- Google Sheets cu 4 foi (taburi)
- Raport PDF
- Briefing executiv

**Observație cheie:** agentul a detectat singur că lipsesc 3 variabile de mediu (API tokens pentru servicii externe) — le-a semnalat clar, fără să eșueze silențios.

---

## BLOC 14 — Ce urmează în curs (preview tematici netranscrise)

Conform intro-ului cursului, aceste teme sunt acoperite dar nu apar în textul disponibil:

- **Slash-comenzi personalizate** — cum creezi propriile comenzi `/skill-name`
- **Hooks** — puncte de intervenție în lifecycle-ul agentului
- **MCP Servers** — conectarea la servicii externe (Notion, Figma, Gmail, Calendar, etc.)
- **CLI Tools** — instrumente suplimentare de linie de comandă
- **GitHub integration** — ramuri, versionare, colaborare cu agenții
- **Agent Teams avansat** — comunicare între agenți, sincronizare stare
- **Sistemul agențial complet** — demo cu 31 agenți (oferit gratuit în Telegram)

---

## NOTE PENTRU PREZENTARE (producție HTML)

**Relația cu Sursa 1:**
- Sursa 1 = „De ce și ce" (filosofie, arhitecturi, pattern-uri)
- Sursa 2 = „Cum" (setup practic, fișiere, demo live)
- Împreună acoperă un modul complet despre agenți

**Slide-uri cheie de construit din Sursa 2:**
- Tabel comparativ variantele Claude Code (Bloc 2)
- Schema „chat vs agent" (Bloc 3) — vizual simplu
- CLAUDE.md = creierul proiectului (Bloc 9) — metafora briefing-ului
- Fluxul de creare CLAUDE.md (Bloc 9) — flow în 5 pași
- Reguli de gestionare a contextului (Bloc 12) — slide cu reguli vizuale
- Demo News Intelligence Pipeline (Bloc 13) — schema cu 4 agenți

**Adaptări pentru audiența IMM (non-tehnici):**
- „Fișier Markdown" → „fișier text cu instrucțiuni"
- „Stack React" → nu menționăm în prezentare, irelevant pentru IMM
- „Bash Tool / terminal commands" → „agentul execută acțiuni pe calculator"
- „API token" → „cheie de conectare la un serviciu extern"
- Focusul: ce FACE agentul pentru tine, nu cum funcționează tehnic pe interior
