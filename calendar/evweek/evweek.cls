%%
%% This is file `evweek.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% evweek.dtx  (with options: `class')
%% 
%%  Copyright 2003, 2005 Emanuele Vicentini
%% 
%%  This work may be distributed and/or modified under the
%%  conditions of the LaTeX Project Public License, either
%%  version 1.3a of this license or (at your option) any
%%  later version.
%%  The latest version of the license is in
%%     http://www.latex-project.org/lppl.txt
%% 
%%  Author: Emanuele Vicentini
%%          (emanuelevicentini at yahoo dot it)
%% 
%%  This work has the LPPL maintenance status "author-maintained".
%% 
%%  This work consists of the files: README, evweek.dtx, evweek.ins
%%  and the derived files evweek.cls and evweekexample.tex
%% 
%%  Original author: Frank Bennett
%%                   at fb@soas.ac.uk
%% 
\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\ProvidesClass{evweek}[2005/01/23 v0.4 evWeekly Calendar]
\newif\ifwk@overthetop
\newcount\wk@firstday
\newcount\wk@tempcount
\newlength\wk@itemheight
\newif\ifwk@traditional
\newif\ifwk@compact
\newif\ifwk@ferial
\newskip\wk@intralineskip
\newskip\wk@bottomlineskip
\newlength\wk@ruleheight
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{traditional}{\wk@traditionaltrue}
\DeclareOption{compact}{\wk@compacttrue\wk@ferialfalse}
\DeclareOption{ferial}{\wk@ferialtrue\wk@compactfalse}
\input{calopts.cfg}
\InputIfFileExists{dates.cfg}{}{}
\ProcessOptions
\LoadClass{article}
\RequirePackage{calendar}
\RequirePackage{lscape}
\RequirePackage{multicol}
\IfFileExists{evautofl.sty}{\relax}{\wk@traditionaltrue}
\ifwk@traditional
  \RequirePackage{autofilo}
\else
  \RequirePackage{evautofl}
\fi
\AtBeginDocument{%
  \pagestyle{empty}
  \parindent=0pt
  \multicolsep=0pt}
