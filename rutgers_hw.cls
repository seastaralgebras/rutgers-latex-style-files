\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rutgers_hw}[2021/09/12 Rutgers Homework LaTeX class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass{article}

\RequirePackage[english]{babel}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{mathtools}
\RequirePackage{enumitem}
\RequirePackage{framed}
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}





% TITLE COMMANDS

\renewcommand*{\author}[1]{\gdef\@author{#1}%
}
\renewcommand*{\@author}{Firstname Lastname}
\newcommand*{\assignment}[1]{\gdef\@assignment{#1}%
}
\newcommand*{\@assignment}{}
\newcommand*{\course}[1]{\gdef\@course{#1}%
}
\newcommand*{\@course}{Course Name}
\newcommand*{\sectionnum}[1]{\gdef\@sectionnum{#1}%
}
\newcommand*{\@sectionnum}{}
\newcommand*{\instructor}[1]{\gdef\@instructor{#1}%
}
\newcommand*{\@instructor}{InstructorName}
\newcommand*{\institution}[1]{\gdef\@institution{#1}%
}
\newcommand*{\@institution}{Your University}

\renewcommand*{\maketitle}{%
	{\centering
    {\Large\@assignment\unskip\strut\par}
	}
    \vspace{.5cm}
}


% PAGE FORMATTING

\pagestyle{fancy}
\setlength{\headheight}{14pt}
\fancyhf{}
\lhead{\@author}
\chead{\@course \ Section \@sectionnum}
\rhead{\@date}
\lfoot{\@instructor}
\cfoot{Page \thepage}
\rfoot{\@institution}


% EXERCISE/PROOF

\declaretheoremstyle[
spaceabove=.75cm, spacebelow=0cm,
headfont=\normalfont\bfseries,
notefont=\mdseries, notebraces={(}{)},
bodyfont=\normalfont,
postheadspace=.5em,
]{mystyle}
\theoremstyle{mystyle}

\newtheorem{manualexercise}{Exercise}
\newenvironment{exercise}[1]{%
  \renewcommand\themanualexercise{#1}%
  \manualexercise
}{\endmanualexercise}

\newenvironment{solution}[1][]{\begin{proof}[Solution]}{\end{proof}}

\renewcommand\qedsymbol{$\blacksquare$}



\endinput
