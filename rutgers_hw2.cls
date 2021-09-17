\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rutgers_hw2}[2021/09/15 Rutgers Homework2 LaTeX class ]

\newif\if@doublespaced \@doublespacedfalse % Default of single spaced documents.  To load the package setspace later, we introduce this conditional and have the option set the conditional to true.
\DeclareOption{doublespaced}{\@doublespacedtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass[11pt, letterpaper]{article}

\RequirePackage[english]{babel}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{mathtools}
\RequirePackage{enumitem}
\RequirePackage{framed}
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{verbatim}
\RequirePackage[skins,theorems,breakable]{tcolorbox}
\RequirePackage{lmodern}


%\tcbuselibrary{theorems}



\if@doublespaced
    \RequirePackage{setspace} % Setspace is preferred for line spacing over \linespread because it doesn't affect things like footnotes.
    \doublespacing
\fi




% PAGE FORMATTING

\fancypagestyle{firstpage}{
	\fancyhf{}
	\if@twoside
		\fancyfoot[RE,LO]{\@semester}
		\fancyfoot[C]{Page \thepage}
		\fancyfoot[LE,RO]{\@institution}
	\else
		\fancyfoot[L]{\@semester}
		\fancyfoot[C]{Page \thepage}
		\fancyfoot[R]{\@institution}
	\fi
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0.4pt}
}

\pagestyle{fancy}
\setlength{\headheight}{14pt}
\fancyhf{}

\if@twoside
	\fancyhead[RE,LO]{\@author}
	\fancyhead[C]{\@assigment}
	\fancyhead[LE,RO]{\PrintCourseHead}
	\fancyfoot[RE,LO]{\@semester}
	\fancyfoot[C]{Page \thepage}
	\fancyfoot[LE,RO]{\@institution}
\else
	\fancyhead[L]{\@author}
	\fancyhead[C]{\@assignment}
	\fancyhead[R]{\PrintCourseHead}
	\fancyfoot[L]{\@semester}
	\fancyfoot[C]{Page \thepage}
	\fancyfoot[R]{\@institution}
\fi
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}




% TITLE COMMANDS

\def\ifeq#1#2{% This takes the form \ifeq{1}{2}{3}{4} where if 1=2 then 3 else 4.  Usually this is used in the context of checking if 1=empty/undefined.
  \ifx#1#2\relax
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi%
}

