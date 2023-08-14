# diffbot-openapi-spec

A community-managed OpenAPI spec for the (excellent)
[Diffbot](https://www.diffbot.com/) [API](https://docs.diffbot.com/).

Unfortunately, Diffbot does not appear to publish a public OpenAPI
spec. However, with a little coaxing, it's possible to extract a
(generally) OpenAPI spec-shaped object from [its documentation
platform](https://docs.diffbot.com/). (The curious can check the
Makefile to see how this is done.) This project simply pulls down that
OpenAPI-shaped object, massages it into compliance with [v3.0.x of the
OpenAPI spec](https://spec.openapis.org/oas/v3.0.3.html), and makes
releases available for general download.

At this time, the author only requires the extract
endpoints. Therefore, only the extract endpoints are currently
supported. However, the process to add more endpoints is described in
the Makefile, and all PRs are welcome.

Naturally, if at any point Diffbot should release an OpenAPI spec
publicly, users should immediately prefer that spec. In the meantime,
hopefully this will do nicely. If I become aware of any official
OpenAPI spec, I'll be sure to link it here. This repo will stay up
regardless, for reliability.