%
% Template:
%   - name: myreviewresponse
%   - category: article
%   - date: 2022-04-19 23:46:01 -0700
%   - commit: b001f49b99b9f71810105785c91544e98fe40b77
%
% Copyright (C) 2014-2022 by Cheng XU <copyright@xuc.me>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Cheng XU.
%

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{myreviewresponse}

\RequirePackage{xifthen}
\RequirePackage{xkeyval}
\RequirePackage{xkvltxp}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptionsX%
\LoadClass[a4paper]{article}

% Check for obsoleted LaTeX packages
\RequirePackage[l2tabu,orthodox]{nag}

% Utility packages
\RequirePackage{calc}
\RequirePackage{datenumber}
\RequirePackage{etoolbox}
\RequirePackage{iftex}
\RequirePackage{ragged2e}
\RequirePackage{xparse}
\RequirePackage{xpatch}
\RequirePackage{xstring}
\ifPDFTeX\RequirePackage{linegoal}\fi

% Font setting
\ifLuaTeX%
    \RequirePackage{fontspec}
    \setmainfont{Tex Gyre Termes}
    \setsansfont[BoldFont={Helvetica Neue Bold},
                 ItalicFont={Helvetica Neue Italic},
                 BoldItalicFont={Helvetica Neue Bold Italic}]{Helvetica Neue}
    \setmonofont{CMU Typewriter Text}
    \defaultfontfeatures{Scale=MatchLowercase,Ligatures={Common,TeX}}
\else%
    \RequirePackage[utf8]{inputenc}
    \RequirePackage{newtxtext}
    \RequirePackage{newtxtt}
    \RequirePackage[T1]{fontenc}
    \RequirePackage{textcomp}
\fi%

% Better text justifying
\RequirePackage{microtype}

% Color packages
\RequirePackage{color}
\RequirePackage[table,dvipsnames]{xcolor}

% Math related packages
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\let\emptyset\varnothing%
\RequirePackage{amsfonts}
\RequirePackage{mathrsfs}
\RequirePackage{latexsym}
\RequirePackage{bm}

\RequirePackage{fancynum}

% Algorithm
\RequirePackage[ruled,vlined,linesnumbered]{algorithm2e}
\SetVlineSkip{0pt}
\SetAlCapNameFnt{\small}
\SetAlCapFnt{\small}
\SetAlFnt{\small}

% Caption related packages
\RequirePackage{caption}
\RequirePackage{subcaption}

% Figure related packages
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{overpic}

% Table related packages
\RequirePackage{array}
\RequirePackage{tabularray}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

% Fancy box
\RequirePackage{tcolorbox}

% hyperref setting
\RequirePackage{hyperref}
\RequirePackage[capitalise]{cleveref}
\definecolor{@linkcolor}{RGB}{128,23,31}
\hypersetup{
    unicode,
    psdextra,
    bookmarksnumbered=true,
    bookmarksopen=true,
    bookmarksopenlevel=3,
    colorlinks=true,
    allcolors=@linkcolor,
    linktoc=page,
    plainpages=false,
    pdfstartview={XYZ null null 1},
    pdfpagemode={UseOutlines},
    pdfpagelayout={OneColumn},
}
\RequirePackage{bookmark}

% Skip between equation and context
% Ref: https://tex.stackexchange.com/a/69678
\newcommand{\@setdisplayskip}{
\abovedisplayskip=0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip% chktex 1
\abovedisplayshortskip=0pt plus 0.25\baselineskip% chktex 1
\belowdisplayskip=0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip% chktex 1
\belowdisplayshortskip=0.5\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip% chktex 1
}
\xapptocmd\Huge{\@setdisplayskip}{}{}
\xapptocmd\huge{\@setdisplayskip}{}{}
\xapptocmd\LARGE{\@setdisplayskip}{}{}
\xapptocmd\Large{\@setdisplayskip}{}{}
\xapptocmd\large{\@setdisplayskip}{}{}
\xapptocmd\normalsize{\@setdisplayskip}{}{}
\xapptocmd\small{\@setdisplayskip}{}{}
\xapptocmd\footnotesize{\@setdisplayskip}{}{}
\xapptocmd\scriptsize{\@setdisplayskip}{}{}
\xapptocmd\tiny{\@setdisplayskip}{}{}