\newcommand*{\assignment}[1]{\gdef\@assignment{#1}}
\newcommand*{\course}[1]{\gdef\@course{#1}}
\newcommand*{\semester}[1]{\gdef\@semester{#1}}
\newcommand*{\sectionnum}[1]{\gdef\@sectionnum{#1}}
\newcommand*{\instructor}[1]{\gdef\@instructor{#1}}
\newcommand*{\institution}[1]{\gdef\@institution{#1}}
\newcommand*{\collaborators}[1]{\gdef\@collaborators{#1}}
\newcommand*{\netid}[1]{\gdef\@netid{#1}}

\let\@assignment\@empty %defining these to be empty at first
\let\@title\@empty
\let\@author\@empty
\let\@course\@empty
\let\@semester\@empty
\let\@sectionnum\@empty
\let\@instructor\@empty
\let\@institution\@empty
\let\@collaborators\@empty
\let\@netid\@empty

\newcommand{\PrintAssignment}{% Printing the homework name and title on separate lines, first checking whether \@assignment and \@title are empty
  {\huge\ifeq{\@assignment}{\@empty}{Assignment}{\@assignment}}
  {\large\ifeq{\@title}{\@empty}{}{\\\@title}}
  \vspace{.5cm}%
}
\newcommand{\PrintAuthor}{%
    \ifeq{\@author}{\@empty}{ % Producing an error if they haven't written their name
      \errmessage{You didn't write your name! Use the "\ author" command to change this.}%
  }{%
      \def\trueprintauthor{Name: & \@author}% This is what should be printed usually: "Name: Author"
      \ifeq{\@course}{\@empty}{\ifeq{\@instructor}{\@empty}{\@author}{\trueprintauthor}}{\trueprintauthor}\\% Basically, if the author is the only bit of info defined, we don't ouput "Name: Author", but just "Author".  If either the course or instructor is defined, we output "Name: Author", as usual.
  }
}
\newcommand{\PrintCourse}{% Outputting "Course: \@course §\@sectionnum" if the course and section are defined.  If only the course is defined, then it outputs "Course: \@course" and if just the section is defined, it outputs "Section: \@sectionnum"
	\ifeq{\@course}{\@empty}{% \@course isn't defined
	    \ifeq{\@sectionnum}{\@empty}{% \@course and \@sectionnum aren't defined
	    }{Section: & \@sectionnum\\}{}%
	}{% \@course is defined
	    Course: & \@course\ifeq{\@sectionnum}{\@empty}{}{\ \S\@sectionnum}\\}
}
\newcommand{\PrintCourseHead}{% Outputting "Course: \@course §\@sectionnum" if the course and section are defined.  If only the course is defined, then it outputs "Course: \@course" and if just the section is defined, it outputs "Section: \@sectionnum"
	\ifeq{\@course}{\@empty}{% \@course isn't defined
	    \ifeq{\@sectionnum}{\@empty}{% \@course and \@sectionnum aren't defined
	    }{Section \@sectionnum}{}%
	}{% \@course is defined
	    \@course\ifeq{\@sectionnum}{\@empty}{}{\ \S\@sectionnum}}
}
\newcommand{\PrintInstructor}{%
  \ifeq{\@instructor}{\@empty}{}{Instructor: & \@instructor \\}
}
\newcommand{\PrintInstitution}{%
  \ifeq{\@institution}{\@empty}{}{\@institution \\}
}
\newcommand{\PrintCollaborators}{%
  \ifeq{\@collaborators}{\@empty}{}{Collaborators: & \@collaborators \\}
}
\newcommand{\PrintNetID}{%
	\ifeq{\@netid}{\@empty}{}{NetID: & \@netid \\}
}
\newcommand{\PrintDate}{Date: & \@date}


\tcbset{colback=white,colframe=black,fonttitle=\bfseries}

\newtcolorbox{titlebox}[0]{colback=white,
colframe=black,fonttitle=\bfseries\centering,
% attach boxed title to top left={yshift=0mm,xshift=0mm},
sidebyside,
boxed title style={boxrule=0pt,colframe=white,}
% title={#1}
}




\renewcommand{\maketitle}{%
  \if@doublespaced % Making the info dump single spaced even if the rest of the document is double spaced
    \singlespacing
  \fi
  \thispagestyle{firstpage} %Only prints the page number, no other header or footer on this page
  \begin{center}
    \PrintAssignment \\
    \begin{tabular}{rl}
      \PrintAuthor
			\PrintNetID
			\PrintCollaborators
      \PrintCourse
      \PrintInstructor
			\PrintDate
    \end{tabular}
    %\vspace{.5cm}\\
    %\PrintInstitution
    %\@date
  \end{center}
  \if@doublespaced % Making the document return to double spaced if that option is set
    \doublespacing
  \fi
}



% % EXERCISE/THEOREM/PROOF
%
%
% % Exercise
%
% \newtcbtheorem[auto counter]{exercise}{Exercise}{%
%   lower separated=false,
%   colback=white,
%   colframe=black,
%   fonttitle=\bfseries\upshape,
%   separator sign={},
%   colbacktitle=black,
%   coltitle=white,
%   enhanced,
%   attach boxed title to top left={yshift=-2mm,xshift=2mm},
%   boxed title style={boxrule=0pt,colframe=white,},
% }{exer}
%
% \newenvironment{exer}[0]{
% \begin{exercise}{}{}
% }{
%   \end{exercise}
% }
%
% \newenvironment{exern}[1]{
% \begin{exercise*}{#1}
% }{
%   \end{exercise*}
% }
%
% \newenvironment{exeru}[0]{
% \begin{exercise*}{}
% }{
%   \end{exercise*}
% }
%
%
%
%
%
%
% % Theorem
%
% \newtcbtheorem[auto counter]{theorem}{Theorem}{%
%   lower separated=false,
%   colback=white,
%   colframe=black,
%   fonttitle=\bfseries\upshape,fontupper=\itshape,
%   separator sign={},
%   colbacktitle=black,
%   coltitle=white,
%   enhanced,
%   attach boxed title to top left={yshift=-2mm,xshift=2mm},
%   boxed title style={boxrule=0pt,colframe=white,},
% }{thm}
%
% \newenvironment{thm}[0]{
% \begin{theorem}{}{}
% }{
%   \end{theorem}
% }
%
% \newenvironment{thmn}[1]{
% \begin{theorem*}{#1}
% }{
%   \end{theorem*}
% }
%
% \newenvironment{thmu}[0]{
% \begin{theorem*}{}
% }{
%   \end{theorem*}
% }
%
%
% % Lemma
%
% \newtcbtheorem[use counter from=theorem]{lemma}{Lemma}{%
%   lower separated=false,
%   colback=white,
%   colframe=black,
%   fonttitle=\bfseries\upshape,fontupper=\itshape,
%   separator sign={},
%   colbacktitle=black,
%   coltitle=white,
%   enhanced,
%   attach boxed title to top left={yshift=-2mm,xshift=2mm},
%   boxed title style={boxrule=0pt,colframe=white,},
% }{lem}
%
% \newenvironment{lem}[0]{
% \begin{lemma}{}{}
% }{
%   \end{lemma}
% }
%
% \newenvironment{lemn}[1]{
% \begin{lemma*}{#1}
% }{
%   \end{lemma*}
% }
%
% \newenvironment{lemu}[0]{
% \begin{lemma*}{}
% }{
%   \end{lemma*}
% }
%
%
% % Corollary
%
% \newtcbtheorem[use counter from=theorem]{corollary}{Corollary}{%
%   lower separated=false,
%   colback=white,
%   colframe=black,
%   fonttitle=\bfseries\upshape,fontupper=\itshape,
%   separator sign={},
%   colbacktitle=black,
%   coltitle=white,
%   enhanced,
%   attach boxed title to top left={yshift=-2mm,xshift=2mm},
%   boxed title style={boxrule=0pt,colframe=white,},
% }{coro}
%
% \newenvironment{coro}[0]{
% \begin{corollary}{}{}
% }{
%   \end{corollary}
% }
%
% \newenvironment{coron}[1]{
% \begin{corollary*}{#1}
% }{
%   \end{corollary*}
% }
%
% \newenvironment{corou}[0]{
% \begin{corollary*}{}
% }{
%   \end{corollary*}
% }
%
%
% % Definition
%
% \newtcbtheorem[use counter from=theorem]{definition}{Definition}{%
%   lower separated=false,
%   colback=white,
%   colframe=black,
%   fonttitle=\bfseries\upshape,
%   separator sign={},
%   colbacktitle=black,
%   coltitle=white,
%   enhanced,
%   attach boxed title to top left={yshift=-2mm,xshift=2mm},
%   boxed title style={boxrule=0pt,colframe=white,},
% }{coro}
%
% \newenvironment{defn}[0]{
% \begin{definition}{}{}
% }{
%   \end{definition}
% }
%
% \newenvironment{defnn}[1]{
% \begin{definition*}{#1}
% }{
%   \end{definition*}
% }
%
% \newenvironment{defnu}[0]{
% \begin{definition*}{}
% }{
%   \end{definition*}
% }
%
%
% % PROOF
%
% % Aaaaaa



\newtheorem{thm}{Theorem}
\newtheorem{lem}[thm]{Lemma}
\newtheorem{coro}[thm]{Corollary}

\newtheorem*{thmu}{Theorem}
\newtheorem*{lemu}{Lemma}
\newtheorem*{corou}{Corollary}

\newtheorem{manualthmn}{Theorem}
\newenvironment{thmn}[1]{%
  \renewcommand\themanualthmn{#1}%
  \manualthmn
}{\endmanualthmn}

\newtheorem{manuallemn}{Lemma}
\newenvironment{lemn}[1]{%
  \renewcommand\themanuallemn{#1}%
  \manuallemn
}{\endmanuallemn}

\newtheorem{manualcoron}{Corollary}
\newenvironment{coron}[1]{%
  \renewcommand\themanualcoron{#1}%
  \manualcoron
}{\endmanualcoron}

\theoremstyle{definition}

\newtheorem{defn}[thm]{Definition}
\newtheorem*{defnu}{Definition}

\newtheorem{manualdefnn}{Definition}
\newenvironment{defnn}[1]{%
  \renewcommand\themanualdefnn{#1}%
  \manualdefnn
}{\endmanualdefnn}

\newtheorem{manualexern}{Exercise}
\newenvironment{exern}[1]{%
  \renewcommand\themanualexern{#1}%
  \manualexern
}{\endmanualexern}

\newtheorem{exer}{Exercise}
\newtheorem*{exeru}{Exercise}


\newcommand{\exthmcolor}{black}
\newcommand{\exthmcbefore}{20pt}
\newcommand{\exthmcafter}{10pt}
\newcommand{\proofcolor}{cyan!75!black}


\tcolorboxenvironment{exer}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }
\tcolorboxenvironment{exern}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }
\tcolorboxenvironment{exeru}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }


\tcolorboxenvironment{thm}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }
\tcolorboxenvironment{thmn}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }
\tcolorboxenvironment{thmu}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }

\tcolorboxenvironment{lem}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }
\tcolorboxenvironment{lemn}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }
\tcolorboxenvironment{lemu}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }

\tcolorboxenvironment{coro}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }
\tcolorboxenvironment{coron}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }
\tcolorboxenvironment{coron}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }

\tcolorboxenvironment{defn}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }
\tcolorboxenvironment{defnn}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }
\tcolorboxenvironment{defnu}{
enhanced jigsaw,colframe=\exthmcolor,interior hidden,
breakable,before skip=\exthmcbefore,after skip=\exthmcafter }



\newenvironment{solution}[1][Solution]{\begin{proof}[#1]\let\qed\relax}{\end{proof}}

\renewcommand\qedsymbol{$\blacksquare$}

\tcolorboxenvironment{proof}{% `proof' from `amsthm'
blanker,breakable,left=5mm,
before skip=10pt,after skip=6pt,
borderline west={.5mm}{0pt}{\proofcolor}}


% INDUCTION ENVIORNMENT


\newtcolorbox{inductionbox}[1]{title={#1},enhanced,
  coltitle=black,
  % colback=white,
  top=4mm,
  attach boxed title to top left=
  {yshift=-2mm,xshift=2mm},
  boxed title style={size=small,colback=white}}

\newenvironment{induction}{
	\vskip 6pt
	\noindent\begin{minipage}[t]{\textwidth}
}{
	\end{minipage}
}
\newenvironment{basecase}{
	\begin{inductionbox}{Base case}
}{
	\end{inductionbox}
}
\newenvironment{indhyp}{
	\begin{inductionbox}{Induction hypothesis}
}{
	\end{inductionbox}
}
\newenvironment{indstep}{
	\begin{inductionbox}{Induction step}
}{
	\end{inductionbox}
}



\endinput
