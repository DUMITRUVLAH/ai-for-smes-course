# Sesiunea 3A — Material brut (transcript video structurat)
> **Subiect:** Cum îți construiești propriii agenți AI — cele 3 căi
> **Sursă:** transcript video YouTube, structurat pe blocuri tematice
> **Stare:** draft brut — de rafinat înainte de producția în HTML
> **Audiență:** profesioniști non-tehnici, antreprenori IMM

---

## BLOC 0 — Intro & context canal

Toate agentele prezentate în video sunt construite de la zero — nu descărcate din tutoriale YouTube, nu copiate din sborki gata. Există 3 căi de a construi agenți. Toate au fost testate. A treia funcționează cel mai bine — dar asta nu înseamnă că celelalte sunt irelevante.

**Ce arată videoul:**
- Ce se strică pe Claude Code standard
- Unde sunt plusurile și minusurile sborki-urilor gata
- Din ce construiești propria arhitectură, cu referință la canonul Anthropic + update-urile din 2026

---

## BLOC 1 — De ce Claude Code (și nu altceva)

Poți folosi orice model: gratuit, chinezesc, puternic, slab, local. Dar Claude = Apple din lumea AI: calitate maximă cu prag minim de intrare.

**Mediu de lucru necesar:**
- VS Code (gratuit) sau Cursor / Antigravity
- Deschizi un folder gol → acolo trăiește proiectul tău
- Instalezi extensia Claude → apare chat-ul în lateral
- Tot ce construiești cu agentul rămâne în acel folder: fișiere text, grafice, orice output

---

## BLOC 2 — Calea 1: Claude Code standard (fără arhitectură)

**Cum funcționează:** deschizi ca atare, explici ce vrei prin cuvinte, corectezi din mers.

**Prag de intrare:** minim — funcționează bine pe taskuri simple.

**Unde se strică:**
- Context se împrăștie după ~50 de mesaje
- Explici a 10-a oară că nu poți rupe token-urile din design system
- Agentul a uitat înțelegerile din începutul sesiunii
- Instrumentele sunt alese prost — Claude vede 10 tool-uri disponibile și ia primul care seamănă
- Agentul decide la mijlocul procesului: „Mai bine repar totul" → intră în recursivitate, consumă token-uri, tu nu știi ce face
- Funcționează ca o cutie neagră — face ceva, nu știi ce

**Concluzie:** nu e că Claude Code e prost — e limitarea abordării. O singură sesiune universală cu reguli adăugate verbal, fără arhitectură, funcționează doar până la un anumit nivel de complexitate.

**Când e suficientă calea 1:** taskuri simple, nu prea variate, ca să te obișnuiești cu instrumentul.

---

## BLOC 3 — Mini-bază: ce este un agent (2 minute)

**LM în chat ≠ agent.**
- ChatGPT: scrii „inventează un nume" → răspunde → un ciclu. Gata.
- Agent: primește task → alege singur ce instrument să folosească → folosește → vede rezultatul → decide pasul următor → repetă până task-ul e închis.

Acest ciclu se numește **Tool-use loop**.

**Exemplu concret (designer de produs):**
> „Colectează insight-uri din 10 transcrip-uri de interviuri"
> Agentul: deschide primul fișier → extrage insight-uri → deschide al doilea → compară → notează în Notion
> Mai mulți pași, instrumente diferite, le face singur.

**Fereastra de context** = tot ce agentul ține în minte într-o singură sesiune.
- Claude Opus 4.7: 1 milion de token-uri ≈ 750.000 de cuvinte ≈ 10 cărți groase
- Sună mult, dar dacă taskul e lung și variat → se umple repede (transcrip-uri, fișiere, istorii, rezultate de tool-uri, design system din Figma)
- Când se umple → contextul începe să „plutească"

