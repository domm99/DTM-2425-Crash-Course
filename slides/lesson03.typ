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

#let arrow = box[ 
  #figure(image("images/arrow.svg", width: 2%))
]

#title-slide(
  title: "Introduction to Programming Languages",
  subtitle: "Digital Transformation Management @ 2024",
  author: author,
  // date: datetime.today().display("[day] [month repr:long] [year]"),
)


#slide(title:"Overview of Developer Tools")[
  - #alert[Why Tools Matter:] Efficiency, Quality, Collaboration
  - #underline[Categories of Tools:]
    - IDEs (Integrated Development Environments)
    - Linters and Code Formatters
    - Debugging Tools
    - Version Control (Git)
    - CI/CD (Continuous Integration/Continuous Delivery)
]

#slide(title:"IDEs")[
  #align(center)[
    _An #alert[Integrated Development Environment] (IDE) is a comprehensive software tool that provides everything a developer needs in one place. It combines a code editor, compiler/interpreter, debugger, and other useful features to facilitate the software development process._
  ]
  === Why should we use an IDE?
  - #alert[Productivity Boost:] provides shortcuts, code suggestions, and integrated tools to speed up coding
  - #alert[Error Reduction:] immediate feedback through syntax highlighting and error detection
  - #alert[Code Management:] makes organizing, searching, and navigating through large codebases easier

]

#slide(title:"Core features of IDEs")[

  - #alert[Code Editor]
    - The main workspace where you write code.
    - Supports syntax highlighting (colors specific parts of code based on language)
    - Auto-completion suggests possible code completions as you type, speeding up development and reducing errors
    - Many editors offer code snippets, allowing you to insert common code blocks quickly

  - #alert[Debugger]
    - Built-in tools to test and troubleshoot your code.
    - Set breakpoints to pause the execution at specific lines of code
    - Step-through feature to execute code line-by-line, helping you understand the flow and locate bugs
    - Inspect variables and states while the program is running to find incorrect logic or data

  - #alert[Compiler/Interpreter Integration]
    - Run your code directly within the IDE
    - Provides error messages and warnings during compilation, helping you spot issues early
    - Support for various languages through plugins (e.g., Java, Python, C++)
  
  - #alert[Version Control Integration]
    - Built-in tools for managing your code through version control systems like Git
    - Allows you to commit, push, pull, and merge changes directly from the IDE
    - Visual tools for comparing changes between file versions
    
  - #alert[Package Management]
    - IDEs often integrate with package managers like npm (JavaScript) or pip (Python)
    - Allows easy installation and management of external libraries and dependencies
    
    - #alert[Code Refactoring Tools]
      - Simplify and clean up code without changing its functionality
      - Common refactoring options: rename variables, extract methods, inline variables, and more
      - Ensures your code stays maintainable and readable over time
  
  - #alert[Customization & Extensions]
    - Most IDEs support plugins and themes
    - Customize your development environment by adding tools for specific programming languages, linters, code  formatters, or even team collaboration tools like Slack or Jira

]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]

#slide(title:"")[]
