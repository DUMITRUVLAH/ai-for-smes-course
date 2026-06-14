# Sesiunea 3A — Program & descrieri slide-uri
> **Cum îți construiești propriii agenți AI — de la vocabular la arhitectură**
> Document de program (curriculum) + descrieri slide. Se implementează în `session-03A.html`.
> **Stil vizual:** identic cu `session-01/02/03.html` (indigo `#2D52D4` + pasteluri, font Onest, bară de accent sus, tabele curate, fonturi mari). Reguli din `presentation-designer.md` (REGULA ZERO: business, nu vibe-coded).
> **Audiență:** profesioniști & antreprenori IMM, **non-tehnici**. **Ton:** expert accesibil, direct, fără jargon nedefinit.
> **Surse:** `session-03A-raw.md` (filosofie: 3 căi + 5 pattern-uri) + `session-03A-source2.md` (implementare: setup, CLAUDE.md, context, demo).

---

## Scopul sesiunii (ce trebuie să înțeleagă participantul la final)

La ieșirea din sesiune, un om non-tehnic trebuie să poată:
1. Să explice **ce e un agent** vs. un chat obișnuit (tool-use loop).
2. Să recunoască **vocabularul de bază** fără frică: API, hosting, domeniu, MCP, VS Code, Claude, terminal, CLAUDE.md.
3. Să știe **cele 3 căi** de a construi agenți și când se folosește fiecare.
4. Să citească o sarcină și să spună „asta e un *chain*", „asta e *routing*", „asta cere un *orchestrator*", „aici am nevoie de un *critic*".
5. Să înțeleagă cum se leagă mai multe medii de lucru într-o **arhitectură** (meta-orchestrare).
6. Regula de aur Anthropic: **începe simplu, adaugă complexitate doar când nu merge altfel.**

> **Decizia de design cheie:** punem **vocabularul fundamental ÎNAINTE** de arhitecturi (cerința explicită). Nimeni nu poate vorbi despre „MCP conectat la Notion" dacă nu știe ce e un API sau un domeniu. De aceea blocul 1 e un „dicționar vizual" de 2 slide-uri.

---

## Firul narativ (de ce ordinea asta)

1. **Cadru** — de ce trecem de la „chat" la „agent"; ce schimbă asta pentru un IMM.
2. **Dicționarul** — 8 cuvinte pe care le vei auzi azi (API, hosting, domeniu, terminal, VS Code, Claude, MCP, fișier .md). Demistificare, cu analogii.
3. **Ce e un agent** — chat vs. agent + tool-use loop (animație de flux).
4. **Mediul de lucru** — VS Code + extensia Claude: unde „trăiește" un agent.
5. **Cele 3 căi** — standard / sborki gata / arhitectură proprie. Plusuri, minusuri, când.
6. **Vocabularul de extensie** — 5 cărămizi (MCP, Skills, Sub-agenți, Hooks, Plugins).
7. **Canonul Anthropic** — „începe simplu" + nota despre costuri (abonament vs. API).
8. **Cele 5 pattern-uri** — chain, routing, parallel, orchestrator-workers, evaluator-optimizer. Piesa de greutate.
9. **CLAUDE.md & context** — creierul proiectului + regulile de igienă a contextului.
10. **Arhitectura în practică** — 6 medii interconectate (diagrama) + un exemplu real end-to-end.
11. **Recap & wrap-up** — tabelul celor 3 căi + „pe ce cale ești tu?" + homework.

**Total: ~31 slide-uri.** Sesiune de tip „concept + demo live" (nu hands-on greu — audiența nu codează). Momentele de demo live ale trainerului sunt marcate `DEMO`.

