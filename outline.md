# Outline

**Talk:** ORCA: a collaboratively-built AI-powered Shiny app built on Posit Team
**Presenters:** Michael Thomas (Ketchbrook Analytics, front-end/UX) & Keaton Wilson (KS&R, back-end/infrastructure)

> TODO // Question for Keaton / KS&R: Would it be possible for me (Michael) to re-gain access to the ORCA GitHub repository?  It would be helpful to remind myself of the app's general architecture.

---

## Hook

- Open with a question, not a feature list: **"How do you build one piece of software when the front-end engineer and the back-end engineer work for two different companies — and neither one can ship without the other?"**
- Name the failure mode everyone in the room recognizes: the "one person did all the work" group project, or its enterprise equivalent — a system thrown over the wall from dev to research team, or from vendor to client, that nobody fully understands or trusts.
- Promise: this talk is that story told in reverse — a front-end/back-end, agency/client pair who *had* to depend on each other, and the software engineering best practices & Posit-based tools that made the dependency work instead of hurt.
- Land the stakes in one line: the result, ORCA, is now how KS&R's researchers code thousands of open-ended survey responses with AI — and trust the answer.

## Context / Setup

- The problem ORCA solves: open-ended survey response coding (categorizing free-text answers) is slow, manual, and inconsistent at scale — AI can accelerate it, but research clients won't accept a black box. Trust, transparency, and reproducibility aren't nice-to-haves, they're the deliverable.
- The twist that makes this a *collaboration* talk, not just a tech talk: KS&R (the research firm, back-end/infra owner) and Ketchbrook Analytics (the consultancy, front-end/UX owner) had to design and build ORCA together, across a company boundary.
- Introduce the two lenses the audience will hear from: Michael on the Shiny front-end (job submission, response review, interactive code editing) and Keaton on the Posit-based back-end ({golem}, plumber, pins, scheduled workflows).
- Frame the throughline for what follows: at every stage, a front-end decision made the back-end's job harder or easier, and vice versa — the talk is structured around three moments where that tension got resolved productively.

## Chapter 1 — Designing together before writing a line of code

- Shared understanding first: Wireframing sessions where UI mockups and data/API shape were sketched in the same room, before either side committed to an implementation.
    + TODO // Keaton -- I can't remember the name of the platform that you KS&R used for wireframing -- it was awesome; you guys left sticky notes on top of the mockup UI 
- KS&R's brand book and design system as a forcing function — it gave the front-end constraints early, which in turn gave the back-end a stable target (what data the UI would need, in what shape, on what cadence).
- The key move: translating a research workflow (submit a coding job → review AI suggestions → edit/approve) into a UI spec *and* an API contract at the same time, so neither side was guessing about the other's needs.
- Payoff: this is the front-end making the back-end's life easier — a clear contract, agreed on visually, before any {plumber} endpoint existed.

## Chapter 2 — Building in parallel without blocking each other

- How the teams worked async across two companies: GitHub Issues and PRs as the shared source of truth, a branching model that let front-end and back-end ship independently against the agreed contract.
- The back-end architecture that made this possible: a {golem}-based Shiny app decoupled from a plumber API for asynchronous job processing — meaning the UI could be built and iterated against a stable API surface while the heavier AI/coding logic evolved behind it.
- Concrete example of cross-pollination: a UX need (e.g., showing live job status, letting researchers edit AI output inline) drove a back-end design decision (async job handling, structured logging) — and a back-end constraint (batch processing costs/timing) shaped a front-end pattern (progress states, review queues).
- This is the chapter that answers Keaton's "why did this collaboration succeed" question directly — with the receipts (issues, PRs, contracts) rather than just an assertion.

## Chapter 3 — Earning trust in production

- The last mile for any AI tool in a research context: transparency and reproducibility, not just accuracy.
- Pins for versioned metadata and datasets — every AI-coded result is traceable to a specific model version and data snapshot, so results can be audited and reproduced.
- Scheduled batch workflows for logging and delivery — the audit trail that lets researchers (and clients) see what happened, not just what the AI concluded.
- Tie back to the front-end: the review/edit interface is where human judgment stays in the loop, and it only works because the back-end guarantees what's underneath it is versioned and reproducible. Trust is a joint front-end/back-end deliverable, not a feature of either one alone.

## Conclusion / Call to Action *(placeholder — likely to firm up later)*

- The real product wasn't just ORCA — it was a repeatable model for cross-company, cross-discipline collaboration on the Posit stack.
- Takeaway for the audience: if you're building Shiny apps with a partner team (agency/client, research/engineering, frontend/backend), invest early in shared visual contracts (Excalidraw, <KS&R's wireframing app>, etc.), issue-driven development, and an architecture ({golem} + {plumber} + {pins}) that lets both sides move independently against a stable interface.

<!-- - Possible CTA: encourage attendees to bring a *design* artifact (not just code) to their next cross-team Posit project — the wireframe/contract step is what made everything downstream cheaper. -->
