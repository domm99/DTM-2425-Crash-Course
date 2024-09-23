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

#slide(title:"Motherboard (2)")[
  - #alert[Peripheral Component Interconnect]
  - Expansion slot used for connecting expansion cards to a computer's motherboard
  - These expansion cards provide additional functionality or capabilities to a computer system

  #side-by-side[
    - Different types of PCI, for example: PCI and PCI/e
    - PCI/e not backward compatible with PCI
    - Different bandwidth (MB/s vs GB/s)
  ][
    #figure(image("images/pci.jpeg", width:80%))
  ]
]

#slide(title:"Motherboard (3)")[
 #align(center)[ === Examples of cards for PCI ]
  #v(2em)
 #side-by-side[
  #align(center)[
    Graphics processing unit
    #figure(image("images/gpu.jpeg", width: 75%))]
 ][
  #align(center)[
    Ethernet card
    #figure(image("images/ethernet.png", width: 95%))]
 ][
  #align(center)[
    Wi-Fi Card
    #figure(image("images/wifi.png", width: 50%))]
 ]
]

#slide(title:"Motherboard (4)")[
  - There are #alert[different types] of motherboards designed for different applications: 
    - Multiple PCI Express slots for multiple GPUs, for example for HPC, Deep Learning, Mining, ...
    - ATX (Advanced Technology eXtended) for desktop computers
      - Different shapes and sizes
    - Motherboards built for embedded systems, rackmount servers, mobiles, vehicles, ...
  #figure(image("images/atx.jpg", width: 45%))
]

#slide(title:"Connectors")[
  - Huge #alert[variety] of #alert[connectors] are available for different uses:
    - #alert[Video] (VGA, HDMI, DisplayPort, ...)
    - #alert[Data] (Fireware, USB, ...)
    - ...
  - This is so for several reasons, for instance #alert[technological] and #alert[marketing]
 
  #side-by-side[
  - EU started to #alert[regulate] the connector market
      - iPhone 15, from lightning to USB-c
  ][
  #figure(image("images/connectors.jpeg", width: 60%))]
]

#slide(title:"Central Processing Unit (CPU)")[
  - #alert[Brain] of a system, every single #alert[operation] that you do with the computer is #alert[processed] by the CPU
  - A CPU controls the following functions:
    - #alert[Instruction management]
      - Fetching and interpretation of the program instructions
    - #alert[Data computation]
      - Computation of binary operations that belong, for example, to the arithmetic logic (but not only)
    - #alert[Data memorization]
      - Permanent and volatile data memorization
    - #alert[Data transfer]
      - Input and output functionalities

  #place(right, dy:-5.5em)[
    #figure(image("images/cpus.png", width:40%))
  ]

]


#slide(title:"Central Processing Unit (2)")[
  #align(center)[The CPU is programmed as a #alert[Finite State Machine] (FSM) with 3 states]
  #figure(image("images/cpu-cycle.png", width:66%))
]

#slide(title:"Central Processing Unit (3)")[
  - There are 3 types of instructions run by the CPU
    - #alert[ALU operations]: all the omputations on the data through the computation unit (Arithmetic Logic Unit)
    - #alert[Load/Store operations]: I/O operations in memories and I/O devices
    - #alert[Control operations]:  all the operations to control the internal units of the CPU and the ones needed by the Operating System
]

#slide(title:"Central Processing Unit (4)")[
  #side-by-side[
    - Two main units:
      - #alert[Control Unit] (CU)
      - #alert[Arithmetic Logic Unit] (ALU)
    - A CPU has also several internal memories called #alert[registers]
    - A CPU communicates with memories and other devices through the #alert[BUS] 
  ][ 
    #figure(image("images/cpu-arch.jpg", width: 90%))
  ]
]

#slide(title:"Central Processing Unit (5)")[
  - We can see the Control Unit, as the name suggests, as the #alert[main controller] of all operations
  - The ALU is the #alert[real worker], who works to complete the instructions received
  - #alert[Registers] are essential in order to get and store data and instructions
    - Registers are #alert[inside] the CPU
    - Registers are the #alert[fastest] memory type
    - Registers are #alert[very small]
  - Without the CU, the ALU is not able to work
]

#slide(title:"A 1-bit ALU")[
   #figure(image("images/1b-alu.png", width: 45%))
]

#slide(title:"Control Unit")[
  - It #alert[directs the operations] of the other units by providing #alert[timing] and #alert[control signals]
  - It tells the computer's memory, arithmetic logic unit and input and output devices how to respond to the instructions that have been sent to the processor
  - There are two types of CUs:
    - #alert[Hardwired]: they are implemented through use of combinational logic units, featuring a finite number of gates that can generate specific results
    - #alert[Microprogrammed]: the CU has a special control memory to store microinstructions. Therefore, the control operations are not done directly by hardware, but they are a sort of program, called microprogram.
]

#slide(title:"Control Unit: Hardwired vs Microprogrammed")[
  - #alert[Hardwired]
    - Generally faster than the microprogrammed ones
    - Fixed architecture: it requires changes in the wiring if the instruction set is modified or changed
    - High speed but very limited flexibility
  - #alert[Microprogrammed]
    - Simplicity of its structure
    - Microprogram can be debugged and replaced very like software
    - Flexibility

]

#slide(title:"Memory")[
  #side-by-side[
    - A memory is the place in which #alert[information is stored]
    - The #alert[basic unit] of memory is the binary digit, called bit. A bit may contain a 0 or a 1
    - Memories consist of a number of #alert[cells] each of which can store this piece of information
    - Each cell has a number, called its #alert[address], by which programs can refer to it
  ][
    #figure(image("images/memory.png", width: 80%))
  ]
  
]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]