> **REVIZIA v2 (feedback Dima):** Dicționarul = **un cuvânt / slide cu vizual** (diagramă CSS sau slot screenshot real), nu carduri înghesuite. Adăugat **GitHub** (cuvânt + slide recap „calea 2"). Logo-uri reale unde există (Claude, GitHub, VS Code, Cursor, Notion, Gmail/Drive, Instagram/Meta). Pattern-urile = **flux vizual cu pași numerotați 1→2→3 și săgeți mari**, fiecare cu un „de ce ai nevoie de asta" + exemplu IMM. Evaluator-Optimizer = **buclă explicită 1-2-3** (generator → critic → înapoi la generator), exemplu **postări social media**. Tool-use loop = exemplu mai apropiat de antreprenor.

---

## SLIDE 01 — Copertă
**Tip:** copertă (`.slide-cover`)
**Kicker:** Sesiunea 3A · AI pentru IMM-uri & Antreprenori
**Titlu:** Cum îți construiești **propriii agenți AI**
**Subtitlu:** De la „un chat care răspunde" → la un sistem care lucrează singur pentru tine
**Logo-uri (jos, „Lucrăm cu:"):** Claude · VS Code · GitHub · Notion
**Note:** ton de „demistificare", nu de curs tehnic.

## SLIDE 02 — De ce trecem de la chat la agent
**Tip:** teach / comparație (`.vs-table` + quote)
**Conținut:** Chat = pui o întrebare, primești un răspuns, tu execuți. Agent = îi dai un **obiectiv**, el alege pașii, folosește unelte, verifică și livrează. Quote: „Nu te înlocuiește AI. Te înlocuiește omul care știe să-l folosească mai bine decât tine."

## SLIDE 03 — Agenda
**Tip:** agendă (`.agenda-list`, 2 coloane), badge `DEMO` pe cele live.

## SLIDES 04–11 — DICȚIONARUL (un cuvânt / slide, cu vizual)
Fiecare slide: **cuvânt + analogie + „de ce-ți pasă" + un vizual** (diagramă CSS sau slot screenshot real). Numerotate „Dicționar · N/8".
- **04 · VS Code / Cursor** — „biroul" agentului. Vizual: **slot screenshot real** (fereastra VS Code) + diagramă 3 zone (fișiere stânga / editor centru / agent dreapta). Logo VS Code + Cursor.
- **05 · Terminal** — „bucătăria din spate". Vizual: **mockup CSS de fereastră terminal** cu câteva linii (`claude`, tool call, ✓ done).
- **06 · GitHub** — „magazinul/biblioteca publică de cod și agenți". Vizual: **mockup CSS de repo-card** (owner/repo, ⭐ stele, „Clone"). Logo GitHub. Aici introducem GitHub înainte de „calea 2".
- **07 · Claude (Claude Code)** — agentul în sine; „Apple din lumea AI". Vizual: logo Claude mare + mini-mock chat→acțiune.
- **08 · Fișier .md (Markdown)** — „Word-ul" lucrului cu AI. Vizual: **mockup CSS** sursă .md vs. preview redat (titlu, listă, bold).
- **09 · API** — „priza standard" prin care 2 programe vorbesc. Vizual: **diagramă CSS** 2 cutii + priză la mijloc (App ⟷ Instagram). Logo Instagram/Meta.
- **10 · Domeniu + Hosting** (împreună, se explică reciproc) — adresa vs. terenul. Vizual: **bară de browser CSS** (`firma-mea.ro`) + „server/teren" dedesubt. Metafora: adresă vs. casă.
- **11 · MCP** — „priza universală" a agentului. Vizual: **diagramă hub-and-spoke CSS** — agent în centru, conectat la Notion / Gmail / Drive / bază de date (logo-uri). Anticipează cărămida MCP.

## SLIDE 12 — Ce este un agent (chat vs. agent)
**Tip:** teach (`.split-screen` neutral vs. evidențiat) — replica vizuală a slide-ului „Что такое агент"
**Conținut:** Stânga „LLM în chat": un ciclu, întrebare → răspuns, gata. Dreapta „Agent / Tool-use loop": Obiectiv → alege unealtă → folosește → vede rezultatul → decide pasul următor → repetă până e gata. Eticheta: „se repetă până sarcina e închisă".

## SLIDE 13 — Tool-use loop + exemplu concret
**Tip:** teach (`.llm-steps` 5 pași, flux cu săgeți) + bandă exemplu
**Conținut (exemplu mai apropiat de antreprenor):** „Pregătește-mi raportul de vânzări pe luna trecută." Pași numerotați cu săgeți: 1) Deschide fișierul de vânzări → 2) Calculează totaluri & top produse → 3) Compară cu luna anterioară → 4) Scrie un rezumat → 5) Trimite pe email/Slack. Mai mulți pași, unelte diferite, **le face singur**. Bandă: „Asta e un agent — nu un chatbot." + notă scurtă fereastra de context.

## SLIDE 13 — Mediul de lucru: VS Code + extensia Claude (DEMO)
**Tip:** teach (`.cards-grid cards-3`) + info-band setup. Logo VS Code + Cursor.
**Conținut:** 3 carduri: 1) Deschizi un **folder gol** = proiectul tău; 2) Instalezi extensia **Claude** → apare chat-ul lateral; 3) Tot ce construiește rămâne în folder. Info-band: variantele Claude (terminal / VS Code = serioase; web / desktop = limitate).

