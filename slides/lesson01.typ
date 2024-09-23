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
  title: "Introduction to Computer Architectures and Operating Systems",
  subtitle: "Digital Transformation Management @ 2024",
  author: author,
  // date: datetime.today().display("[day] [month repr:long] [year]"),
)

#focus-slide[ Hardware and software ]

#slide(title: "A stacked architecture")[
  #figure(image("images/stack-arc.svg"))
]

#slide(title: "Hardware")[

  - #alert[Hardware]: set of physical devices of a computer
    - Circuits: motherboard, network cards, ...
    // - Memories: HDDs, SSDs, cache, ...
    - Devices: mouse, keyboard, printer, ...
  - #alert[Rigid] with respect to #alert[changes]
    - due to, for instance, compatibility or costs
    - this is an important aspect when you make decisions about the hardware you want to buy
  
  #side-by-side[
    #figure(image("images/cpu.jpeg", width: 75%))
  ][
    #figure(image("images/gpu.jpeg", width: 75%))
  ][
    #figure(image("images/motherboard.jpg", width: 75%))
  ]

]

#slide(title: "Software")[
  - #alert[Software]: set of instructions and algorithms used by a computer to solve a given problem
    - The software allows hardware to work
    - Instruction are coded in a specific language that can be used by a computer (Assembly, Python, Kotlin, Java, ...)
  - #alert[Algorithm]: steps needed to be followed in some order to solve a problem
    - A SW may include one or more algorithms 
    - Algorithms are more general concepts that have to be translated in a specific programming language
]

#slide(title:"Software (2)")[
  ```
  1) Look at the firt element in the list
  2) Compare the current number with the next number
  3) If the next number is smaller, swap the two elements
  4) Continue until no swaps are made
  ```

  ```python
  def bubble_sort(arr):
    for n in range(len(arr) - 1, 0, -1):
        for i in range(n):
            if arr[i] > arr[i + 1]:
                swapped = True
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
  ```

]

#slide(title:"Hardware vs Software")[
  - _Hardware is just petrified software_
    - The software is #alert[equivalent], from a logical point of view, to the hardware
    - Hardware can also be #alert[simulated] in software and any operation performed by software can also #alert[be built directly] into the hardware
    - The decision to put certain functions in hardware and others in software is based on:
      - Cost, HW > SW
      - Speed, HW > SW
      - Reliability, HW > SW
      - Frequency of expected changes, HW < SW
]

#slide(title:"Hardware vs Software (2)")[
  - It is important, in a project, deciding what is software and what is hardware
  - Generally, for #alert[clearly definable] and #alert[repetitive] actions, creating a #alert[dedicated HW solution] will speed up operations when compared to SW running on a general-purpose processor
  - Examples of HW accelerators:
    - Encryption
    - (Pseudo)Random Number Generator
  
  #side-by-side[
    #figure(image("images/RNG.png", width: 50%))
  ][
    #figure(image("images/encryption.jpg", width: 50%))
  ]
]

#focus-slide[ Let's look deeper into the hardware components ]

#slide(title:"Motherboard")[
  - It is the #alert[main] printed circuit board
  - It #alert[holds] many of the #alert[crucial] electronic components of a system and allows #alert[communications] between them  
  - It #alert[distributes the power], received from the power supply, to all components

  #figure(image("images/MB-explained.png", width:40%))
]

#slide(title:"Motherboard (2)")[]

#slide(title:"Motherboard (3)")[]

#slide(title:"Motherboard (4)")[]

#slide(title:"Connectors")[]

#slide(title:"Central Processing Unit (CPU)")[]
