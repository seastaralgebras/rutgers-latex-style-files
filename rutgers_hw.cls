\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rutgers_hw}[2021/09/18 Rutgers Homework2 LaTeX class ]


\newif\if@doublespaced \@doublespacedfalse % Default of single spaced documents.  To load the package setspace later, we introduce this conditional and have the option set the conditional to true.
\newif\if@sansserif \@sansseriffalse
\newif\if@boxes \@boxesfalse

\DeclareOption{doublespaced}{\@doublespacedtrue}

\DeclareOption{sansserif}{\@sansseriftrue}

\DeclareOption{boxes}{\@boxestrue}

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
\RequirePackage{tabularx}



\if@doublespaced
    \RequirePackage{setspace} % Setspace is preferred for line spacing over \linespread because it doesn't affect things like footnotes.
    \doublespacing
\fi

\if@sansserif
  \RequirePackage{cmbright}
  \RequirePackage[OT1]{fontenc}
\fi

\if@boxes
  \tcbset{colback=white,colframe=black,fonttitle=\bfseries}

  \newtcolorbox{infobox}[0]{colback=white,
  colframe=black,
  %fonttitle=\bfseries\centering,
  % attach boxed title to top left={yshift=0mm,xshift=0mm},
  %sidebyside,
  boxed title style={boxrule=0pt,colframe=white,}
  }

  \newtcolorbox{inductionbox}[1]{title={#1},enhanced,
    coltitle=black,
    % colback=white,
    top=4mm,
    attach boxed title to top left=
    {yshift=-2mm,xshift=2mm},
    colframe=gray,
    boxed title style={size=small,colback=white}
  }

  \newcommand{\exthmcolor}{black}
  \newcommand{\exthmbefore}{15pt}
  \newcommand{\exthmafter}{10pt}
  \newcommand{\proofcolor}{cyan!75!black}
  \newcommand{\proofbefore}{10pt}
  \newcommand{\proofafter}{15pt}

  \tcolorboxenvironment{exer}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }
  \tcolorboxenvironment{exern}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }
  \tcolorboxenvironment{exeru}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }

  \tcolorboxenvironment{thm}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }
  \tcolorboxenvironment{thmn}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }
  \tcolorboxenvironment{thmu}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }

  \tcolorboxenvironment{lem}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }
  \tcolorboxenvironment{lemn}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }
  \tcolorboxenvironment{lemu}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }

  \tcolorboxenvironment{coro}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }
  \tcolorboxenvironment{coron}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }
  \tcolorboxenvironment{coron}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }

  \tcolorboxenvironment{defn}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }
  \tcolorboxenvironment{defnn}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }
  \tcolorboxenvironment{defnu}{
  enhanced jigsaw,colframe=\exthmcolor,interior hidden,
  breakable,before skip=\exthmbefore,after skip=\exthmafter }

  \tcolorboxenvironment{proof}{% `proof' from `amsthm'
  blanker,breakable,left=5mm,
  before skip=\proofbefore,after skip=\proofafter,
  borderline west={.5mm}{0pt}{\proofcolor}}
\else
  \tcbset{colback=white,colframe=black,fonttitle=\bfseries}

  \newtcolorbox{infobox}[0]{colback=white,
  colframe=black,
  %fonttitle=\bfseries\centering,
  % attach boxed title to top left={yshift=0mm,xshift=0mm},
  %sidebyside,
  sharp corners,
  boxed title style={boxrule=0pt,colframe=white,}
  }

  \newtcolorbox{inductionbox}[1]{title={#1},enhanced,sharp corners,
    coltitle=black,
    top=0.3in,
    attach boxed title to top left=
    {xshift=0em,yshift=-\tcboxedtitleheight},
    colframe=gray,
    boxed title style={sharp corners, size=small,colback=white}
  }
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
			\def\trueprintauthor{Name: & \@author\\}% This is what should be printed usually: "Name: Author"
			\ifeq{\@course}{\@empty}{\ifeq{\@instructor}{\@empty}{\@author}{\trueprintauthor}}{\trueprintauthor}% Basically, if the author is the only bit of info defined, we don't ouput "Name: Author", but just "Author".  If either the course or instructor is defined, we output "Name: Author", as usual.
	}
}
\newcommand{\PrintCourse}{% Outputting "Course: \@course §\@sectionnum" if the course and section are defined.  If only the course is defined, then it outputs "Course: \@course" and if just the section is defined, it outputs "Section: \@sectionnum"
	\ifeq{\@course}{\@empty}{% \@course isn't defined
			\ifeq{\@sectionnum}{\@empty}{% \@course and \@sectionnum aren't defined
			}{Section: & \@sectionnum\\}{}%
	}{% \@course is defined
			Course: & \@course\ifeq{\@sectionnum}{\@empty}{\\}{\ \S\@sectionnum\\}}
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
	\ifeq{\@institution}{\@empty}{}{\@institution}
}
\newcommand{\PrintCollaborators}{%
	\ifeq{\@collaborators}{\@empty}{}{Collaborators: & \@collaborators \\}
}
\newcommand{\PrintNetID}{%
	\ifeq{\@netid}{\@empty}{}{NetID: & \@netid \\}
}
\newcommand{\PrintDate}{Date: & \@date \\}

\renewcommand{\maketitle}{%
	\if@doublespaced % Making the info dump single spaced even if the rest of the document is double spaced
		\singlespacing
	\fi
	\thispagestyle{firstpage} %Only prints the page number, no other header or footer on this page
	\begin{center}
		\PrintAssignment \\
		\begin{tabularx}{\linewidth}{r X}
			\PrintAuthor
			\PrintNetID
			\PrintCollaborators
			\PrintCourse
			\PrintInstructor
			\PrintDate
		\end{tabularx}
	\end{center}
	\if@doublespaced % Making the document return to double spaced if that option is set
		\doublespacing
	\fi
}



% THEOREM/EXERCISE COMMANDS


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


\newenvironment{solution}[1][Solution]{\begin{proof}[#1]\let\qed\relax}{\end{proof}}

\renewcommand\qedsymbol{$\blacksquare$}



% INDUCTION ENVIORNMENT


\newenvironment{induction}{
	\vskip 6pt
% 	\noindent\begin{minipage}[t]{\textwidth}
}{
% 	\end{minipage}
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