## SLIDE 14 — Cele 3 căi de a construi agenți (overview)
**Tip:** teach (`.cards-grid cards-3`, numerotate 1-2-3, a 3-a evidențiată). Logo GitHub pe cardul 2.
**Conținut:** Cale 1 — **Claude standard** (fără arhitectură). Cale 2 — **GitHub repositories** (agenți gata făcuți de alții — îi clonezi de pe GitHub). Cale 3 — **arhitectură proprie**. Toate testate; a 3-a funcționează cel mai bine — dar fiecare are locul ei.

## SLIDE 15 — Calea 1 & 2: unde se sparg
**Tip:** teach (`.split-screen` 2 panouri: Calea 1 / Calea 2, fiecare cu ✓ și ✗). Logo GitHub pe panoul 2.
**Conținut:**
- **Calea 1 (standard):** ✓ prag minim, bun pe taskuri simple. ✗ contextul se împrăștie după ~50 mesaje; uită regulile; alege prost uneltele; „cutie neagră".
- **Calea 2 (GitHub repositories — agenți gata, ex. Volt Engine, 0x Pure):** ✓ start rapid dacă taskul e tipic; bun ca referință, extragi un skill. ✗ taskul e al altuia; conflicte interne; nu te orientezi în cod străin.
**Concluzie (bandă):** ambele duc, la complexitate reală, tot către Calea 3.

## SLIDE 16 — Vocabularul de extensie: 5 cărămizi
**Tip:** teach (`.cards-grid cards-3` cu 5 carduri numerotate + 1 card-regulă)
**Conținut:** 1. **MCP** — *dă date* (Notion, Figma, printr-un standard unic). 2. **Skills** — *spun ce să facă* (se încarcă automat; scrii o dată). 3. **Sub-agenți** — *izolează contextul* (mini-executanți în paralel). 4. **Hooks** — *țin regulile* (puncte unde se oprește și cere validare). 5. **Plugins** — *împachetează tot* (le dai unui coleg). Card-regulă: „Mai mult ≠ mai bine. Agent simplu = 1-2 skills. Alegi conștient."

## SLIDE 17 — Canonul Anthropic: începe simplu
**Tip:** teach (quote mare + 2 stat carduri) cu logo Anthropic
**Conținut:** „Building Effective Agents" = dicționarul industriei. Teza: **soluția cea mai simplă întâi; complexitate doar când fără ea nu merge.** Notă costuri IMM: **abonament** (Pro ~17$ / Max), nu API (≈ 7× mai scump, pentru automatizări server-side). Limitele se reînnoiesc la 5h.