% Caption style
\DeclareCaptionLabelFormat{@caplabel}{#1~#2}
\captionsetup{
    labelformat=@caplabel,
    format=hang,
    labelsep=quad,
    skip=0.5\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip% chktex 1
}

% Utility function
\RequirePackage{soul} % offers \hl, \texthl
\RequirePackage{todonotes} % offers \todo
\newcommand*{\email}[1]{\href{mailto:#1}{\texttt{#1}}}

\RequirePackage[export]{adjustbox}
% Page geometry
\RequirePackage{geometry}
\geometry{
    a4paper,
    head=0cm,
    top=3cm,
    bottom=3cm,
    left=2.5cm,
    right=2.5cm,
    includeheadfoot,
    heightrounded,
}

% Load more packages
\RequirePackage[inline]{enumitem}
\RequirePackage{scrlayer-scrpage}
\RequirePackage[compact]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tocvsec2}
\RequirePackage{afterpage}
\RequirePackage{appendix}
\RequirePackage[titles]{tocloft}
\RequirePackage{tocbibind}
\RequirePackage{footmisc}
\RequirePackage{fnbreak}
\RequirePackage{balance}

% Variables setting
\DeclareDocumentCommand\title{m}{\gdef\@title{#1}\hypersetup{pdftitle={#1}}}
\title{}

\DeclareDocumentCommand\author{m}{\gdef\@author{#1}\hypersetup{pdfauthor={#1}}}
\author{}

% Section & TOC style
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{1}


% Head & Foot style
\pagestyle{scrheadings}
\clearscrheadfoot%
\cfoot*{\pagemark}

% List style
\setlist{noitemsep,partopsep=0pt,topsep=.8ex}
\setlist[1]{labelindent=\parindent}
\setlist[itemize,1]{label=\textbullet}
\setlist[itemize,2]{label=\normalfont\bfseries\textendash}
\setlist[itemize,3]{label=$\circ$}
\setlist[itemize,4]{label=$\triangleright$}
\setlist[enumerate,1]{label=\arabic*.,ref=\arabic*}
\setlist[enumerate,2]{label*=\arabic*,ref=\theenumi.\arabic*}
\setlist[enumerate,3]{label=\emph{\alph*}),ref=\theenumii\emph{\alph*}} % chktex 9
% set enumerate* style
\BeforeBeginEnvironment{enumerate*}{%
    \setlist[enumerate,1]{label=(\roman*),ref=(\roman*)} % chktex 36
}
\AfterEndEnvironment{enumerate*}{%
    \setlist[enumerate,1]{label=\arabic*.,ref=\arabic*}
}
\setlist[description]{font=\bfseries}

% Floating objects style
% Ref: https://liam0205.me/2017/04/30/floats-in-LaTeX-the-positioning-algorithm/
\RequirePackage{float}
\setlength{\intextsep}{0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip} % chktex 1
\setlength{\floatsep}{0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip} % chktex 1
\setlength{\textfloatsep}{0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip} % chktex 1
\setlength{\dblfloatsep}{0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip} % chktex 1
\setlength{\dbltextfloatsep}{0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip} % chktex 1
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\dbltopfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% Theorem style

\RequirePackage{amsthm}
\RequirePackage{thmtools,thm-restate}
\declaretheorem[style=plain]{axiom}
\declaretheorem[style=definition]{definition}
\declaretheorem[style=definition]{example}
\declaretheorem[style=plain]{lemma}
\declaretheorem[style=plain]{theorem}
\declaretheorem[style=remark]{remark}

% Equation style
\allowdisplaybreaks[4]

% Bibliography
\RequirePackage[
  style=ieee,
  doi=false,
  isbn=false,
  giveninits=true,
  dashed=false,
  maxnames=10,
]{biblatex}
% url break in bibliography
\setcounter{biburllcpenalty}{1}
\setcounter{biburlucpenalty}{1}
\setcounter{biburlnumpenalty}{1}

% custom title
\renewcommand{\@maketitle}{%
    \newpage
    \null%
    \vskip 1.5ex%
    \begin{center}%
        \let\footnote\thanks%
        {\bfseries\sffamily\LARGE \@title \par}%
        \vskip 1.5ex%
        {\sffamily\large \@author\hskip 2em\@date\par}%
    \end{center}%
    \par%
    \vskip 1.5ex%
}

% Ref: hyperref doc "If the final PDF file is going to be merged with another file,"
\renewcommand*{\HyperDestNameFilter}[1]{\jobname-#1}

\RequirePackage{mdframed}
\RequirePackage{needspace}

\newcounter{@reviewer}
\newcounter{@comment}[@reviewer]

\define@cmdkey{reviewer}{number}{}
\define@cmdkey{reviewer}{note}{}
\NewDocumentCommand\newreviewer{o}{%
    {
        \IfValueT{#1}{\setkeys{reviewer}{#1}}%
        \large%
        \vskip\topskip%
        \needspace{8\baselineskip}%
        \ifthenelse{\isundefined{\cmdKV@reviewer@number}}{\refstepcounter{@reviewer}}{\setcounter{@reviewer}{\cmdKV@reviewer@number}}%
        \phantomsection%
        \bookmark[dest=\@currentHref,rellevel=1,keeplevel]{Reviewer \arabic{@reviewer}}%
        \noindent\bfseries\underline{Reviewer \arabic{@reviewer}\ifthenelse{\isundefined{\cmdKV@reviewer@note}}{}{ (\cmdKV@reviewer@note)}}%
        \protected@edef\@currentlabelname{Reviewer \arabic{@reviewer}}%
        \par%
        \vskip\topskip%
    }
}

\DeclareDocumentEnvironment{comment}{s o}{%
    \begingroup%
    \IfBooleanTF{#1}{%
        \IfValueF{#2}{%
            \PackageError{myreviewresponse}{comment* requires an extra argument}{}%
        }
    }{%
        \refstepcounter{@comment}%
    }
    \def\@toclabel{\IfBooleanTF{#1}{#2}{Comment \IfValueTF{#2}{#2}{\arabic{@comment}}}}%
    \def\@label{\IfBooleanTF{#1}{#2}{R\arabic{@reviewer}.\IfValueTF{#2}{#2}{\arabic{@comment}}}}%
    \phantomsection%
    \bookmark[dest=\@currentHref,rellevel=2,keeplevel]{\@toclabel}%
    \noindent%
    \@label:%
    \protected@edef\@currentlabelname{\@label}%
    \itshape%
}{%
    \par%
    \endgroup%
}
\ExplSyntaxOn%
\cs_new:cpn {comment*} {\comment*}%
\cs_new_eq:cN {endcomment*} \endcomment%
\ExplSyntaxOff%

\mdfdefinestyle{@commentstyle}{
    backgroundcolor=black!15,
    hidealllines=true,
    innertopmargin=\topskip,
    innerbottommargin=\topskip,
    skipabove=0,
    skipbelow=0
}
\surroundwithmdframed[style=@commentstyle]{comment}
\surroundwithmdframed[style=@commentstyle]{comment*}

\newenvironment{response}{%
    \phantomsection%
    \bookmark[dest=\@currentHref,rellevel=3,keeplevel]{Response}%
    \noindent\textbf{Response:}%
}{%
    \par%
    \vskip\topskip%
}
