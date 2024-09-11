%%
%% This is file `ipart.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ipart.dtx  (with options: `class')
%% 
%% Copyright (C) 2020 by L. Tolen\.{e}, VTEX UAB
%% Mokslininku 2a, LT-08412 Vilnius, Lithuania
%% --------------------------------------------------------------------------
%%
%% PURPOSE: The International Press journals style class.
%% SOURCE: The initial source code was ipart.cls and imsart.sty.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ipart}
    [2024/09/11 v2.6, driver class for INTLPRESS journals]

%%  DEPENDENCIES:
%%  - article.cls
%%  - ipart-layout-main.sty
%%  - ipart-layout-pamq.sty
%%  - ipart-layout-sii.sty
%%  - ipart-vtex.sty
%%  - ipart-vtex-pamq.sty
%%  - ipart-vtex-sii.sty
%%
%%  CLASS FILE CONTENT:
%%  > OPTIONS
%%    - GENERAL
%%    - JOURNAL
%%  < OPTIONS
%%  - MAIN SETUP
%%  - VTeX SETUP
%%
%%  >>>>>>> OPTIONS >>>>>>>
%%
%%
%%  ======= GENERAL =======
%%
%%  Load natbib with correct settings
\newif\if@load@natbib@\@load@natbib@true
\DeclareOption{nonatbib}{\@load@natbib@false}
\newif\if@numbered@bibl\@numbered@bibltrue
\DeclareOption{authoryear}{\@numbered@biblfalse}

%%  When hyperref is loaded, makes a hyperlink
%%  only from year component of the cite command
\newif\if@linksfromyear\@linksfromyearfalse
\DeclareOption{linksfromyear}{\@linksfromyeartrue}

%%  Put "." after inline section headings
\newif\if@autosecdot
\DeclareOption{autosecdot}{\@autosecdottrue}
\DeclareOption{noautosecdot}{\AtBeginDocument{\@autosecdotfalse}}

\DeclareOption{seceqn}{\AtBeginDocument{\numberwithin{equation}{section}}}

%%  Spacing
\def\singlespacing{\renewcommand{\baselinestretch}{}\large\normalsize}
\def\doublespacing{\renewcommand{\baselinestretch}{1.6}\large\normalsize}
\DeclareOption{doublespacing}{\doublespacing}
\DeclareOption{singlespacing}{\singlespacing}
%%
%%  ======= JOURNAL =======
%%
\def\main@layout@id{0}
\def\pamq@layout@id{1}
\def\sii@layout@id{2}
\def\jbr@layout@id{3}
\def\bpam@layout@id{4}
\let\selected@layout\main@layout@id

\def\journal@id{}
\def\journal@name{}
\def\journal@issn{}
\def\journal@url{}
\def\ip@journal@url#1{%
    https://www.intlpress.com/site/pub/pages/journals/items/#1/_home/_main/index.php%
    }
\def\@publisher{International Press, Inc.}
\def\@publisheraddress{387 Somerville Avenue, Somerville, MA 02143, U.S.A.}

\DeclareOption{joc}{%
    \PassOptionsToClass{11pt}{article}%
    \def\journal@id{-joc}%
    \def\journal@name{Journal of Combinatorics}%
    \def\journal@issn{ISSN: 2156-3527}%
    \def\journal@eissn{ISSN: 2150-959X}%
    \def\journal@url{\ip@journal@url{joc}}%
    \AtBeginDocument{%
        \def\bauthor@style{\rm}%
        }%
    }
\DeclareOption{cntp}{%
    \PassOptionsToClass{11pt}{article}%
    \def\journal@id{-cntp}%
    \def\journal@name{Communications in \break Number Theory and Physics}%
    \def\journal@issn{ISSN: 1931-4523}%
    \def\journal@eissn{ISSN: 1931-4531}%
    \def\journal@url{\ip@journal@url{cntp}}%
    \AtBeginDocument{%
        %%  Ensuring that journal title will be placed in two lines
        \AfterPackage{hyperref}{\hypersetup{breaklinks=True}}%
        \def\title@style{\bfseries}%
        \def\history@postfix{}%
        \def\revised@prefix{\\Revised~}%
        \def\accepted@prefix{\\Accepted~}%
        }%
    }
\DeclareOption{gic}{%
    \PassOptionsToClass{11pt}{article}%
    \def\journal@id{-gic}%
    \def\journal@name{Geometry, Imaging and Computing}%
    \def\journal@issn{ISSN: 2328-8876}%
    \def\journal@eissn{ISSN: 2328-8884}%
    \def\journal@url{\ip@journal@url{gic}}%
    }
\DeclareOption{mcgd}{%
    \PassOptionsToClass{11pt}{article}%
    \def\journal@id{-mcgd}%
    \def\journal@name{Mathematics, Computation and Geometry of Data}%
    \def\journal@issn{ISSN: 2642-1909}%
    \def\journal@eissn{ISSN: 2642-1917}%
    \def\journal@url{\ip@journal@url{mcgd}}%
    }