## SLIDE 18 — Calea 3: cele 5 pattern-uri (overview)
**Tip:** teach (`.cards-grid cards-3`, 5 carduri numerotate + bandă „cum schimbă gândirea")
**Conținut:** 1) Prompt Chaining · 2) Routing · 3) Parallelization · 4) Orchestrator-Workers · 5) Evaluator-Optimizer. Bandă: „Te uiți la task și spui «asta e un chain» / «routing cu 3 ramuri» / «orchestrator cu 3 workeri» — și construiești sub asta."

## SLIDE 19 — Pattern 1: Prompt Chaining (flux vizual + de ce)
**Tip:** flux orizontal cu pași numerotați 1→2→3→4 (`.flow-rail`), bandă „de ce / când" + exemplu.
**Conținut:** Lanț fix; ieșirea unuia = intrarea următorului. Flux IMM: **1 Recenzii clienți → 2 Teme recurente → 3 Mesaje-cheie → 4 Descriere de produs.** „De ce ai nevoie: când pașii sunt mereu aceiași, în aceeași ordine — predictibil, ușor de verificat la fiecare pas."

## SLIDE 20 — Pattern 2: Routing (flux vizual + de ce)
**Tip:** diagramă ramificată (un input → 3 ramuri) cu pași/etichete, bandă „de ce".
**Conținut:** Clasifici inputul → cale diferită. Flux IMM: **Mesaj de client →** se ramifică în: Reclamație → flux A · Cerere ofertă → flux B · Întrebare tehnică → flux C. „De ce ai nevoie: când tipuri diferite de cereri au nevoie de tratamente complet diferite — nu le forțezi pe toate prin același proces."

## SLIDE 21 — Pattern 3: Parallelization (flux vizual + de ce)
**Tip:** diagramă fork→join (sectioning) + mini voting, săgeți.
**Conținut:** **Sectioning:** un task → 3 verificări simultane (copywriting / structură / accesibilitate) → o singură listă. **Voting:** „5 variante de titlu" → alegi 1. „De ce ai nevoie: viteză (lucruri independente în paralel) sau cea mai bună variantă din mai multe."

## SLIDE 22 — Pattern 4: Orchestrator-Workers (diagramă + de ce)
**Tip:** diagramă orchestrator → 4 workeri (deja `.orch`), bandă „de ce".
**Conținut:** Dispecer primește brief, deleagă către executanți cu context propriu. Ex IMM: *„concept pagină de produs nouă"* → Worker 1 textele · 2 structura · 3 componente pe stilul brandului · 4 stările goale. „De ce ai nevoie: când **nu știi dinainte câte sub-sarcini** sunt — dispecerul decide la fața locului. (Diferența de chain: chain = pași știuți; orchestrator = împărțire dinamică.)"

## SLIDE 23 — Pattern 5: Evaluator-Optimizer (BUCLĂ 1-2-3 + de ce)
**Tip:** buclă explicită cu pași numerotați **1 Generator → 2 Critic → (3) înapoi la Generator**, săgeată de retur evidențiată.
**Conținut:** Exemplu **postări social media**: 1) Generatorul scrie un draft de postare → 2) Criticul îl notează (hook, claritate, call-to-action, tonul brandului) → 3) Înapoi la generator cu observațiile → se reia până trece pragul (ex. 8/10). „De ce ai nevoie: calitate mai mare fără să stai tu să ceri «mai bine» de 5 ori — agentul-critic face presiunea în locul tău." Notă: costă mai mult (limite), dar merită la conținut care contează.

## SLIDE 24 — Creierul proiectului: CLAUDE.md
**Tip:** teach (`.split-screen` neutral „fără" vs. „cu" + metaforă)
**Conținut:** `CLAUDE.md` = primul fișier pe care agentul îl citește la fiecare dialog. Conține: ce e proiectul, unde sunt fișierele, regulile. **Fără el:** agentul citește tot ca să înțeleagă → risipă de context. **Cu el:** citește un fișier → știe tot. Metaforă: briefing-ul complet pe care-l dai unui angajat nou în prima zi. Flux scurt (3 pași): scrii ce vrei într-un `.md` → agentul pune întrebări & creează `CLAUDE.md` → aprobi → dialog nou, începe lucrul.

