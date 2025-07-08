%%
%% Paul Plew Resume LaTeX Class
%% Licensed under the MIT license
%%

\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{resume}

\LoadClass[letterpaper, oneside, final, 11pt]{scrartcl}
\usepackage[letterpaper,left=0.85in,top=0.75in,right=0.85in,bottom=1.35in]{geometry}
\usepackage{setspace}
\usepackage{xifthen}
\usepackage{enumitem}
\usepackage{stackengine}
\usepackage{datetime}
\usepackage{array}
\usepackage{ragged2e}

\settimeformat{oclock}
\shortdate

\RequirePackage{hyperref,scrlayer-scrpage,titlesec,marvosym,soul,makecell,tabularx,lastpage}

%%
%% Page Setup
%%

\pagestyle{scrheadings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% HEADING COMMANDS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%% NAME
%%
\newcommand{\name}[1]{
	\title{#1's Resum$\acute{e}$}
	\author{#1}
	\begin{center}
    	\textsc{ \LARGE{ \so{#1} } }
    \end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOOTER COMMANDS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%% EMAIL
%%
\newcommand{\footeremail}[1]{{\large\Letter} \href{mailto:#1}{\so{#1}}}

%%
%% PHONE
%%
\newcommand{\footerphone}[1]{{\large\Telefon} \small{\so{#1}}}

%%
%% BLOG/LINK
%%
\newcommand{\footerlink}[2]{{\large\ComputerMouse} \href{#1}{\small{\so{#2}}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SECTION COMMANDS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\titleformat{\section}{\large\scshape\raggedright}{}{0em}{}[\titlerule]

%%
%%
%%
\newcommand{\stdtable}[1]{
    \begin{tabularx}{1.00\linewidth}{>{\raggedleft\scshape}m{3cm}X}
    #1
    \end{tabularx}
}

%%
%% \employer{NAME}{WEBSITE}{DATE}{TITLE}{DESCRIPTION}
%%
\newcommand{\employer}[5]{\addstackgap[0.5em]{\begin{tabularx}{1.00\linewidth}{>{\raggedleft\scshape}p{2cm}X}
    Period     & #3\\
    Employer   & #1 \hfill \href{#2}{#2}
    \ifthenelse{\isempty{#4}}
        {}
        {\\Job Title  & #4}
    \ifthenelse{\isempty{#5}}
        {}
        {\\Duties     & \makecell[Xt]{\begin{minipage}[t]{\linewidth}#5\end{minipage}}\\}
\end{tabularx}}}

%%
%% \project{NAME}{WEBSITE}{ROLE}{DETAILS}
%%
\newcommand{\project}[4]{\addstackgap[0.5em]{\begin{tabularx}{1.00\linewidth}{>{\raggedleft\scshape}p{2cm}X}
    Project    & #1 \hfill \href{#2}{#2}\\
    Role       & #3\\
    Details    & #4\\
\end{tabularx}}}

%%
%% LIST STYLES
%%
\newlist{jobitems}{itemize}{3}
\setlist[jobitems]{label=\textbullet,nosep,topsep=0em,labelindent=\parindent,leftmargin=*}
\setlist[jobitems,2]{label=-}

\newcommand{\itemlist}[1]{%
  \begin{tabular}{@{}*{\the\numexpr\count0+1\relax}{\raggedright}@{}}  
    #1
  \end{tabular}%
}

\newcommand{\centereddot}[0]{\textperiodcentered\,}
