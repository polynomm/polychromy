\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{POLYNOMM}[2021/12/25 Una clase para el diseño de documentos olímpicos]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions \relax

\LoadClass[twoside]{book}

%%%%	Paquetes	%%%%

%
\RequirePackage{polychromy}

% Tipo de papel y ajuste de márgenes.
\RequirePackage[letterpaper, top=3cm, bottom=3cm, left=3cm, right=3cm]{geometry}

% Ajustes tipográficos con XeLaTeX o LuaLaTex (XeTeX/LuaTeX)
\RequirePackage{fontspec}

% Gráficos
\RequirePackage{tikz}
\usetikzlibrary{fadings}
\usetikzlibrary{backgrounds}

% Para personalizar cada caja. Paquete actual.
\RequirePackage{tcolorbox}

% Formato de página (encabezados y pies de página)
\RequirePackage{fancyhdr}

% Hipertexto/Links
\RequirePackage[hidelinks]{hyperref}

% Colores. Preferir formato HTML.
\RequirePackage{xcolor}

% Espaciado de línea
\RequirePackage{setspace}

%Listas
\RequirePackage{enumerate}
\RequirePackage{multicol}

% Paquetes AMS
\RequirePackage{amsmath, amsthm, amsfonts, amssymb}

%%%%	Ajustes generales	%%%%

% Evitar guiones al final de la línea
\tolerance=9999
\emergencystretch=10pt
\hyphenpenalty=10000
\exhyphenpenalty=100

% Indentación y espaciado 
\setlength{\parindent}{0em}
\setlength{\parskip}{1em}
\renewcommand{\baselinestretch}{1.5}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Contadores, medidas y definiciones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Indentación (No se indentará texto alguno en este documento)
\setlength{\parindent}{0cm}

% Fuente Montserrat (Compilar con Xelatex o LuaLatex)
\DeclareSymbolFont{operators}   {OT1}{cmr} {m}{n}
\DeclareSymbolFont{letters}     {OML}{cmm} {m}{it}
\DeclareSymbolFont{symbols}     {OMS}{cmsy}{m}{n}
\setmainfont[
Ligatures=TeX,
Numbers=Lining,
UprightFont = * Regular,
ItalicFont = * Italic,
SmallCapsFont = * Medium,
BoldFont = * Medium,
BoldItalicFont = * Medium Italic
]{Raleway}
%----- Nuevos estilos de letra.
\newfontface{\RalewayLight}{Raleway Light}
\newfontface{\RalewayRegular}{Raleway Regular}
\newfontface{\QuicksandLight}{Quicksand Light}
\newfontface{\QuicksandRegular}{Quicksand Regular}
\newfontface{\QuicksandMedium}{Quicksand Medium}
\newfontface{\QuicksandSemiBold}{Quicksand SemiBold}
\newfontface{\QuicksandBold}{Quicksand Bold}

\definecolor{ColorTexto}{HTML}{222222}
\color{ColorTexto}

%%%%	Links	%%%%

