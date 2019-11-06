%
% Template:
%   - name: mybeamer
%   - category: beamer
%   - date: 2019-11-06 15:37:12 +0800
%   - commit: 71a9f48dd8517d3e9ba9ff242cca3e0c0da38084
%
% Copyright (C) 2014-2019 by Cheng XU <copyright@xuc.me>
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
\ProvidesClass{mybeamer}

\RequirePackage{xifthen}
\RequirePackage{xkeyval}
\RequirePackage{xkvltxp}

\newif\if@biblatex
\@biblatexfalse
\DeclareOptionX{biblatex}[]{
    \@biblatextrue
    \ifthenelse{\equal{#1}{}}{
        \PassOptionsToPackage{style=ieee-alphabetic,giveninits=true,maxnames=10,dashed=false}{biblatex}
    }{
        \PassOptionsToPackage{#1}{biblatex}
    }
}

\gdef\@aspectratio{169}
\DeclareOptionX{aspectratio}{\gdef\@aspectratio{#1}}

\gdef\@fontsize{10pt}
\DeclareOptionX{8pt}{\gdef\@fontsize{8pt}}
\DeclareOptionX{9pt}{\gdef\@fontsize{9pt}}
\DeclareOptionX{10pt}{\gdef\@fontsize{10pt}}
\DeclareOptionX{11pt}{\gdef\@fontsize{11pt}}
\DeclareOptionX{12pt}{\gdef\@fontsize{12pt}}
\DeclareOptionX{14pt}{\gdef\@fontsize{14pt}}
\DeclareOptionX{17pt}{\gdef\@fontsize{17pt}}
\DeclareOptionX{20pt}{\gdef\@fontsize{20pt}}
\DeclareOptionX{smaller}{\gdef\@fontsize{smaller}}
\DeclareOptionX{bigger}{\gdef\@fontsize{bigger}}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptionsX%
\PassOptionsToPackage{table,dvipsnames}{xcolor}
\LoadClass[compress,xcolor,\@fontsize,aspectratio=\@aspectratio]{beamer}

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
\RequirePackage{fancynum}
\setfnumgsym{\,}
\RequirePackage[ruled,vlined]{algorithm2e}
\SetVlineSkip{0pt}

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
\hypersetup{
    unicode,
    psdextra,
    bookmarksnumbered=true,
    bookmarksopen=true,
    bookmarksopenlevel=3,
    pdfinfo={
        Template.name={mybeamer},
        Template.author={Cheng XU <copyright@xuc.me>},
        Template.category={beamer},
        Template.date={2019-11-06 15:37:12 +0800}, % chktex 8
        Template.commit={71a9f48dd8517d3e9ba9ff242cca3e0c0da38084},
        Template.url={https://github.com/xu-cheng/latex},
    },
    pdfcenterwindow=true,
    pdfstartview={Fit},
    pdfpagemode={FullScreen},
    pdfpagelayout={SinglePage},
}
\RequirePackage{bookmark}

% Skip between equation and context
% Ref: https://tex.stackexchange.com/a/69678
\newcommand{\@setdisplayskip}{
\abovedisplayskip=0.25\baselineskip% chktex 1
\abovedisplayshortskip=0pt plus 0.25\baselineskip% chktex 1
\belowdisplayskip=0.25\baselineskip% chktex 1
\belowdisplayshortskip=0.25\baselineskip% chktex 1
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


% Utility function
\RequirePackage{soul} % offers \hl
\newcommand*{\email}[1]{\href{mailto:#1}{\texttt{#1}}}
\newcommand{\todo}[1]{{\color{red} TODO:\ #1}}

\RequirePackage[export]{adjustbox}

% Beamer theme
\usetheme{metropolis}
\metroset{block=fill,numbering=fraction}
\RequirePackage{appendixnumberbeamer}

\setbeamerfont{caption}{size=\scriptsize}
\renewcommand{\figurename}{Fig.}

% Justify text inside list environment
% Ref: http://liam0205.me/2017/04/11/justifying-in-beamer-s-lists/
\xpatchcmd{\itemize}{\raggedright}{\justifying}{}{}
\xpatchcmd{\beamer@enum@}{\raggedright}{\justifying}{}{}
\xpatchcmd{\@@description}{\raggedright}{\justifying}{}{}

% Beamer TOC
\newcommand{\PrintTOC}{
    \begin{frame}{\contentsname}
        \setbeamertemplate{section in toc}[sections numbered]
        \tableofcontents[hideallsubsections]
    \end{frame}
}

% Bibliography
\if@biblatex
    \RequirePackage{biblatex}
    % url break in bibliography
    \setcounter{biburllcpenalty}{1}
    \setcounter{biburlucpenalty}{1}
    \setcounter{biburlnumpenalty}{1}
    \newcommand{\PrintRef}{
        \begingroup
        \setbeamertemplate{frametitle continuation}{}
        \begin{frame}[t,allowframebreaks]{\refname}
            \bookmark[page=\thepage,startatroot]{\refname}
            \setbeamertemplate{bibliography item}[text]
            \renewcommand*{\bibfont}{\scriptsize}
            \printbibliography[heading=none]%
        \end{frame}
        \endgroup
    }
\fi

% Thanks Q&A page
\newcommand{\PrintQA}{
    \begin{frame}[standout]
        Thanks \\
        Questions?
    \end{frame}
}

% https://tex.stackexchange.com/a/226939/16996
\resetcounteronoverlays{algocf}

\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}
\usetikzlibrary{%
  arrows,
  backgrounds,
  calc,
  decorations.markings,
  decorations.pathreplacing,
  fit,
  matrix,
  patterns,
  positioning,
  shapes,
  shapes.multipart,
}

\newcommand*\circled[1]{%
  \scalebox{0.8}{%
    \tikz[baseline=(char.base)]{%
      \node[shape=circle,fill,inner sep=2pt] (char) {\textcolor{white}{#1}};
    }
  }
}
