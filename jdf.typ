// jdf.typ — Joyner Document Format v2.2 for Typst

#let hairsp = h(0.083em)

#let lining(content) = text(number-type: "lining", content)

#let blockquote(content) = {
  pad(left: 0.5in, right: 0.5in, content)
}

#let h4(title) = {
  text(weight: "bold", style: "italic", title)
  hairsp
  [—]
  hairsp
}

#let toprule = table.hline(stroke: 1pt)
#let midrule = table.hline(stroke: 0.5pt)

#let abstract(body) = {
  set par(justify: true)
  pad(
    x: 0.5in,
    block[
      #text(weight: "bold", style: "italic", tracking: 0pt, size: 11pt)[Abstract---]#text(tracking: 0pt, size: 11pt, hyphenate: false)[#body]
    ]
  )
}

#let jdf(
  title: none,
  author: none,
  email: none,
  paper: "us-letter",
  body,
) = {

  let (top-margin, bottom-margin, left-margin, right-margin) = if paper == "a4" {
    (26.25mm, 42.472mm, 34.361mm, 34.361mm)
  } else {
    (1in, 1.5in, 1.5in, 1.5in)
  }

  set page(
    paper: paper,
    margin: (top: top-margin, bottom: bottom-margin, left: left-margin, right: right-margin),
    numbering: "1",
    number-align: center + bottom,
    footer: context [
      #set text(8.5pt)
      #set par(first-line-indent: (
        amount: 0em,
        all: false,
      ))
      #align(center, text(size: 12pt, counter(page).display("1")))
    ]
  )

  set footnote.entry(indent: 0em)

  set text(
    font: ("Palatino", "Palatino Linotype", "TeX Gyre Pagella"),
    size: 11pt,
    weight: "regular",
    number-type: "old-style",
    tracking: 0.2pt,
    hyphenate: false,
    lang: "en",
    top-edge: 0.8em,
    bottom-edge: -0.2em
  )

  // Paragraphs
  set par(
    justify: true,
    leading: 0.5em,
    spacing: 0.5em + 8.5pt,
    first-line-indent: 0pt,
  )

  // Superscript
  set super(
    size: 0.6em,
    baseline: -0.35em,
  )

  // Subscript
  set sub(
    size: 0.6em,
    baseline: 0.2em,
  )

  // Bibliography
  set bibliography(
    title: none,
    style: "jdf.csl"
  )
  show bibliography: set par(spacing: 0.55em)

  // Monospaced text
  show raw: set text(
    font: "Source Code Pro",
    weight: "regular",
    size: 10pt,
    tracking: 0pt,
  )

  // Links & References
  show link: set text(fill: blue)
  show ref: set text(fill: black)

  // Headings
  set heading(numbering: "1.1.1")

  show heading.where(level: 1): it => {
    block(above: 0.26em + 11pt, below: 0.4em + 8.5pt, {
      set text(size: 11pt, weight: "bold", number-type: "lining", tracking: 0.66pt)
      if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.333em)
      }
      upper(it.body)
    })
  }

  show heading.where(level: 2): it => {
    block(above: 0.4em + 8.5pt, below: 0.4em + 8.5pt, {
      set text(size: 11pt, weight: "bold")
      if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.4em)
      }
      it.body
    })
  }

  show heading.where(level: 3): it => {
    block(above: 0.4em + 8.5pt, below: 0.26em + 8.5pt, {
      set text(size: 11pt, weight: "bold", style: "italic")
      if it.numbering != none {
        text(style: "normal", counter(heading).display(it.numbering))
        h(0.4em)
      }
      it.body
    })
  }

  // Figure & table captions
  show figure.caption: it => {
    set text(size: 8.5pt, tracking: 0.22pt)
    set par(leading: 5.5pt)
    pad(left: 1in, right: 1in, {
      align(left, {
        text(weight: "bold", style: "italic", {
          it.supplement
          [ ]
          context it.counter.display(it.numbering)
        })
        hairsp
        [—]
        hairsp
        it.body
      })
    })
  }

  show figure.where(kind: table): set figure.caption(position: top)

  // Numbered lists
  set enum(
    indent: 0pt,
    body-indent: 0.5em,
    spacing: auto,
  )

  // Document metadata
  set document(
    title: if title != none { if type(title) == str { title } else { "" } } else { "" },
    author: if author != none { if type(author) == str { (author,) } else { () } } else { () },
  )

  // Title section
  if title != none {
    align(center, {
      set text(size: 17pt, number-type: "lining", tracking: 0pt, features: ("lnum",))
      set par(justify: false, leading: 5pt, justification-limits: (
            spacing: (min: 10%, max: 100%),
            tracking: (min: 0em, max: 0em),
          ))
      title
    })
  }

  if author != none or email != none {
    align(center, {
      set text(size: 11pt, tracking: 0.2pt)
      if author != none { author }
      if author != none and email != none { linebreak() }
      if email != none { email }
    })
  }

  body
}
