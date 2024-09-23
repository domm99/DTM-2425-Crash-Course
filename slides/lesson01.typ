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
      - #underline[Cost], HW > SW
      - #underline[Speed], HW > SW
      - #underline[Reliability], HW > SW
      - #underline[Frequency of expected changes], HW < SW
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

#slide(title:"Memory (2)")[
  - In a computer, there are 2 types of memory:
    - #alert[Primary memory]
      -  It includes the _Random Access Memory_ (RAM) and the _Read Only Memory_ (ROM)
      -  Usually primary memory is very #underline[fast] and #underline[small-sized] and located #underline[close to the processor]
      - RAM is _#underline[volatile]_ (data disappear when the power goes out)
      - ROM is #underline[non-volatile] (the information is maintained even if the component loses power).
    - #alert[Secondary memory]
      - It includes _HDD_ (Hard Disk) and _SSD_ (Solid State Disk)
      - Usually is #underline[slower] than RAM/ROM
      - It has a #underline[greater capacity] than primary memory (1, 2, 8 TB vs 64, 128, 256 GB)
      - It is #underline[not close] to the processor (it can be located in an external separate storage device)()
      - It is #underline[not volatile]
]

#slide(title:"Random Access Memory")[
  #align(center)[ 
    RAM is the #alert[hardware location] in a computer where #underline[programs], the #underline[operating system] and #underline[data in current use] are kept so that they can be #underline[quickly reached] by the computer's processor 
  ]

   #figure(image("images/ram.jpg", width: 60%))
]

#slide(title:"Random Access Memory (2)")[
  - Random Access Memory since #alert[any storage location can be accessed directly] in the same amount of time
  - There are 2 types of RAM
    - #alert[Static RAM] (SRAM)
    - #alert[Dynamic RAM] (DRAM)
  - Static vs Dynamic
    - Static is #underline[faster]
    - Dynamic is #underline[less expensive]
    - Dynamic has a #underline[less power consumption]
  - SRAM is used to create the CPU's speed-sensitive cache, while DRAM forms the larger system RAM space
]

#slide(title:"Read Only Memory")[
  - It is used as the computer begins to #alert[boot up], in order to #underline[transfer data from the hard disk to the RAM memory]
  - It is used to #underline[store the start-up instructions] for a computer
  - When you press the power button, the RAM memory is #underline[empty] 
- #alert[It is important to store the essential start-up instructions in a ROM memory]
    - These start-up instructions are the Basic Input-Output System (BIOS) or the more recent Unified Extensible Firmware Interface (UEFI)
    - The BIOS instructs the CPU to start reading code at specific memory locations
    - In some modern devices, the BIOS also check the components through the Power-On Self-Test (POST)
]

#slide(title:"Read Only Memory")[
  - There are #alert[3 different types] of ROM
    - #underline[Programmable Read Only Memory] (PROM), also known as One Time Programmable (OTP)
    - #underline[Erasable Programmable Read Only Memory] (EPROM), erasable through ultraviolet light source
    - #underline[Electrically Erasable Programmable Read-Only Memory] (EEPROM), erasable through electricity.

   #figure(image("images/eprom.jpeg", width: 30%))
]

#slide(title:"Hard Disks")[
  #side-by-side[
    - It #alert[stores and retrieves] digital data using #underline[magnetic storage] and one or more #underline[rigid rotating platters] coated with magnetic material
    - Data are stored in #alert[logic units] defined as: sectors, clusters, tracks and cilinders
    - It is an #alert[electro-mechanical] data storage device, composed by many components
    - Data, in terms of 0/1, are stored as #alert[magnetic signals] read and written by a head
  ][
    #figure(image("images/hdd.png", width: 80%))
  ] 
]

#slide(title:"HDD vs SSD")[
  - A #alert[Solid State Disk] (SSD) is a #underline[completely electronic] memory based on flash memories
  - Pro of SSDs with the respect of HDDs
    - #underline[Higher speed]
      - Access Time (time spent in retrieving data): μs vs ms
      - Transfer Time (time spent in transferring data): MB vs GB
    - #underline[SSD are more reliable]
      - No mechanical parts in movement
      - Higher impact resistance and no heat produced
    - BUT
      - HDDs are chaper: 0,1€/GB vs 0,02€/GB (up to 2020)
      - SSDs have minor life in case of frequent writing operation
      - It is very hard retrieve information from broken SSD (easier for HDDs)
]


#slide(title:"Recap: memory organization")[
  #figure(image("images/mem-org.png", width: 70%))
]

#slide(title:"Memory hierarchy")[
  - We can define a #alert[memory hierarchy] based on the
    - #underline[Speed]: the amount of time that it takes the memory to receive a request and then read or write data
    - #underline[Size]: the amount of the space that can be written on the memory
    - #underline[Cost]

  #figure(image("images/mem-hier.png", width: 41%))
]

