\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignmentsheet}[Anssignment sheet answers class (supported languages: english, ngerman)]

\LoadClass[a4paper,parskip=half,11pt,BCOR=-10mm]{scrartcl}

\RequirePackage[utf8]{inputenc} % encoding
\RequirePackage[english,ngerman]{babel} % languages
\usepackage{csquotes}
\RequirePackage{lipsum}
\RequirePackage{siunitx}

\RequirePackage{amsmath} % mathematical function
\RequirePackage{amssymb} % mathematical symbols
\RequirePackage{hepnames} % Particle Names
\RequirePackage{multirow}
\RequirePackage{graphicx}

\RequirePackage{xifthen}
% \RequirePackage{chngcntr} % for per- chapter counters
\RequirePackage[top=3cm,right=2.5cm,bottom=2.5cm,left=2.5cm,footskip=10pt]{geometry} % for page and margins 
\RequirePackage{changepage} % adjustwidth env
\RequirePackage{fancyhdr} % KOMAscript page def
% \setlength{\headheight}{1.5cm}
% \setlength{\columnsep}{25pt}
% \setlength{\columnseprule}{0.4pt}

\RequirePackage{pgfplots}
\pgfplotsset{compat=1.16}
\usepgfplotslibrary{fillbetween}

\RequirePackage{tikz}
\usetikzlibrary{3d, arrows, calc, fit, patterns, shapes.geometric, positioning, decorations.pathmorphing} % which tikz libraries to use
\tikzset{>=latex}

\renewcommand{\baselinestretch}{1}

\def\@faculty{}
\def\@course{}
\def\@lecturer{}
\def\@sheetnr{0}
\def\@author{}
\def\@matrnr{}
\def\@deadline{}

\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\course}[1]{\def\@course{#1}}
\newcommand{\lecturer}[1]{\def\@lecturer{#1}}
\newcommand{\sheetnr}[1]{\def\@sheetnr{#1}\setcounter{sheet}{\@sheetnr}}
\renewcommand{\author}[2][]{\def\@shortauthor{#1}\def\@author{#2}}
\newcommand{\matrnr}[1]{\def\@matrnr{#1}}
\newcommand{\deadline}[1]{\def\@deadline{#1}}


\DeclareOption{english}{\def\@english{1}} % display in english
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

% Define section-like command for assignments
\newcounter{sheet}
\DeclareNewSectionCommand[style=section,
beforeskip=16pt,
afterskip=1pt,
font=\large,
indent=0mm,
level=2,
tocindent=1.5em,
tocnumwidth=2.3em,
counterwithin=sheet]{assignment}
\renewcommand{\theassignment}{\assignmentname~\@arabic\c@sheet.\@arabic\c@assignment:} % headings like "Assignment 1.2: Blink text"

% Language support
\ifdefined\@english
\selectlanguage{english}
\newcommand{\sheetname}{Sheet}
\newcommand{\deadlinename}{Deadline}
\newcommand{\assignmentname}{Assignment}
\else
\selectlanguage{ngerman}
\newcommand{\sheetname}{Blatt}
\newcommand{\deadlinename}{Abgabe}
\newcommand{\assignmentname}{Aufgabe}
\fi

% Footer descr.
% \cfoot*{\thepage}
\makeatletter
\renewcommand{\maketitle}{
  \addtolength{\headheight}{7mm}
  \addtolength{\topmargin}{-0mm}

  % Header descr.
  \fancyhead[L]{
    \sffamily
    \ifx\@course\empty
    \else
      {\Large\textbf{\@course}}
    \fi\\\vspace{3mm}
    \ifx\@lecturer\empty
    \else
      {\large\@lecturer}
    \fi
  }
  \fancyhead[C]{
    \sffamily
    \ifx\@sheetnr\empty
    \else
      {\large\textbf{\sheetname~\@sheetnr}}
    \fi
    \ifx\@deadline\empty
    \else
      \\
      {\deadlinename: \@deadline}
    \fi
  }
  \fancyhead[R]{
    \sffamily
    \ifx\@faculty\empty
    \else
      {\Large\textbf{\@faculty}\\\vspace{3mm}}
    \fi
    \ifx\@author\empty
    \else
      {\@author}
    \fi
    \ifx\@matrnr\empty
    \else
      {\\\@matrnr}
    \fi
  }
  % \fancyfoot{}
  % \fancyfoot[C]{\thepage}
  \pagestyle{fancy}
}
\makeatother

