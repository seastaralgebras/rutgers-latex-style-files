\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rutgers_hw}[2021/09/12 Rutgers Homework LaTeX class]

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

\if@doublespaced
    \RequirePackage{setspace} % Setspace is preferred for line spacing over \linespread because it doesn't affect things like footnotes.
    \doublespacing
\fi




% PAGE FORMATTING

% \pagestyle{fancy}
% \setlength{\headheight}{14pt}
% \fancyhf{}
%
% \if@twoside
% 	\ifodd\value{page}\relax
% 		\lhead{\@date}
% 		\chead{\@cousesection}
% 		\rhead{\@author}
% 		\lfoot{\@institution}
% 		\cfoot{Page \thepage}
% 		\rfoot{\@instructor}
% 	\else
% 		\lhead{\@author}
% 		\chead{\@cousesection}
% 		\rhead{\@date}
% 		\lfoot{\@instructor}
% 		\cfoot{Page \thepage}
% 		\rfoot{\@institution}
% 	\fi
% \else
% 	\lhead{\@author}
% 	\chead{\@cousesection}
% 	\rhead{\@date}
% 	\lfoot{\@instructor}
% 	\cfoot{Page \thepage}
% 	\rfoot{\@institution}
% \fi



\if@twoside % For two-sided documents, the header and footer swap sides every other page
    \newcommand{\headeroddeven}{%
    	\ifodd\value{page}\relax% On odd pages, it's "Assignment Author"
    		\mdseries\normalsize\@assignment{}\hfill\@author%
    	\else% On even pages, it's "Author Assignment"
    		\mdseries\normalsize\@author{}\hfill\@assignment%
    	\fi%
    }
    \newcommand{\footeroddeven}{%
    	\ifodd\value{page}\relax% On odd pages, the page number is on the right
    		\hfill\normalfont\mdseries\thepage%
    	\else% On even pages, the page number is on the left
    		\normalfont\mdseries\thepage\hfill%
    	\fi%
    }
\else % For one-sided documents, the header and footer don't depend on page
    \newcommand{\headeroddeven}{%
        \rmfamily\mdseries\normalsize\@assignment{}\hfill\@author%
    }
    \newcommand{\footeroddeven}{\rmfamily\mdseries\normalsize\hfill\thepage}
\fi



\def\ps@standard{% Defines the page style with the above header and footer
    \def\@oddhead{\headeroddeven}%
	\def\@evenhead{\@oddhead}%
	\def\@oddfoot{\footeroddeven}%
	\def\@evenfoot{\@oddfoot}%
	\let\@mkboth\markboth%
}
\AtBeginDocument{\pagestyle{standard}}




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
\newcommand*{\sectionnum}[1]{\gdef\@sectionnum{#1}}
\newcommand*{\instructor}[1]{\gdef\@instructor{#1}}
\newcommand*{\institution}[1]{\gdef\@institution{#1}}

\let\@assignment\@empty %defining these to be empty at first
\let\@title\@empty
\let\@author\@empty
\let\@course\@empty
\let\@sectionnum\@empty
\let\@instructor\@empty
\let\@institution\@empty

\newcommand{\PrintAssignment}{% Printing the homework name and title on separate lines, first checking whether \@assignment and \@title are empty
    {\large\bfseries\ifeq{\@assignment}{\@empty}{Assignment}{\@assignment}}
    {\large\ifeq{\@title}{\@empty}{}{\\\@title}}
    \vspace{.5cm}\\%
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
\newcommand{\PrintInstructor}{%
    \ifeq{\@instructor}{\@empty}{}{Instructor: & \@instructor\\}
}
\newcommand{\PrintInstitution}{%
    \ifeq{\@institution}{\@empty}{}{\@institution\\}
}

\renewcommand{\maketitle}{%
    \if@doublespaced % Making the info dump single spaced even if the rest of the document is double spaced
        \singlespacing
    \fi
    \thispagestyle{plain} %Only prints the page number, no other header or footer on this page
    \begin{center}
        \PrintAssignment
        \begin{tabular}{rl}
           \PrintAuthor
           \PrintCourse
           \PrintInstructor
        \end{tabular}
        \vspace{.5cm}\\
        \PrintInstitution
        \@date
    \end{center}
    \if@doublespaced % Making the document return to double spaced if that option is set
        \doublespacing
    \fi
}

% \renewcommand{\maketitle}{
% 	\centering {
% 		\PrintAssignment
% 	}
% }


% EXERCISE/PROOF

\declaretheoremstyle[
    spaceabove=.75cm, spacebelow=0cm,
    headfont=\normalfont\bfseries,
    notefont=\mdseries, notebraces={(}{)},
    bodyfont=\normalfont,
    postheadspace=.5em,
]{HWtemplate}
\theoremstyle{HWtemplate}

\newtheorem{manualexercise}{Exercise}
\newenvironment{exercise}[1]{%
  \renewcommand\themanualexercise{#1}%
  \manualexercise
}{\endmanualexercise}

\newenvironment{solution}[1][Solution]{\begin{proof}[#1]}{\end{proof}}

%\renewcommand\qedsymbol{$\dashv$}



\endinput