\define@key{opt}{firstday}{%
  \wk@firstday=#1}
\ifwk@compact
  \wk@firstday=1
\else\ifwk@ferial
  \wk@firstday=4
\else
  \wk@firstday=5
\fi\fi
\define@key{opt}{titletype}{%
  \def\wk@titletype{#1}}
\def\wk@titletype{\bfseries}
\define@key{opt}{daynumbertype}{%
  \def\wk@daynumbertype{#1}}
\def\wk@daynumbertype{}
\define@key{opt}{daynametype}{%
  \def\wk@daynametype{#1}}
\def\wk@daynametype{}
\define@key{opt}{monthtype}{%
  \def\wk@monthtype{#1}}
\def\wk@monthtype{}
\define@key{opt}{yeartype}{%
  \def\wk@yeartype{#1}}
\def\wk@yeartype{}
\define@key{opt}{intralineskip}{%
  \wk@intralineskip=#1}
\wk@intralineskip=-\p@
\define@key{opt}{bottomlineskip}{%
  \wk@bottomlineskip=#1}
\wk@bottomlineskip=\z@
\define@key{opt}{ruleheight}{%
  \wk@ruleheight=#1}
\wk@ruleheight=0.1pt
\def\wk@hrulefill{\leavevmode\leaders\hrule height\wk@ruleheight
  \hfill\kern\z@}
\wk@tempcount=0
\expandafter\newsavebox\csname wk@box\the\wk@tempcount\endcsname
\ifwk@compact
  \loop
    \advance\wk@tempcount by 1
    \ifnum\wk@tempcount<7
      \expandafter\newsavebox\csname wk@box\the\wk@tempcount\endcsname
  \repeat
\else\ifwk@ferial
  \loop
    \advance\wk@tempcount by 1
    \ifnum\wk@tempcount<7
      \expandafter\newsavebox\csname wk@box\the\wk@tempcount\endcsname
  \repeat
\else
  \loop
    \advance\wk@tempcount by 1
    \ifnum\wk@tempcount<8
      \expandafter\newsavebox\csname wk@box\the\wk@tempcount\endcsname
  \repeat
\fi\fi
\def\wk@spitoutboxes{%
  \wk@tempcount=-1
  \ifwk@compact
    \loop
      \advance\wk@tempcount by 1
      \ifnum\wk@tempcount<7
        \hbox to\linewidth{%
          \expandafter\usebox\csname wk@box\the\wk@tempcount\endcsname}%
    \repeat
  \else\ifwk@ferial
    \loop
      \advance\wk@tempcount by 1
      \ifnum\wk@tempcount<7
        \hbox to\linewidth{%
          \expandafter\usebox\csname wk@box\the\wk@tempcount\endcsname}%
    \repeat
  \else
    \loop
      \advance\wk@tempcount by 1
      \ifnum\wk@tempcount<3
        \hbox to\linewidth{%
          \expandafter\usebox\csname wk@box\the\wk@tempcount\endcsname}%
    \repeat
    \hbox to\linewidth{%
      \vbox to\wk@itemheight{%
        \hrule width\linewidth height0.4pt depth0pt
        \hbox to\linewidth{\hfil}%
        \vfill}}%
    \wk@tempcount=2
    \loop
      \advance\wk@tempcount by 1
      \ifnum\wk@tempcount<7
        \hbox to\linewidth{%
          \expandafter\usebox\csname wk@box\the\wk@tempcount\endcsname}%
    \repeat
  \fi\fi}
\def\wk@getitemheight{%
  \setlength{\wk@itemheight}{\textheight}
  \addtolength{\wk@itemheight}{-4pt}
  \addtolength{\wk@itemheight}{-5\normallineskip}
  \ifwk@compact
    \divide\wk@itemheight by 7
  \else\ifwk@ferial
    \divide\wk@itemheight by 3
  \else
    \divide\wk@itemheight by 4
  \fi\fi}%
\newcalendar%
  {weekly}
  {\cal@insert}
  {8}
  {7}
  {7}
  {\relax}
  {I}
  {\expandafter\autofilo\expandafter{\cal@optionslist}\wk@getitemheight}
  {\wk@spitoutboxes\endautofilo}
  {\wk@spitoutboxes}
  {\relax}
  {\dates@requiremonthtrue\dates@requiredaytrue}
  {\global\dates@date=\cal@range@start
   \prevday\wk@firstday
   \cal@range@start=\dates@date
   \caldate
   \message{^^JStart: \theshortweekday\space
     \theday\space\theshortmonth\space\theyear}%
   \global\dates@date=\cal@range@end
   \caldate
   \advance\wk@firstday by -1
   \ifnum\wk@firstday=7
     \wk@firstday=0
   \fi
   \nextday\wk@firstday
   \caldate
   \cal@range@end=\dates@date
   \message{^^JEnd: \theshortweekday\space
     \theday\space\theshortmonth\space\theyear^^J}%
   \global\dates@date=\cal@range@start
   \caldate}
  {\par}
  {\cal@get@appointments\cal@get@events}
  {\ifnum\dates@time@start>0
     \ifnum\dates@time@start=\dates@time@end
       \protected@edef\cal@entry@text{%
         \thetimestart\space
         \cal@textcolor{\calcolor}{\theshorttext}}
     \else
       \protected@edef\cal@entry@text{%
         \thetimestart--\thetimeend\space
         \cal@textcolor{\calcolor}{\theshorttext}}
     \fi
   \else
     \protected@edef\cal@entry@text{%
       \cal@textcolor{\calcolor}{\theshorttext}}
   \fi}
  {\global\wk@overthetopfalse
   \ifwk@ferial
     \ifcase\cal@subgroup@count
       \def\wk@itemheight@scalefactor{1}%
     \or
       \def\wk@itemheight@scalefactor{1}%
     \or
       \def\wk@itemheight@scalefactor{0.5}%
     \or
       \def\wk@itemheight@scalefactor{0.5}%
     \else
       \def\wk@itemheight@scalefactor{1}%
     \fi
   \else
     \def\wk@itemheight@scalefactor{1}%
   \fi
   \expandafter\sbox\csname wk@box\the\cal@subgroup@count\endcsname{%
     \vbox to\wk@itemheight@scalefactor\wk@itemheight{%
       \hbox{%
         \parbox{\linewidth}{%
           \vbox to\baselineskip{%
             \hrule width\linewidth
             \vskip 1pt
             \ifwk@compact
               {\wk@titletype{\wk@daynametype\theweekday}\hfill
                {\wk@daynumbertype\theday}\space
                {\wk@monthtype\themonth}\space
                {\wk@yeartype\theyear}%
               }\par
             \else\ifwk@ferial
               \ifnum\cal@subgroup@count<4
                 {\wk@titletype{\wk@daynametype\theweekday}\hfill
                  {\wk@daynumbertype\theday}\space
                  {\wk@monthtype\themonth}\space
                  {\wk@yeartype\theyear}%
                 }\par
               \else
                 {\wk@titletype{\wk@daynumbertype\theday}\space
                  {\wk@monthtype\themonth}\space
                  {\wk@yeartype\theyear}\hfill
                  {\wk@daynametype\theweekday}%
                 }\par
               \fi
             \else
               \ifnum\cal@subgroup@count<3
                 {\wk@titletype{\wk@daynametype\theweekday}\hfill
                  {\wk@daynumbertype\theday}\space
                  {\wk@monthtype\themonth}\space
                  {\wk@yeartype\theyear}%
                 }\par
               \else
                 {\wk@titletype{\wk@daynumbertype\theday}\space
                  {\wk@monthtype\themonth}\space
                  {\wk@yeartype\theyear}\hfill
                  {\wk@daynametype\theweekday}%
                 }\par
               \fi
             \fi\fi
             \vfill
           }%          vbox
           \hrule width\linewidth
           \vskip 1pt
           \raggedright
           \small
           \ifcat$\theevents$%
           \else
             \theevents\par
           \fi
           \ifcat$\theappointments$%
           \else
             \theappointments
           \fi
         }%            parbox
       }%              hbox
       \leaders\vbox{\vskip\wk@intralineskip\wk@hrulefill}\vfill
       \vskip\wk@bottomlineskip
     }%                vbox
     \ifnum\badness=1000000
       \global\wk@overthetoptrue
     \fi
   }%                  sbox
   \ifwk@overthetop
     \message{Resetting this date in two-columns.}%
     \expandafter\sbox\csname wk@box\the\cal@subgroup@count\endcsname{%
       \vbox to\wk@itemheight@scalefactor\wk@itemheight{%
         \hbox{%
           \parbox{\linewidth}{%
             \vbox to\baselineskip{%
               \hrule width\linewidth
               \vskip 1pt
               \ifwk@compact
                 {\wk@titletype{\wk@daynametype\theweekday}\hfill
                  {\wk@daynumbertype\theday}\space
                  {\wk@monthtype\themonth}\space
                  {\wk@yeartype\theyear}%
                 }\par
               \else
                 \ifnum\cal@subgroup@count<3
                   {\wk@titletype{\wk@daynametype\theweekday}\hfill
                    {\wk@daynumbertype\theday}\space
                    {\wk@monthtype\themonth}\space
                    {\wk@yeartype\theyear}%
                   }\par
                 \else
                   {\wk@titletype{\wk@daynumbertype\theday}\space
                    {\wk@monthtype\themonth}\space
                    {\wk@yeartype\theyear}\hfill
                    {\wk@daynametype\theweekday}%
                   }\par
                 \fi
               \fi
               \vfill
             }%        vbox
             \hrule width\linewidth
             \vskip 1pt
             \raggedright
             \small
             \begin{multicols}{2}
               \ifcat$\theevents$%
               \else%
                 \theevents\par
               \fi
               \ifcat$\theappointments$%
               \else
                 \theappointments
               \fi
             \end{multicols}
           }%          parbox
         }%            hbox
         \leaders\vbox{\vskip\wk@intralineskip\wk@hrulefill}\vfill
         \vskip\wk@bottomlineskip
       }%              vbox
     }%                sbox
   \fi
   \advance\wk@tempcount by 1
   \ifnum\wk@tempcount>6
     \wk@tempcount=0
   \fi}
\endinput
%%
%% End of file `evweek.cls'.
