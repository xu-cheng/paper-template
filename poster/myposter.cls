%
% Template:
%   - name: myposter
%   - category: poster
%   - date: 2020-06-14 22:17:55 -0700
%   - commit: d9db19d064476beff8c03d5e1a1d9a52cb707162
%
% Copyright (C) 2014-2020 by Cheng XU <copyright@xuc.me>
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
\ProvidesClass{myposter}

\RequirePackage{xifthen}
\RequirePackage{xkeyval}
\RequirePackage{xkvltxp}

\newif\if@authblk
\@authblkfalse
\DeclareOptionX{authblk}[]{
    \@authblktrue
    \ifthenelse{\equal{#1}{}}{}{\PassOptionsToPackage{#1}{authblk}}
}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\ProcessOptionsX%
\PassOptionsToPackage{table,dvipsnames}{xcolor} % extra options for xcolor
\LoadClass{tikzposter}

% Check for obsoleted LaTeX packages
\RequirePackage[l2tabu,orthodox]{nag}

% Utility packages
\RequirePackage{calc}
\RequirePackage{datenumber}
\RequirePackage{etoolbox}
\RequirePackage{iftex}
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
\setfnumgsym{\,}

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
\RequirePackage{tabu}
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
    hidelinks,
    pdfinfo={
        Template.name={myposter},
        Template.author={Cheng XU <copyright@xuc.me>},
        Template.category={poster},
        Template.date={2020-06-14 22:17:55 -0700}, % chktex 8
        Template.commit={d9db19d064476beff8c03d5e1a1d9a52cb707162},
        Template.url={https://github.com/xu-cheng/latex},
    },
    plainpages=false,
    pdfcenterwindow=true,
    pdfstartview={Fit},
    pdfpagemode={UseNone},
    pdfpagelayout={SinglePage},
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

% Variables Setting

\DeclareDocumentCommand\title{m}{\gdef\@title{#1}\hypersetup{pdftitle={#1}}}
\title{}

\if@authblk
    \RequirePackage{authblk}
    \renewcommand\AB@affilsepx{\quad\protect\Affilfont}
    \renewcommand\maketitle{%
        \AB@maketitle%
        \hypersetup{pdfauthor={\AB@authlist}}
    }
\else
    \DeclareDocumentCommand\author{m}{\gdef\@author{#1}\hypersetup{pdfauthor={#1}}}
    \author{}
\fi


% Poster style
\usetheme{Autumn}
\colorlet{titlebgcolor}{NavyBlue}
\colorlet{blocktitlefgcolor}{NavyBlue}

\RequirePackage[inline]{enumitem}
\setlist[itemize,1]{label=\textbullet}
\setlist[itemize,2]{label=\normalfont\bfseries\textendash}
\setlist[itemize,3]{label=$\circ$}
\setlist[itemize,4]{label=$\triangleright$}
\setlist[description]{font=\color{NavyBlue}\bfseries}

\captionsetup{font=Large}
\captionsetup[subfigure]{font=normalsize,labelformat=parens}

% do not show affection
\tikzposterlatexaffectionproofoff%

% work around incompatibility with hyperref
% ref: http://tex.stackexchange.com/questions/254257/tikzposter-and-doi-package-conflict
\def\HyperFirstAtBeginDocument#1{#1}

% Poster Utility function
\newcommand{\alert}[1]{{\color{NavyBlue} #1}}
