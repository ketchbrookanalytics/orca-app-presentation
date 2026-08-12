# ORCA Talk — Structure & Organization Feedback
*From coaching session with Blythe Coons, 2026-08-10 (session 2 of the talk prep series)*

## Overall verdict
Blythe's headline note: **the structure is strong overall**, but one chapter (the current Ch. 3 / backend section) needs to be reframed so it actually answers the question the talk is posing, rather than drifting into a tangential "AI best practices" discussion.

---

## 1. Hook — needs a concrete, personal story
- Current hook (the "group project gone wrong" framing) is good, but it's currently **generic/hypothetical** rather than a specific anecdote.
- **Action:** Swap in a real, personal bad-group-project story if you have an accessible one (Blythe's example: building a physics roller coaster where "being in the same room didn't mean everyone did work"). A specific story lands faster than a generic appeal to shared experience.
- Then pivot hard: *"This wasn't that."* Use the contrast to launch into the ORCA collaboration.
- **Optional addition (both you and Michael already discussed):** note that this "toxic collaboration" pattern isn't just a college thing — it still happens in industry today (e.g., a stakeholder handing over a one-paragraph spec with no wireframing or back-and-forth). This reinforces stakes for a professional audience without needing more time.

## 2. Chapter/section split with Michael — keep, but tighten transitions
- Current division is logical and should stay:
  - **Hook + Context/Setup** — Keaton (what ORCA is, the KSNR problem, how labor was split)
  - **Design-first / mockups before code** — Michael
  - **Building in parallel without blocking** — Michael
  - **Ch. 3 (needs rework — see below)** — Keaton
  - **Conclusion / repeatable model for cross-company collaboration** — Michael
- **Action:** Before the next session, get very explicit with Michael about exactly where each handoff happens — Blythe's rule: *"make chunks as big as possible to minimize handoffs,"* and treat each transition like a museum tour guide moment (clearly tell the audience where you're taking them next so no one feels left behind).

## 3. Chapter 3 (backend/production chapter) — the core fix needed
This was the main structural issue identified.

**Diagnosis:** As written, this chapter is framed around "AI application best practices" — general guidance that doesn't clearly serve the story's actual question (*how do you divide the workload and choose tools to build software successfully and collaboratively?*). It currently answers a different question — "what happens after collaboration, once it's in the world" — which doesn't fit where it's placed in the arc.

**Reframe:** Shift the chapter's center of gravity from *"AI best practices"* to **the backend's separation-of-concerns / functional design** — i.e., how modularizing the backend independently from the front end is *what made the parallel, non-blocking collaboration possible*. This ties directly back into the talk's actual throughline.

**On the AI angle specifically:**
- You (Keaton) were torn about how much to feature AI-specific best practices, since it's genuinely interesting and relevant to your new role.
- Blythe's suggested resolution: keep it, but **frame it as a personal aside, not the chapter's spine** — something like: *"I really wanted to dig into the AI best practices here, but ultimately this wasn't really about the AI — it was about the collaboration. Here's what I want you to know if you're curious, and it's all in a repo/QR code."*
- This turns a structural weak point into a "human moment" (genuine, in-the-room reflection) rather than a stretch justification.
- Bottom line test Blythe posed: *would this backend design decision have been made the same way even if it weren't an AI-powered app?* You concluded yes — which is the signal that AI details belong as a pointer/resource, not the chapter's core argument.

## 4. Limitations — sprinkle throughout, not at the end
- Padma's suggestion, which Blythe endorsed: don't save limitations/what-we-couldn't-include for the conclusion.
- **Reasoning:** Conclusions should only recap, not introduce new ideas — saving limitations for the end effectively introduces new material there.
- **Action:** Weave limitations in as you go. One concrete example already identified: the reasoning behind giving Michael's team the front end and keeping the backend in-house (lower institutional/financial risk for an external partner to touch the AI-spend backend vs. the UI) — this belongs in the **context/setup section**, briefly, not as a standalone chapter or a conclusion caveat.
- **Caution flagged by Blythe:** context-setting could easily eat the whole talk — be deliberate about which contextual/limitation details actually earn their place.

## 5. Conclusion
- No changes needed yet — Blythe's rule of thumb: don't force the conclusion early; it usually clarifies itself once the rest of the talk (especially the hook) is locked. Golden rule: **no new ideas in the conclusion**, just callback/wrap-up.

## 6. Logistics / what's due before Session 3
- Need the **hook + context/setup fully built** (through the end of that first "bulky chapter") by the next session.
- Need **visuals** in place — Blythe is sending the recording of last week's visuals demo as reference.
- Come to Session 3 with a **specific ask** for the group (e.g., feedback on visuals vs. a specific section) rather than open-ended feedback.

---

## Quick action checklist before building slides
- [ ] Write/confirm a specific personal hook story (or decide to keep the generic version if none feels right)
- [ ] Add the "this still happens in industry" beat to the hook/context section
- [ ] Rewrite Chapter 3 around backend separation-of-concerns / functional design, not general AI best practices
- [ ] Draft the "AI aside" as a brief personal-reflection moment with a QR code/repo pointer for deeper AI best-practices content
- [ ] Distribute limitations in-line (starting with the front-end/back-end risk-split rationale in context/setup) rather than in the conclusion
- [ ] Finalize hand-off language with Michael at each chapter transition
- [ ] Lock hook + context/setup section and prep visuals ahead of Session 3