## SLIDE 25 — Igienă de context: 3 reguli
**Tip:** teach (`.cards-grid cards-3`, 3 reguli) + info-band
**Conținut:** Context plin = model mai lent, limite consumate mai repede. 1) **O sarcină = un dialog.** 2) **Sub 50% context** — peste, dialog nou. 3) **Proiect mare → dialog nou obligatoriu.** Info-band: „CLAUDE.md e memoria persistentă."

## SLIDE 26 — Arhitectura în practică: 6 medii, un sistem (DEMO)
**Tip:** teach (`.cards-grid cards-3`, 6 carduri) + bandă exemplu end-to-end
**Conținut:** 6 medii interconectate (YouTube · Școală · Site Builder · Program Builder · Curs · Demo). Legate prin `CLAUDE.md` principal + un `registry.md`. Bandă exemplu: *„fă un landing pentru curs"* → Routing → Program Builder → Site Builder → pagină gata.

## SLIDE 27 — Cele 3 căi — recap & alegere
**Tip:** tabel recap (`.slide-table`)
**Conținut:** Calea | Când o folosești | Plus | Minus.
- **Standard** — start, taskuri simple — prag minim — plafonează la complex.
- **GitHub repositories** — task tipic cu soluție matură — start rapid, referință — arhitectura e a altuia.
- **Arhitectură proprie** — control & scalare — știi exact ce face — nu e start rapid.
Bandă regula Anthropic.

## SLIDE 28 — Wrap-up & Homework
**Tip:** wrap (`.wrapup-grid`)
**Conținut:** Ce ai învățat + homework (identifici un task repetitiv și-i spui pattern-ul; dai agentului articolul Anthropic; reflecție „pe ce cale ești?"). Închidere: AI nu te înlocuiește; te înlocuiește omul care-l folosește mai bine.

---

## INVENTAR LOGO-URI
| Tool | Status |
|---|---|
| Claude / Anthropic | ✅ `claude.svg`, `anthropic.svg` |
| GitHub | ✅ `github.svg` (adăugat v2) |
| VS Code | ✅ `visualstudiocode.svg` (adăugat v2) |
| Cursor | ✅ `cursor.svg` (adăugat v2) |
| Notion | ✅ `notion.svg` |
| Google Drive | ✅ `googledrive.svg` |
| Meta / Instagram (pt. exemplu API) | ✅ `meta.svg`, `facebook.svg` |

## INVENTAR SCREENSHOTS (slot etichetat — le pune Dima)
| Slide | Screenshot |
|---|---|
| 04 (VS Code) | fereastra VS Code reală (3 zone: fișiere / editor / agent) |
| 06 (GitHub) | un repo de agenți pe GitHub (opțional, peste mockup-ul CSS) |
| 13 (Demo VS Code) | extensia Claude în panoul lateral |

## NOTE DE IMPLEMENTARE (v2)
- **Dicționar = un cuvânt / slide**, fiecare cu vizual (diagramă CSS sau slot screenshot). 8 slide-uri (04–11).
- **GitHub** introdus ca cuvânt (06) ȘI ca formularea „calea 2" (14, 15, 27).
- **Pattern-urile (19–23)** = câte un slide fiecare, **flux vizual cu pași numerotați și săgeți**, plus „de ce ai nevoie". Evaluator (23) = buclă 1-2-3 cu exemplu postări social media.
- Tool-use loop (12) = exemplu raport de vânzări (mai apropiat de antreprenor).
- Paleta indigo + pasteluri, consecventă cu S1–S3 (NU verde-lime din referințe).
- Numerotare slide jos-dreapta: `NN / 28`.
