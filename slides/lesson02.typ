#import "@preview/polylux:0.3.1": *
#import "@preview/fontawesome:0.1.0": *

#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
)

#set text(font: "Fira Sans", weight: 350, size: 20pt)
#show math.equation: set text(font: "Fira Math")
#set strong(delta: 200)
#set par(justify: true)

#set quote(block: true)
#show quote: set align(left)
#show quote: set pad(x: 2em, y: -0.8em)

#set raw(tab-size: 4)
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 1em,
  radius: 0.7em,
  width: 100%,
)

#show bibliography: set text(size: 0.8em)
#show footnote.entry: it => {
  block(inset: (x: 2em, y: 0.1em))[#text(size: 0.75em)[#it.note.body]]
}

#let fcite(clabel) = {
  footnote(cite(form: "full", label(clabel)))
}

#let author = block(inset: 0.1em)[
  #table(inset: 0.5em, stroke: none, columns: (auto, 4fr),  align: (left, left),
    [#alert[*Davide Domini*]], [`davide.domini@unibo.it`],
  )
  #place(right, dy:-1.5em)[
    #figure(image("images/disi.svg", width:40%))
  ]
]

#title-slide(
  title: "Introduction to Programming Languages",
  subtitle: "Digital Transformation Management @ 2024",
  author: author,
  // date: datetime.today().display("[day] [month repr:long] [year]"),
)

#slide(title: "Computational Thinking a.k.a Problem Solving")[

#quote[
  #alert[Computational thinking] is a mindset that encourages children to #underline[scrutinize a problem] and intentionally #underline[build a solution for it]. This is a general problem solving that can be integrated with other fields like Mathematics, Science, and Communication.
]
]

#slide(title: "Algorithm")[]

#slide(title: "Sequence")[]

#slide(title: "Loop")[]

#slide(title: "Decomposition")[]

#slide(title: "Branch")[]

#focus-slide("Programming Languages")

#slide(title: "Differences between PL")[]

#slide(title: "Variables")[]


#slide(title: "Branching")[]

#slide(title: "Looping")[]

#slide(title: "Boolean conditions")[]

#slide(title: "")[]

#slide(title: "")[]

#slide(title: "")[]

#slide(title: "")[]

#slide(title: "")[]

#slide(title: "")[]