\DeclareOption{cjm}{%
    \PassOptionsToClass{11pt}{article}%
    \def\journal@id{-cjm}%
    \def\journal@name{Cambridge Journal of Mathematics}%
    \def\journal@issn{ISSN: 2168-0930}%
    \def\journal@eissn{ISSN: 2168-0949}%
    \def\journal@url{\ip@journal@url{cjm}}%
    \AtBeginDocument{%
        \def\bauthor@style{\rm}%
        \def\beditor@style{\rm}%
        }%
    \@autosecdottrue
    }
\DeclareOption{bpam}{%
    \PassOptionsToClass{11pt}{article}%
    \def\@JID{BPAM}%
    \def\journal@id{-bpam}%
    \def\journal@name{Beijing J. of Pure and Appl. Math.}%
    \def\journal@issn{ISSN: 2994-8444}%
    \def\journal@eissn{ISSN: 2994-8452}%
    \def\journal@url{\ip@journal@url{bpam}}%
    \AtBeginDocument{%
        \def\bauthor@style{\rm}%
        \def\beditor@style{\rm}%
        }%
    \@autosecdottrue
    \global\let\selected@layout\bpam@layout@id
    }
\DeclareOption{amsa}{%
    \PassOptionsToClass{11pt}{article}%
    \def\journal@id{-amsa}%
    \def\journal@name{Annals of Mathematical Sciences and Applications}%
    \def\journal@issn{ISSN: 2380-288X}%
    \def\journal@eissn{ISSN: 2380-2898}%
    \def\journal@url{\ip@journal@url{amsa}}%
    \AtBeginDocument{%
        \def\bauthor@style{\rm}%
        \def\beditor@style{\rm}%
        }%
    \@autosecdottrue
    }
\DeclareOption{cis}{%
    \PassOptionsToClass{11pt}{article}%
    \def\journal@id{-cis}%
    \def\journal@name{Communications in Information and Systems}%
    \def\journal@issn{ISSN: 1526-7555}%
    \def\journal@eissn{ISSN: 2163-4548}%
    \def\journal@url{\ip@journal@url{cis}}%
    \AtBeginDocument{%
        \def\bauthor@style{\rm}%
        \def\beditor@style{\rm}%
        }%
    }
\DeclareOption{pamq}{%
    \PassOptionsToClass{11pt}{article}%
    \def\@JID{PAMQ}%
    \def\journal@id{-pamq}%
    \def\journal@name{Pure and Applied Mathematics Quarterly}%
    \def\journal@issn{ISSN: 1558-8599}%
    \def\journal@eissn{ISSN: 1558-8602}%
    \def\journal@url{\ip@journal@url{pamq}}%
    \AtBeginDocument{%
        \def\oauthor@style{\sc}%
        }%
    \global\let\selected@layout\pamq@layout@id
    }
\DeclareOption{sii}{%
    \PassOptionsToClass{10pt,twocolumn}{article}%
    \def\journal@id{-sii}%
    \def\journal@name{Statistics and Its Interface}%
    \def\journal@issn{ISSN: 1938-7989}%
    \def\journal@eissn{ISSN: 1938-7997}%
    \def\journal@url{\ip@journal@url{sii}}%
    \AtBeginDocument{%
        \def\bauthor@style{\sc}%
        }%
    \global\let\selected@layout\sii@layout@id
    }
\DeclareOption{jbr}{%
    \PassOptionsToClass{10pt,twocolumn}{article}%
    \def\journal@id{-jbr}%
    \def\journal@name{Journal of Blockchain Research}%
    \def\journal@issn{ISSN: 2643-5748}%
    \def\journal@eissn{ISSN: 2643-5756}%
    \def\journal@url{\ip@journal@url{jbr}}%
    \AtBeginDocument{%
        \def\bauthor@style{\sc}%
        }%
    \global\let\selected@layout\jbr@layout@id
    }

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
%%
%%  <<<<<<< OPTIONS <<<<<<<
%%
%%
%%  ======= MAIN SETUP =======
%%
\PassOptionsToClass{twoside,leqno}{article}
\LoadClass{article}

%%  Load additional macros and modifications for "article.cls"
\ifcase\selected@layout  % 0 - main layout
    \RequirePackage{ipart-layout-main}
\or  % 1 - pamq layout
    \RequirePackage{ipart-layout-pamq}
\or  % 2 - sii layout
    \RequirePackage{ipart-layout-sii}
\or  % 3 - jbr layout
    \RequirePackage{ipart-layout-jbr}
\or  % 4 - bpam layout
    \RequirePackage{ipart-layout-bpam}
\fi
%%
%%  ======= VTeX SETUP =======
%%
\AtEndOfPackage{%
    \IfFileExists{ipart-vtex\journal@id.sty}%
        {\RequirePackage{ipart-vtex\journal@id}}%
        {\IfFileExists{ipart-vtex.sty}{\RequirePackage{ipart-vtex}}{}}%
    \if@load@natbib@
        \@ifundefined{load@natbib}{}{\load@natbib}%
    \fi
    }

\ifdefined\HCode
  \let\noxml\@gobble
\else
  \let\noxml\@firstofone
\fi

\endinput
%%
%% End of file `ipart.cls'.