**Distincția esențială** (din articolul Anthropic „Building Effective Agents"):
- **Workflow (cale fixă):** pas 1 → pas 2 → pas 3, mereu în aceeași ordine
- **Agent (decide singur):** modelul alege ce pași să facă, în ce ordine, la ce moment

~80% din taskurile unui designer de produs = workflow (brief → concept doc → wireframe → machet). Pași ficși, trebuie parcurși în ordine.

---

## BLOC 4 — Calea 2: sborki gata (repository extern)

**Cum funcționează:** mergi pe GitHub, clonezi un pachet de sub-agenți, hook-uri, MCP server-uri, skill-uri gata construite.

**Exemple menționate:**
- Volt Engine: 100+ sub-agenți gata
- 0x Pure: sute de skill-uri de la ingineri Anthropic, Google Labs, Vercel, Stripe

**Prag de intrare:** rapid — clonezi, deschizi, îi spui „familiarizează-te cu mediul".

**Când funcționează bine:** task tipic + există deja o soluție matură pentru el (review de cod, asistent pentru un stack standard, teste automate).

**Limitări:**

1. **Task-ul e al altuia** — cel care a construit sborka a optimizat-o pentru flow-ul lui. Dacă al tău are un design system specific, ritualuri proprii → nu se potrivește complet.

2. **Conflicte interne** — un pachet mare poate conține sub-agenți care se activează inoportun, hook-uri cu reguli inutile. Să le depanezi costă timp.

3. **Nu te orientezi înăuntru** — cod străin, directive străine, logică străină. Când ceva merge prost, nu știi de unde.

**Concluzia:** sborka e un bun referință și un punct de start bun dacă se potrivește exact pe task. Poți extrage un skill individual și să-l integrezi în sistemul tău. Dar să clonezi un pachet mare și să lucrezi în el ca în propriul tău — mai devreme sau mai târziu ajungi tot la calea 3.

*Toate mediile menționate în video → link-uri în canalul Telegram, nu doar în video.*

---

## BLOC 5 — Vocabularul de bază: 5 mecanisme de extensie

Înainte de calea 3, vocabularul fără care nu poți vorbi despre arhitecturi.

**1. MCP (Model Context Protocol)**
Conectorul cu exteriorul. Îi dă agentului acces la date externe, API-uri, baze de date — printr-un standard unificat. Exemplu: să publice în Notion, să interacționeze cu Figma, să urce/descarce frame-uri, să transforme designuri în prototipuri.

**2. Skill-uri**
Spun ce să facă. Se încarcă automat când task-ul se potrivește. Navighele pe care agentul le cunoaște și le folosește când primește o sarcină relevantă. Exemplu: skill „UX Audit" — când activezi skill-ul, agentul știe să auditeze un site după criterii specifice, cu o structură predefinită. Scrii o dată, apelezi de câte ori vrei.

**3. Sub-agenți (agenți secundari)**
Minioni care execută o sarcină specifică, izolată. Agentul tău principal îi poate lansa singur, în paralel — dacă ai descris în arhitectură că pentru anumite sarcini să creeze sub-agenți.

**4. Hook-uri**
Păstrează regulile. Sunt puncte în lifecycle-ul agentului unde te poți „băga" — locuri unde agentul trebuie să te contacteze, să ceară date suplimentare. Exemplu: în mijlocul unui flow, agentul se oprește, îți cere validare, continuă.

**5. Plugin-uri**
Pentru distribuție și sharing. Ai construit un mediu complex (MCP conectat la Figma + Notion, skill-uri pentru procese, sub-agenți definiți, hook-uri) → îl împachetezi și îl trimiți unui coleg de echipă. El îl deschide și are imediat același context.

**Regula cheie:** mai mult nu înseamnă mai bine. Agent simplu = 1-2 skill-uri. Workflow mare = poate sub-agenți + MCP. Alegi conștient: e nevoie de un skill fiindcă task-ul se repetă; e nevoie de un sub-agent fiindcă am nevoie de context izolat.

---

## BLOC 6 — Canonul Anthropic: „Building Effective Agents"

Articolul publicat de Anthropic la începutul anului trecut = dicționarul industriei.

**Teza centrală a Anthropic:** găsește mai întâi soluția cea mai simplă. Adaugă complexitate doar când fără ea nu merge. Altfel obții: mai scump + mai lent + mai multe erori acumulate.

**Notă despre costuri (clarificare importantă):**
- „Mai scump" = relevant doar dacă folosești prin API Key (plătești per token, de ~7× mai mult decât abonamentul)
- API se folosește pentru soluții server-side, sarcini repetitive automatizate
- Designerii, web devii, antreprenorii folosesc **abonamente** Claude
  - Pro / Max 5× / Max 20×
  - Limite se reînnoiesc la **fiecare 5 ore**
  - Max 5× = în utilizare intensă normală, limitele nu se epuizează
  - Epuizare reală = 4 ore consecutive de vibe-coding (creat site + design system din Figma + scenarii + postări în paralel)

---

## BLOC 7 — Calea 3: arhitectura proprie — cele 5 pattern-uri

*Din „Building Effective Agents" — 5 pattern-uri. Prezentate prin exemple de design de produs.*

### Pattern 1 — Prompt Chaining (lanț de pași ficși)
Ieșirea unui pas = intrarea pasului următor. Ordinea nu se schimbă niciodată.

**Exemplu:**
> Transcript interviuri → extrage insight-uri → formează persona → generează user stories pentru backlog

Trei pași concreți, predicibili, secvențiali. Cazul ideal pentru chaining.

---

### Pattern 2 — Routing (ramificare pe tipuri de input)
Clasifici ce intră și trimiți pe o cale diferită.

**Exemplu:**
> Vine un request → este o corecție a unei funcționalități existente? → duce la pipeline A
> Este o secțiune nouă de produs? → pipeline B
> Este o actualizare a onboarding-ului? → pipeline C

Reguli diferite, componente diferite, stakeholder-i diferiți pentru fiecare cale.

**Exemplu personal (meta-orchestrație):**
Agentul citește un registru central (`registry.md`), identifică cu ce mediu trebuie să lucreze și de acolo știe ce skill-uri să folosească. Nu parcurge toate mediile la fiecare task nou — o singură dată ai descris routing-ul, el îl folosește de atunci.

---

### Pattern 3 — Paralelism (mai multe LLM-uri pe sub-sarcini, simultan)
Două forme:

**Sectioning:** mai multe task-uri în paralel → se agregă la final.
> Machet lansat → 3 verificări paralele: design system / copywriting / accessibility
> Fiecare merge la un sub-agent, fiecare returnează observații, le combini într-o listă

**Voting:** același task, executat de N instanțe, alegi cel mai bun rezultat.
> „Generează 5 variante de hero section cu abordări diferite" → alegi una

---

### Pattern 4 — Orchestrator–Workers (dirijor + orchestră)
Un agent-orchestrator știe cui să delege. Ceilalți agenți = executanți cu propriile contexte.

**Exemplu:**
> „Construiește conceptul unei noi secțiuni de produs"
> Orchestratorul primește brief-ul și deleagă:
> - Agent 1 → UX copy (are skill-ul potrivit)
> - Agent 2 → structură și arhitectură informațională
> - Agent 3 → componente pe design system
> - Agent 4 → stări de ecrane goale

Posibil complet. Demonstrat în sesiuni live și în programul de curs.

---

### Pattern 5 — Evaluator–Optimizer (generator + critic în buclă)
Un LLM generează. Altul critică. Bucla se repetă până trece de criteriul criticului.

**Exemplu:**
> Text pentru un bloc → Agent 1 generează variante → Agent 2 critică din perspectiva conversiei și a tone of voice → revizuire → critic din nou → dacă trece, oprire

Costă mai mult (limite consumate mai repede), dar calitatea e mai înaltă. Alternativa: tu îi ceri manual să revizuiască de 3 ori → tot durează, dar prin tine.

---

## BLOC 8 — Cum se aplică în practică (exemplu personal — 6 medii)

*Arhitectura personală cu 6 medii de lucru interconectate:*

| Mediu | Ce face |
|---|---|
| **YouTube** | Construiește scenariile video (acesta inclus), analizează analytics, parsează comentarii, identifică teme cu engagement, propune subiecte noi |
| **Școală** | Conținut pentru Telegram, funnel-uri, anunțuri de sesiuni live — știe tonul, exemplele, calendarul |
| **Web Builder** | Construiește site-uri NextJS cu design system-ul din Figma încărcat; are acces la servere și parole; verifică și depanează singur |
| **Program Builder** | Cunoaște complet programa cursului, structurează materia, generează sumar → publică automat în Notion ca metodică pentru studenți |
| **Curs** | Mediul în care demonstrezi live tot ce predai |
| **Demo** | Mediu hibrid pentru sesiuni live — mai puțin adânc, dar acoperă toate bucățile de proces |

**Cum funcționează legătura:**
- Un `CLAUDE.md` principal = instrucțiunea de top pentru întreaga structură
- Un `registry.md` = maparea mediilor: ce există, pentru ce, cuvintele-trigger
- La task nou: agentul citește registrul, identifică mediul potrivit, deschide directive-le acelui mediu

**Rezultat practic:**
> Vreau să fac o pagină de landing pentru programul „AI & Native Designer"
> → Mediul Web Builder știe design system-ul (din Figma)
> → Mediul Program Builder are tot conținutul (toată programa)
> → Preia structura de pe o pagină existentă (ex: pagina pentru Cale)
> → Construiește, animează, publică pe server

Agentul a adăugat singur animații fluide, a formulat texte pe baza materialelor existente, a structurat programa în dropdown-uri.

---

## BLOC 9 — Concluzie & când să nu folosești arhitectura

**Calea 1 — standard:**
✓ Bun pentru start, taskuri simple, să te obișnuiești cu instrumentul
✗ Plafonează la sarcini complexe și variate

**Calea 2 — sborki gata:**
✓ Rată de start rapid dacă task-ul e tipic și există o soluție matură
✓ Bun referință, poți extrage skill-uri individuale
✗ Arhitectura e a altcuiva; când se strică, nu știi de unde; depui la actualizările lor

**Calea 3 — arhitectură proprie:**
✓ Controlezi complet, știi exact ce face și de ce
✓ Nu ai surprize la update-uri
✓ Scalează cu tine
✗ Nu e un start rapid — necesită să înțelegi principiile

**Regula Anthropic:** începe simplu. Adaugă complexitate doar când nu merge altfel. Nu e nevoie de arhitectură pentru o sarcină punctuală.

**Ce trebuie citit:** articolul „Building Effective Agents" de la Anthropic (~1 oră de lectură atentă). Link în canalul Telegram.

**Alternativă rapidă:** îi dai agentului articolul să-l citească, îi descrii ce sarcini ai, îi ceri să propună o arhitectură optimă. Funcționează — dar e mai bine să înțelegi tu cum funcționează.

---

## BLOC 10 — CTA & wrap-up

- Comentarii: pe ce cale ești tu acum? (1, 2, 3 sau „mă uit deocamdată")
- Like + abonare ajută canalul
- Link Telegram → toate mediile menționate, skill-urile personale, directivele, link-uri la sesiunile live
- Curs „AI & Native Designer" — link activ, locuri limitate la următoarea cohortă
- Comunitate: participanți din bănci, tech companies mari; cerințe de la adberbank, profi.ru, etc.
- Concluzie: nu te înlocuiește AI. Te înlocuiește omul care știe să-l folosească mai bine decât tine.

---

## NOTE PENTRU PREZENTARE (de ținut minte la producție HTML)

- Firul narativ: **problema → vocabular → pattern-uri → demo live** (nu teorie pură)
- Exemplele sunt din design de produs — pot fi adaptate pentru IMM-uri (înlocuiești „design system" cu „catalog de produse", „UX audit" cu „audit website")
- Slide-ul cu cele 5 pattern-uri = piesa de greutate (echivalentul slide-ului 16 din S3)
- Trebuie slide vizual cu schema celor 6 medii interconectate (ca o diagramă simplă, nu text)
- Tabelul de comparație a celor 3 căi = candidat pentru slide de recap final
- „Tool-use loop" merită o animație sau un flow vizual (pas 1 → 2 → 3 → 1)
- Toate referințele la costuri → adaptate pentru audiența IMM (abonament, nu API)
