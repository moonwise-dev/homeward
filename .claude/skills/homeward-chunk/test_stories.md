# Test Stories

Inputs for `make probe` and rehearsal. They never go into the app, the server,
or a prompt, and nothing scores which question comes next (D130).

Each story is a short, partial first message on purpose, so that Homeward has
to deduce, look things up, and follow up. Pick the ones that exercise the
chunk, and add new ones when a chunk needs a kind of move not covered here.

1. My mum is moving in with us and she can't really do stairs anymore. We're
   looking around Stockholm.
2. Me and a friend are moving to Lisbon to share a flat. I'll be at a startup
   in Beato most days, she works shifts at Santa Maria hospital.
3. I work remotely and have a big dog. Thinking of leaving Berlin for somewhere
   greener.
4. I got a job at KTH starting in January. Two kids, 6 and 9.
5. We cycle everywhere and want the sea close by. Considering Lisbon or
   Barcelona.
6. Can I afford a flat in Madrid on 3,000 euros a month?
7. Here's a flat we like: <paste a listing link>. My partner uses a wheelchair.
8. We're moving to Stockholm for my job. I'll earn 55,000 kronor a month
   before tax, and my partner keeps her remote job paying 3,500 euros a month.
   We have 600,000 kronor saved.
9. Two of us want to buy our first flat in Lisbon. We take home 2,800 euros a
   month together and have 40,000 euros saved.
10. We found a flat in Stockholm for 4,200,000 kronor with a 3,900 kronor
    monthly avgift. I'm 36, she's 34, no kids, no debts; I take home 41,000
    kronor of 55,000, and she takes home 2,600 euros of 3,500. We have 600,000
    kronor saved. What would it cost us each month?

Messy conversations, for when the buyer is not the perfect one (C11). Each
line is a turn; they slip, skip the card they were shown, and answer in
their own way:

11. I'm movint to stockholm with my family soon, help me find a residence /
    We take home about 10k sek / (tap the figure meant) / 500000 / (fill the
    card)
12. hi / I don't really know where to start, we might move next year / Not
    sure yet, maybe Lisbon, maybe we just stay and rent
13. We want to buy in Stockholm. I earn 45,000 before tax and take home
    52,000. / Sorry, the other way round.
14. Two of us, no kids, buying in Lisbon, 60k saved. / Actually we have a
    daughter, she's 4. / And we would rather rent for a year first.

The four journeys in the README (D141, D161) are rehearsed with the openings
written there, each turn as its own argument to the probe:

```sh
set -a; . ./.env; set +a
dart run tool/bin/probe_turn.dart http://localhost:8080 "first turn" "second turn"
```