\newcommand{\Enlace}[2]{\href{#2}{\Regular\textcolor{Color}{Enlace: #1}}\normalfont\\}
\newcommand{\Archivo}[2]{\href{#2}{\textcolor{Color}{Archivo #1}}\\}
\newcommand{\Oficial}[3]{\href{run:../2. Coleccion de Archivos/#1/#2.#3}{\textbf{\textcolor{Color}{\textit{Archivo oficial} #1 #2}}\\}}

%%%%	Estilo de página	%%%%
\fancypagestyle{nada}{
	\fancyhead[L]{}
	\fancyhead[C]{}
	\fancyhead[R]{}
	\fancyfoot[L]{}
	\fancyfoot[C]{}
	\fancyfoot[R]{}
	\renewcommand{\headrulewidth}{0pt}
}
% Encabezados
\fancypagestyle{normal}{
	\fancyhead[L]{}
	\fancyhead[C]{}
	\fancyhead[R]{}
	\fancyfoot[L]{}
	\fancyfoot[C]{}
	\fancyfoot[R]{}
	\renewcommand{\headrulewidth}{0pt}
}

%%% Capítulo
\newcounter{NumCapitulo}
\setcounter{NumCapitulo}{0}
\newcommand{\NombreCapitulo}{Capítulo nuevo}
\newcommand{\ActualizarCapitulo}[1]{\renewcommand{\NombreCapitulo}{#1}}
\newcommand{\NombreTema}{Tema nuevo}
\newcommand{\ActualizarTema}[1]{\renewcommand{\NombreTema}{#1}}

\newcommand{\Capitulo}[1]{
	\ActualizarCapitulo{#1}
	\setcounter{NumProblema}{0}
	\setcounter{NumEnunciado}{0}
	\addtocounter{NumCapitulo}{1}
}

%%%%	Problemas	%%%%

%NumProblema es el contador del total de problemas.

\newcounter{NumProblema}
\setcounter{NumProblema}{0}

\newcounter{NumEnunciado}
\setcounter{NumEnunciado}{0}

\newcommand{\Problema}[1][]{\addtocounter{NumProblema}{1}\vspace{1.5em}{{\setstretch{1.25}\fontsize{14}{17.5}\selectfont\QuicksandSemiBold\textcolor{black}{Problema}\hspace{0.5em}\DegT{\theNumProblema}\hspace{1em}#1}\\[0.25em]}}

%%%%	Solución, demostración y nota	%%%%

\newcommand{\Solucion}[1][]{\vspace{.5em}{{\setstretch{1.25}\fontsize{9}{11.25}\selectfont\QuicksandBold\textcolor{black}{SOLUCIÓN #1}}\\[0.25em]}}

\newcommand{\Demostracion}[1][]{\vspace{.5em}{{\setstretch{1.25}\fontsize{9}{11.25}\selectfont\QuicksandBold\textcolor{black}{DEMOSTRACIÓN #1}}\\[0.25em]}}

\newcommand{\Nota}[1][]{\vspace{.5em}{{\setstretch{1.25}\fontsize{9}{11.25}\selectfont\QuicksandBold\textcolor{black}{NOTA #1}}\\[0.25em]}}

%%%%	Partes del título	%%%%
\newcommand{\DetallePOLYNOMM}[1][\par\setstretch{1.25}\fontsize{12}{15}\(\DegM{a_nx^n+\cdots+a_0}\)]{#1}

\newcommand{\Ruta}[1]{{\par\vspace{0.5cm}\setstretch{1.25}\fontsize{8}{10} \selectfont\RalewayRegular#1}}

\newcommand{\Tema}[1]{{\thispagestyle{nada}\par\vspace{0.5cm}\setstretch{1.25}\fontsize{32}{40} \selectfont\QuicksandLight\textcolor{black}{#1}}\pagestyle{normal}}

\newcommand{\Descripcion}[1]{{\par\vspace{0.5cm}\setstretch{1.25}\fontsize{18}{22.5}\selectfont\RalewayLight#1}}

\newcommand{\Fecha}[1]{\par\vspace{0.5cm}\selectfont\RalewayLight#1\vspace{1em}}

\newcommand{\Subtema}[1]{{\thispagestyle{nada}\par\vspace{0.5cm}\setstretch{1.25}\fontsize{18}{22.5} \selectfont\QuicksandBold\textcolor{black}{#1}}\pagestyle{normal}}

%%%%	Enunciados	%%%%

\newcommand{\Enunciado}[2][Enunciado]{\addtocounter{NumEnunciado}{1}\hypertarget{Enunciado\theNumCapitulo.\theNumEnunciado}{}\vspace{1.5em}{{\setstretch{1.25}\fontsize{14}{17.5}\selectfont\QuicksandSemiBold\textcolor{black}{#1}\hspace{0.5em}\DegT{\theNumEnunciado}\hspace{1em}#2}\\[0.25em]}}

\newcommand{\LinkEnunciado}[3][Enunciado]{\hyperlink{Enunciado#2.#3}{{\setstretch{1.25}\fontsize{12}{15}\selectfont\QuicksandSemiBold\textcolor{black}{#1}\hspace{0.5em}\DegT{#3}\hspace{1em}}}}

\newcommand{\LinkEnunciadoCompleto}[3][Enunciado]{\hyperlink{Enunciado#2.#3}{{\setstretch{1.25}\fontsize{12}{15}\selectfont\QuicksandSemiBold\textcolor{black}{#1}\hspace{0.5em}\DegT{#2.#3}\hspace{1em}}}}

\newcommand{\Teorema}[1][]{\Enunciado[Teorema]{#1}}
\newcommand{\Lema}[1][]{\Enunciado[Lema]{#1}}
\newcommand{\Corolario}[1][]{\Enunciado[Corolario]{#1}}
\newcommand{\Definicion}[1][]{\Enunciado[\DegT{Definición}]{#1}}
\newcommand{\Propiedad}[1][]{\Enunciado[Propiedad]{#1}}
\newcommand{\Ejemplo}[1][]{\Enunciado[Ejemplo]{#1}}
