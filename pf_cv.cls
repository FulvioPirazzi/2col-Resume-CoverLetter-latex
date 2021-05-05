\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pf_cv}[2020/01/04 My CV class]
\LoadClass[a4paper]{article}
\setlength{\parindent}{0pt}
\usepackage{xstring}
\usepackage[british]{babel}
\usepackage{cmbright}
\renewcommand\familydefault{\sfdefault} 
\usepackage[T1]{fontenc}

\RequirePackage{titlesec}     % for editing secions
\RequirePackage{xcolor}
\RequirePackage{ifthen}
\RequirePackage[margin=2.1cm,footskip=0.25in]{geometry}
\RequirePackage{multicol}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{graphicx}
\usepackage{datatool, filecontents}
\DTLsetseparator{ = }
%%% page settings
\setlength\columnsep{1.2cm}

%%% custom colors
\definecolor{cvblue}{rgb}{0.32, 0.68, 0.89}

\makeatletter
  \newcommand\titup{\@setfontsize\titup{55pt}{55}}
  \newcommand\titmed{\@setfontsize\titmed{55pt}{55}}
  \newcommand\titunder{\@setfontsize\titunder{10pt}{10}}
  \newcommand\titinfo{\@setfontsize\titinfo{14pt}{18}}
  \newcommand\sectit{\@setfontsize\sectit{16pt}{16}}
  \newcommand\secwork{\@setfontsize\secwork{14pt}{15}}
  \newcommand\secdesc{\@setfontsize\secdesc{12pt}{13}}
\makeatother

\newcommand*{\titlelogo}[3]{
    {\hspace{39pt}\titup{\textbf{#1}}}\vspace{-10pt}    
    {\slshape{\titmed{#2}}}
    {\titunder{#3}}
}

\newcommand*{\titleadd}[3]{%
  \ifEN
    \begin{flushright}
    \titinfo{
    { Email} \textbf{#2\\}
    { Phone} \textbf{#3\\}        
    }
    \end{flushright}
  \fi
  \ifIT
    \begin{flushright}
    \titinfo{
    { Email} \textbf{#2\\}
    { Tel } \textbf{#3\\}
    }
    \end{flushright}
  \fi
}

\newcommand*{\CLblue}[2]{%
    \vspace{10pt}
    {\color{cvblue}
    \ifEN{\noindent\sectit{\textbf{\getdata{#1}}}}\fi
    \ifIT{\noindent\sectit{\textbf{\getdata{#2}}}}\fi
  }
}


\newcommand*{\CLtext}[1]{%
    \secdesc{\getdata{#1}}\\
    \vspace{.4cm}
}


\newcommand*{\CLtextBF}[1]{%
    \secdesc{\textbf{\getdata{#1}}}\\
    \vspace{.12cm}
}

\newcommand*{\CLcontact}[2]{%
    \noindent\secdesc{\textbf{#2}}
    \raisebox{-.25\height}{\includegraphics[width=0.7cm]{icon/{#1}.png}}
    \vspace{.2cm}
}

\newcommand*{\icoTitle}[3]{%
    \vspace{10pt}
    {\color{cvblue}
    \includegraphics[width=0.9cm]{icon/{#1}.png}
    %{\hspace{-30pt}\circled{#1}}
    \ifEN{\noindent\sectit{\textbf{#2\\}}}\fi
    \ifIT{\noindent\sectit{\textbf{#3\\}}}\fi
}}

\newcommand*{\work}[4]{%
    \ifEN{\noindent\secwork{\textbf{\\#1}}}
    {\secdesc{\textbf{\\#2}}}\fi
    \ifIT{\noindent\secwork{\textbf{\\#3}}}
    {\secdesc{\textbf{\\#4}}}\fi
}


\newcommand*{\specdot}[2]{%
    \ifEN{\\$\bullet$\secdesc{#1}}\fi
    \ifIT{\\$\bullet$\secdesc{#2}}\fi
}

\newcommand*{\listt}[4]{%
\ifEN\secdesc{\textbf{\\#1} #2}\fi
\ifIT\secdesc{\textbf{\\#3} #4}\fi
}

\newcommand*{\spec}[2]{%
    \ifEN{\\\noindent{\secdesc{#1}}}\fi
    \ifIT{\\\noindent{\secdesc{#2}}}\fi
}