#slide(title:"Cache memory")[
  - Historically, #alert[CPUs have always been faster than memories]. Memory is a #underline[bottleneck] for the CPU performance
  - Actually, the problem is both #alert[technology and economics]
    - Engineers know how to build memories that are as fast as CPUs, BUT #underline[they have to be located on the CPU chip]
    - Going over the bus to memory is #underline[very slow]
    - Putting a large memory on the CPU chip makes it #underline[bigger], which makes it #underline[more expensive], and even if cost were not an issue, there are #underline[limits to how big a CPU chip can be made]
  - The #alert[solution] is having a #underline[small amount of fast memory] and a #underline[large amount of slow memory]
  - This small and fast memory is called #alert[cache]

  #place(right, dy:-0.5em)[
    #figure(image("images/cache.png", width:25%))
  ]
]

#slide(title:"Cache memory (2)")[
  - The basic idea behind a cache is simple: the #alert[most heavily used memory words are kept in the cache]. When the CPU needs a word, it first looks in the cache. Only if the word is not there does it go to main memory
  - What are the “most heavily used memory words”? We can rely on 2 #underline[principles]:
    - #alert[Spatial locality]: if a particular storage location is referenced at a particular time, then it is likely that nearby memory locations will be referenced in the near future
    - #alert[Temporal locality]: if at one point a particular memory location is referenced, then it is likely that the same location will be referenced again in the near future
  - We have a #alert[hit] when a word is in the cache, otherwise there is a miss
]

#slide(title:"Cache memory (3)")[
  - Some issues 
    - #alert[Cache size]: the bigger the cache, the better it performs, but also the more it costs
    - #alert[Cache organization]: if the cache is full, how to define which spaces to free? We need specific policies
    - #alert[Number of caches]: usually chips have a primary (L1) cache on chip, a secondary (L2) cache off chip but in the same package, and a third (L3) cache still further away
  - #underline[Different levels of cache memory for different speeds], since they are closer to the CPU and built with different technologies

  #place(right, dy:-0.5em)[
    #figure(image("images/cache-levels.png", width:30%))
  ]
]

#slide(title:"Cache memory (4)")[
   #figure(image("images/cache-i7.png", width: 70%))
]

#focus-slide[
  How are all these things organised inside a computer?
]

#slide(title:"Computer architecture")[
  - All components introduced are #alert[connected] through one or more #alert[buses]
  - A bus is a #alert[communication system] that transfers data between components inside a computer, or even between computers
  - Different buses since there are two types of organizations for memories (and in general computers): #alert[Von Neumann] Architecture and #alert[Harvard] Architecture
]

#slide(title:"Von Neumann Architecture")[
  - It is a computer architecture in which the #alert[memory stores both data and instructions]
  - Programs instructions and data are stored in the RAM of the system
  - This architecture is simpler that the Harvard architecture
  
  #figure(image("images/von.png", width: 35%))
]

#slide(title:"Harvard Architecture")[
  It is a computer architecture in which #alert[there is a separate storage and signal pathways (bus) for instructions and data]
  
  #figure(image("images/harvard.png", width: 45%))
]

#slide(title:"Von Neumann vs Harvard")[
  - #alert[Recent processors use the von Neumann architecture] BUT, for performance reasons, #underline[they usually have a separate processor memories (caches) for the instructions and data]
  - In this way they overcome the von Neumann bottleneck (a instruction fetch and a data operation cannot occur at the same time) that limit the performance of the system
]

#focus-slide[
  How have computers evolved over time? 
]

#slide(title:"Generations of computers")[
  - We define different #alert[generations] of computers relying on the #alert[technology] used
  - Evolution of switches is the evolution of generations
    - #underline[Mechanical]
    - #underline[Electromechanical]
    - #underline[Electronics]
  #v(3em)
  #place(right, dy:-5.5em)[
    #figure(image("images/hdd-big.png", width:35%))
  ]
]

#slide(title:"0th Generation: Mechanical Computers (1642-1945)")[
  - In 1642, Blaise Pascal was the first person to build a working #alert[calculating machine]
    - He built this calculator to help his father with taxes
  - The programming language _Pascal_ is named in his honor
  - The name of the calculator was Pascalina and was a sort of #alert[simple calculator]
    - #underline[Entirely mechanical]
    - Powered by a hand-operated crank
    - Only addition and subtraction operations (multiplication and division through repeated additions or subtractions)
  - Thirty years later the German mathematician von Leibniz built the #alert[Stepped Reckoner]
    - #underline[Multiplication and division] operations added
    - The #underline[first real calculator]
    - First example of #underline[memory]
  #place(right, dy:-2.5em)[
    #figure(image("images/stepped.png", width:35%))
  ]
]

#slide(title:"0th Generation: Mechanical Computers (1642-1945)")[
  - In 1834 Charles Babbage built the #underline[Analytical Engine]
    - Entirely #underline[mechanical]
    - It was #underline[general purpose] machine, i.e. it was not specialized to perform only single operations
    - It read instructions from#underline[ punched cards] and carried them out
  - #alert[The programming age was born]: punching a different program on the input cards, it was possible to have the analytical engine perform different computations.
  - To produce the (simple) software, Babbage hired a young woman named Ada Lovelace
  - #alert[Ada Lovelace was thus the world's first computer programmer]

  #figure(image("images/lovelace.png", width:42%))
]

#slide(title:"")[]

#slide(title:"")[]

#focus-slide[
  Operating Systems
]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]