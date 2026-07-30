# 1-Minute Split-Screen Video Abstract (Technical Cut)

## Keaton (0:00–0:12)
Hi, I'm Keaton Wilson, a Solutions Developer at KS&R.
I'll be co-presenting with Michael Thomas, Chief Data Scientist at Ketchbrook Analytics.

## Michael (0:12–0:28)
Together, we'll present **ORCA**, an internal Shiny application for AI-assisted coding of open-ended survey responses.
The goal was to make large-scale text classification usable, transparent, and editable by researchers—not just automated.

## Michael (0:28–0:42)
I'll focus on the front-end design: how we used Shiny to support job submission, response preview, and interactive code review, and how UX decisions help users understand and trust AI-generated results.

## Keaton (0:42–0:58)
I'll cover the backend architecture built on the **Posit ecosystem**.
ORCA uses a `{golem}`-based Shiny app connected to a **plumber API** for asynchronous job execution, **pins** for versioned metadata and datasets, and scheduled batch workflows to support logging, reproducibility, and delivery.

## Keaton (0:58–1:05)
The talk shows how UI design and Posit-based infrastructure work together to operationalize AI in production research systems.
