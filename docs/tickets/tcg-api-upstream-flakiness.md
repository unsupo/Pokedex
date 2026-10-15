# Ticket: api.pokemontcg.io intermittently returns 500/502

**Status:** Mitigated. Not fixable on our side — this is upstream behavior.

## Problem

The TCG tab on a Pokemon's details screen sometimes showed "Failed to load TCG cards" with a
500 status in the error text. Probing `https://api.pokemontcg.io/v2/cards` directly from this
machine (with and without an API key) showed the same thing: roughly half of requests fail with
500 or 502, including requests for an id that had just succeeded, or failed, moments before.
Retrying the *exact same request* almost always succeeds within a few attempts. This is upstream
flakiness on api.pokemontcg.io itself, not a problem with the query, the API key, or client-side
rate limiting.

Observed failure streak lengths, probing live on 2026-10-08: usually 1-3 consecutive failures,
once 4. Failures return in under half a second; a successful response that day was taking
1.5-6 seconds, suggesting general degradation, not just errors.

## Fix

`PokemonTcgApiService.getCardsByNationalDexId` retries on 500/502/503/504 (not on other statuses,
which won't succeed on retry) up to 5 attempts, with a backoff capped at 1.5s between attempts.
Tuned from the observed failure streaks above; see the tests in
`test/services/pokemon_tcg_api_service_test.dart`.

## Known limitation

If api.pokemontcg.io has a sustained outage longer than 5 attempts' worth of retries, the error
will still surface, correctly. There's no way to guarantee success against a dependency that's
actually down. If this keeps recurring, the next step would be a longer-lived fallback (e.g. "try
again" button on the error screen, or a cached/stale-while-revalidate read) rather than a larger
retry count, which would just make a real outage take longer to report.

## Also found, not fixed

`TcgService.getCard` is dead code (nothing calls it) and has an unrelated bug: it returns
`jsonDecode(response.body)`, a raw `Map`, where the signature promises a `TcgCard?`. It would
throw if anything ever called it. Left alone since it's out of scope for this ticket; worth its
own ticket if the method is ever wired up.
