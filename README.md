[![Binder](http://hub.w201rdada.org/badge.svg)](http://hub.w201rdada.org/v2/gh/w201rdada/portfolio/master?urlpath=rstudio)

# My Portfolio

This template gives you building blocks for completing your student portfolio for W201 RDADA. The portfolio will be a place for you to complete your individual assignments 1-3, and will also be where you provide peer review to other students in the class for participation credit. Beyond course requirements though, let your fork of this repo be a place to stretch your data science imagination. Whatever ideas brought you to data science and MIDS to begin with, there is no time like the present to give a voice to those thoughts and to share them with others.

Our work gets better only through an endless push-pull cycle of publishing a version of an idea and then capturing the critical reactions of audiences. That criticism is a gift that can be fed into the next revision. We will practice workflows that will enable this kind of productive give-and-take with your audience.

## Literate Programming: A gentle intro

Many professionals who write for the web do so in [Markdown](https://daringfireball.net/projects/markdown/syntax), which is a markup syntax that trades expressiveness for readability of the source itself. This lets you focus on *what* to say first and lets you worry about *how it looks* later. When you're ready to publish, Markdown will make it a lot easier to push your work to the web or to print.

Several variants of Markdown exist to extend its expressiveness, and we will use the [Pandoc](http://pandoc.org/MANUAL.html#pandocs-markdown) flavor as implemented by the [RMarkdown](http://rmarkdown.rstudio.com/) and [bookdown](https://bookdown.org/yihui/bookdown/markdown-syntax.html) packages for `R`. These extensions are designed for researchers and data scientists to perform common tasks like handling tables, figures, and citations. iPython or Jupyter notebooks use similar conventions, but we will use bookdown because it has special features for building websites and printable documents. RMarkdown does try to play well with [other languages](http://rmarkdown.rstudio.com/authoring_knitr_engines.html) including Python.

You will not need to learn how to program in `R` to use any of this, because our focus in RDADA will be on the prose that describes your ideas, rather than on the programming that would execute a particular research agenda. You will learn technical methods throughout the MIDS curriculum. Our goal is to learn how to embed the results of such efforts into a professional document that you can share with stakeholders.

## Style

Look to weekly prompts at w201rdada.github.io fore more guidance, but ultimately these works are your own and you should make style and content decisions you believe in. This includes deciding how long your exposition needs to be to convey the essential elements of your idea. The hipster ipsum already shows a reasonable minimum target word count of around 300 words, and your readers will balk if you push much past 500 words. It is also up to you how to balance the relative length of beginning, middle, and ending elements,  but a good rule of thumb is to make your middle about 50% of the total length.

## Submitting your work

Your products for RDADA will be the four plain text source files all written in Markdown:

* `index.Rmd`, your landing page with abstracts and a welcome video, and
* `01.Rmd`, `02.Rmd`, and `03.Rmd`, your three concepts.

At the end of the term we will learn how to build those sources into websites or PDFs, but let's concentrate on having something to say first. When you pull the repo for the first time these files will be populated with some simple boilerplate and [hipster impsum](https://hipsum.co/) that you should replace with your own content, while still adhering to the basic beginning, middle, and end structure. Note that for each concept the header includes a title, a short slug for the title, and keywords.

To edit these files, you can:

* Edit them locally any way you like and submit directly by editing the files at https://github.com/w201rdada/portfolio-mygithubusername and then saving as a commit directly to the GitHub remote.
  + Recommended if you've never used `git`.
* Clone your repository locally, edit in your favorite text editor, and use a [basic git workflow](http://rogerdudler.github.io/git-guide/) from your command line.
  + Recommended if you are comfortable with `git`.
* Use the free [RStudio](https://www.rstudio.com/products/rstudio/) IDE as an editor, which has some neat features to make life with RMarkdown more enjoyable (albeit more complicated since many more features will be visible to you).
  + Recommended if you are comfortable with `R`.

If you use your own editor, be sure to save in `utf-8`.
