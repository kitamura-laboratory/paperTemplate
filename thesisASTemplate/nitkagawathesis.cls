%% This is file `nitkagawathesis.cls',
%% produced by Daichi Kitamura.
%% This is a cls file for producing graduate thesis 
%% at National Institute of Technology, Kagawa College.
%%

\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{nitkagawathesis}
  [2020/01/17 Daichi Kitamura]
\newif\ifdraft
\DeclareOption{draft}{\drafttrue}
\DeclareOption{final}{\draftfalse}
\newif\ifjisfont
\jisfonttrue
\DeclareOption{mingoth}{\jisfontfalse}
\newif\ifwinjis
\winjisfalse
\DeclareOption{winjis}{\winjistrue}
\newif\iftombow
\tombowfalse
\DeclareOption{tombow}{\tombowtrue}
\newif\iftombo
\tombofalse
\DeclareOption{tombo}{\tombotrue}
\newif\ifmentuke
\mentukefalse
\DeclareOption{mentuke}{\mentuketrue}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}
\newif\ifpapersize
\papersizefalse
\DeclareOption{papersize}{\papersizetrue}
\newif\if@english
\@englishfalse
\DeclareOption{english}{\@englishtrue}
\newif\if@tocchaplong
\DeclareOption{tocchaplong}{\@tocchaplongtrue}
\DeclareOption{tocchapshort}{\@tocchaplongfalse}
\newif\if@undergraduate
\DeclareOption{honka}{\@undergraduatetrue}
\DeclareOption{senkouka}{\@undergraduatefalse}
\newif\if@underreview
\@underreviewfalse
\DeclareOption{sadoku}{\@underreviewtrue}
\ExecuteOptions{final,twoside,tocchaplong,mi,honka}
\ProcessOptions
\LoadClass[a4paper,onecolumn,titlepage,11pt
\ifdraft ,draft\else ,final\fi%
\ifwinjis ,winjis\else\ifjisfont\else ,mingoth\fi\fi%
\iftombow ,tombow\else\iftombo ,tombo\else\ifmentuke ,mentuke\fi\fi\fi%
\if@twoside ,twoside,openright\else ,oneside,openany\fi%
\ifpapersize ,papersize\fi%
\if@english ,english\fi%
]{jsbook}
\iftombowdate
  \newcount\@totalpage
  \def\@lastoftotalpage{?}
  \AtEndDocument{\protected@write\@auxout{\let\the\relax}%
      {\gdef\string\@lastoftotalpage{\the\@totalpage}}}
  \def\@put@totalpage{\global\advance\@totalpage1
      \raise4pt\hbox to\z@{\hss
          \@bannerfont page \the\@totalpage\ of \@lastoftotalpage.\hskip5mm}}
  \AtBeginDocument{%
      \let\@@TR\@TR
      \def\@TR{\@@TR\@put@totalpage}}
\fi
\setlength{\fullwidth}{\paperwidth}
\addtolength{\fullwidth}{-36mm}
\@tempdima=1zw
\divide\fullwidth\@tempdima \multiply\fullwidth\@tempdima
\ifdim \fullwidth>42zw
  \setlength{\fullwidth}{42zw}
\fi
\setlength{\textwidth}{\fullwidth}
\setlength{\oddsidemargin}{\paperwidth}
\addtolength{\oddsidemargin}{-\textwidth}
\setlength{\oddsidemargin}{.5\oddsidemargin}
\iftombow
  \addtolength{\oddsidemargin}{-1in}
\else
  \addtolength{\oddsidemargin}{-1truein}
\fi
\setlength{\evensidemargin}{\oddsidemargin}
\def\ps@plainhead{%
  \let\@mkboth\@gobbletwo
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
  \def\@oddhead{\hbox to \fullwidth{\hfil%
      {\small\textbf{\headfont\thepage}}}\hss}
  \if@twoside
    \def\@evenhead{\hss \hbox to \fullwidth{%
        {\small\textbf{\headfont\thepage}}\hfil}}
  \else
    \let\@evenhead\@oddhead
  \fi
}
\def\ps@headings{%
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
  \if@twoside
    \def\@oddhead{\hbox to \fullwidth{\hfil%
        {\small\headfont\rightmark\qquad\textbf{\thepage}}}\hss}%
    \def\@evenhead{\hss \hbox to \fullwidth{%
        {\small\headfont\textbf{\thepage}\qquad\leftmark}\hfil}}%
  \else
    \def\@oddhead{\hbox to \fullwidth{\hfil%
        {\small\headfont\leftmark\qquad\textbf{\thepage}}}\hss}%
    \let\@evenhead\@oddhead
  \fi
  \let\@mkboth\markboth
  \def\chaptermark##1{\markboth{%
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \@chapapp\thechapter\@chappos\hskip1zw
      \fi
    \fi
    ##1}{}}%
  \def\sectionmark##1{\markright{%
    \ifnum \c@secnumdepth >\z@ \thesection \hskip1zw\fi
    ##1}}}%
\renewenvironment{titlepage}{%
  \cleardoublepage
  \newpage
  \thispagestyle{empty}%
  \setcounter{page}\@ne
}%
{\newpage}
\newcommand*{\titlewidth}[1]{\gdef\title@width{#1}}% #1: タイトル幅
\gdef\title@width{\hsize}
\renewcommand{\and}{\\ &}
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}% #1: 指導教員名 + 役職 [2005/12/09]
\gdef\@supervisor@prefix{\if@english Supervisor\else 指導教員\fi}
\newcommand*{\firstreviewer}[1]{\gdef\@firstreviewer{#1}}% #1: 指導教員名 + 役職
\newcommand*{\secondreviewer}[1]{\gdef\@secondreviewer{#1}}% #1: 指導教員名 + 役職
\gdef\@firstreviewer@prefix{\if@english Reviewer\else 副査\fi}
\gdef\@secondreviewer@prefix{\if@english Reviewer\else 副査\fi}
\newcommand*{\chairperson}[1]{\gdef\@chairperson{#1}}% #1: 指導教員名 + 役職
\newcommand*{\handin}[2]{\year #1 \month #2 \day 0}% #1: 年, #2: 月
\newcommand*{\eauthor}[1]{\gdef\@eauthor{#1}}% #1: 著者名英語つづり
\newcommand*{\email}[1]{\gdef\authors@email{#1}}% #1: e-mail アドレス
\newcommand*{\keywords}[1]{\gdef\@keywords{#1}}% #1: キーワード
\if@undergraduate
  \if@english
    \gdef\@subtitle{Graduation~Thesis}
    \gdef\@belongsto{Department of Electrical and Computer Engineering\\%
        National Institute of Technology, Kagawa College}%
  \else
    \gdef\@subtitle{卒業論文}
    \gdef\@belongsto{香川高等専門学校電気情報工学科}%
  \fi
\else
  \usepackage[deluxe]{otf} % 太字ゴシック用
  \if@english
    \gdef\@belongsto{Electrical and Computer Engineering Course\\%
        Advanced Course in Industrial and Systems Engineering\\%
        National Institute of Technology, Kagawa College}%
  \else
    \gdef\@belongsto{香川高等専門学校\\専攻科\\創造工学専攻}%
  \fi
  \if@english
    \gdef\@subtitle{Bachelor's~Thesis}
  \else
    \gdef\@subtitle{特別研究論文}
    \if@underreview
      \gdef\@status{（予備審査用）}
    \else
      \gdef\@status{（査読済み）}
    \fi
  \fi
\fi
\renewcommand{\maketitle}{%
  \global\let\thanks\relax
  \global\let\@thanks\@empty
  \begin{titlepage}%
    \let\footnote\relax
    \null
    \setlength{\topmargin}{-3pt}
    \begin{center}
      % Word版と極力同じになるように調整（そこに美しさはない）
      {\kanjiskip=.08zw plus.5pt minus.5pt \headfont \fontsize{27pt}{35pt}\selectfont \textgt{\textbf{\@subtitle}} \par}
      {\kanjiskip=.08zw plus.5pt minus.5pt \headfont \fontsize{21pt}{38pt}\selectfont \textgt{\textbf{\@status}} \par}
    \end{center}%
    \vskip105\p@
    \begin{center}
      {\kanjiskip=.1zw plus.5pt minus.5pt \headfont {\fontsize{13pt}{24pt}\selectfont 研　究　題　目} \par} 
      \vskip41\p@
      {\headfont \@title \par}
      \vskip-10\p@
      \hspace*{-1pt}\hrulefill
    \end{center}
    \vskip90\p@
    \begin{center}
    \normalsize\headfont
    \renewcommand{\arraystretch}{1}
      {
        \kanjiskip=.1zw plus.5pt minus.5pt
        \fontsize{11pt}{18pt}\selectfont
        \begin{tabular}{|wc{1cm}|wc{6.5cm}}
        \multicolumn{1}{c}{~提出年月日} & \@date \\ \hline
        \multicolumn{1}{c}{~氏　　　名} & \@author \\ \hline
        \multicolumn{1}{c}{~主　　　査} & \@supervisor \\ \hline
        \multicolumn{1}{c}{~副　　　査} & \@firstreviewer \\ \hline
        \multicolumn{1}{c}{~副　　　査} & \@secondreviewer \\ \hline
      \end{tabular}}
    \end{center}
    \vskip14\p@
    \begin{figure}[h]
      \hspace{95pt}
      \begin{minipage}[c]{0.5\hsize}
        \Large\headfont
        \centering
        {\kanjiskip=.1zw plus.5pt minus.5pt \fontsize{16.5pt}{22pt}\selectfont \@belongsto}
      \end{minipage}
      \hspace{-20pt}
      \begin{minipage}[c]{0.1\hsize}
        \vskip-15\p@
        \centering
        \includegraphics[scale=0.15]{logo.pdf}
      \end{minipage}
    \end{figure}\par
    \@thanks%
    \vskip60\p@\null
    \newpage\clearpage
    \thispagestyle{empty}
    \setcounter{page}{0}
    \null\vfill
    \begin{flushleft}
      Copyright {\copyright} {\number\year},~%
      \ifx\@eauthor\@undefined \@author\else\@eauthor\fi.
    \end{flushleft}\par
    \vskip60\p@\null
  \end{titlepage}
  \setcounter{footnote}{0}%
  \global\let\maketitle\relax
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\subtitle\relax
  \global\let\title\relax
  \global\let\supervisor\relax
  \global\let\firstreviewer\relax
  \global\let\secondreviewer\relax
  \global\let\belongto\relax
  \global\let\email\relax
  \global\let\eauthor\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\renewcommand\frontmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse
  \pagenumbering{roman}}
\renewcommand\mainmatter{%
  \setlength{\headsep}{10truemm}% 上部の余白確保
  \setlength{\textheight}{229truemm}% 上部の余白確保
  \if@twoside
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@openrightfalse
  \@mainmattertrue
  \pagenumbering{arabic}}
\renewcommand\backmatter{%
  \clearpage
  \@openrightfalse
  \@mainmatterfalse}
\renewcommand{\appendix}{\par
  \@mainmattertrue%
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\@chappos{}%
  \gdef\thechapter{\@Alph\c@chapter}}
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
      \refstepcounter{chapter}%
      \typeout{\@chapapp\thechapter\@chappos}%
      \if@tocchaplong\addcontentsline{toc}{chapter}%
        {\protect\numberline{\@chapapp\thechapter\@chappos}#1}%
      \else\addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}%
      \fi%
    \else\addcontentsline{toc}{chapter}{#1}\fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]%
  \else
    \@makechapterhead{#2}%
    \@afterheading
  \fi}
\renewcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \addvspace{1.0em \@plus\p@}
    \begingroup
      \parindent\z@
      \rightskip\@tocrmarg
      \parfillskip-\rightskip
      \leavevmode\headfont
      \if@tocchaplong
        \@tempdima4.683zw%
        \setbox\tw@=\hbox{\headfont{}\appendixname{}M\hskip.683zw}%
        \ifdim \wd\tw@>\@tempdima \@tempdima\wd\tw@\fi
        \setbox\thr@@=\hbox{\headfont{}\@chapapp{99}\@chappos\hskip.683zw}%
        \ifdim \wd\thr@@>\@tempdima \@tempdima\wd\thr@@\fi
        \setlength\@lnumwidth{\@tempdima}%
      \else
        \setlength\@lnumwidth{1.5em}%
      \fi
      \advance\leftskip\@lnumwidth \hskip-\leftskip
      #1\nobreak\hfil\nobreak\hbox to\@pnumwidth{\hss#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*{\l@section}{%
  \if@tocchaplong
    \@tempdima4.683zw%
    \setbox\tw@=\hbox{\headfont{}\appendixname{}M\hskip.683zw}%
    \ifdim \wd\tw@>\@tempdima \@tempdima\wd\tw@\fi
    \setbox\thr@@=\hbox{\headfont{}\@chapapp{99}\@chappos\hskip.683zw}%
    \ifdim \wd\thr@@>\@tempdima \@tempdima\wd\thr@@\fi
    \advance\@tempdima-3.683zw%
    \ifdim \@tempdima<1zw \@tempdima1zw\fi
    \@tempdimb3.683zw%
  \else
    \@tempdima1.5em \@tempdimb2.3em
  \fi
  \@dottedtocline{1}{\@tempdima}{\@tempdimb}}
  \renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
    {0.5\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
    {-1zw}% 改行せず 1zw のアキ
    {\normalfont\normalsize\headfont}}
\newcommand{\abstractname}{\if@english Abstract\else 概要\fi}
\renewenvironment{abstract}{%
  \titlepage
  \null\vfill
  \@beginparpenalty\@lowpenalty
  \begin{center}%
    \headfont \abstractname
    \@endparpenalty\@M
  \end{center}\par}%
  {\par%
    \ifx\@keywords\@undefined\else%
      \begin{description}%
        \item[\@keywordsprefix]\@keywords%
      \end{description}%
    \fi%
    \vfill\vfill\vfill\null
    \endtitlepage}
%%%
\newcommand{\eabstractname}{\if@english 概要 \else Abstract\fi}
\newcommand*{\etitle}[1]{\gdef\@etitle{#1}}
\newenvironment{eabstract}{%
  \titlepage
  \null
  \@beginparpenalty\@lowpenalty
  \begin{center}
      \begin{center}\headfont\Large%
	  \@etitle
    \end{center}
  \end{center}
      \vskip2\baselineskip
  \begin{center}%
    \headfont \eabstractname
    \@endparpenalty\@M
  \end{center}\par}%
  {\par%
    \ifx\@keywords\@undefined\else%
      \begin{description}%
        \item[\@keywordsprefix]\@keywords%
      \end{description}%
    \fi%
    \vfill\vfill\vfill\null
    \endtitlepage}
%%%
\renewenvironment{thebibliography}[1]{%
  \global\let\presectionname\relax
  \global\let\postsectionname\relax
  \chapter{\bibname}\@mkboth{\bibname}{}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
       {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty\clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist}
\long\def\@makecaption#1#2{{\small%
  \advance\leftskip2zw
  \advance\rightskip2zw
  \@tempdimb\hsize
  \advance\@tempdimb-4zw
  \vskip\abovecaptionskip
  \setbox\tw@=\hbox{\hskip2zw{\headfont#1.}~}%
  \sbox\@tempboxa{{\headfont#1.}~#2}%
  \ifdim \wd\@tempboxa >\@tempdimb
    \list{\headfont#1.}{%
      \renewcommand{\makelabel}[1]{\hskip2zw##1\hfil}
      \itemsep    \z@
      \itemindent \z@
      \labelsep   \z@
      \labelwidth \wd\tw@
      \listparindent\z@
      \leftmargin \wd\tw@
      \rightmargin 2zw}\item\relax #2\endlist
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}}
\def\today{%
  \if@english
    \ifcase\month\or
      January\or February\or March\or April\or May\or June\or
      July\or August\or September\or October\or November\or December\fi
      %\space\number\day
      , \number\year
  \else
    \if西暦
      \number\year 年
      \number\month 月
      %\number\day 日
    \else
      令和\number\heisei 年
      \number\month 月
      %\number\day 日
    \fi
  \fi}
\pagestyle{headings}
\pagenumbering{arabic}
\onecolumn
\raggedbottom
\endinput
%%
%% End of file `nitkagawathesis.cls'.
