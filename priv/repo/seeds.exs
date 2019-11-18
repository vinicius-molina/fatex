# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Fatex.Repo.insert!(%Fatex.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

configuration = ~S"""
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Artigo segundo as normais mais atualizadas da ABNT
% Adaptado do projeto ABNTeX2 (que nao esta totalmente sincronizada com as normas da ABNT)
% Autor: Berg Dantas (bergdantas@msn.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\documentclass[article,12pt,oneside,a4paper,english,brazil,sumario=tradicional]{abntex2}
% Pacotes usados
\usepackage{times}%Usa a fonte Latin Modern
\usepackage[T1]{fontenc}%Selecao de codigos de fonte.
\usepackage[utf8]{inputenc}%Codificacao do documento
\usepackage{indentfirst}%Indenta o primeiro parágrafo de cada seção.
\usepackage{nomencl}%Lista de simbolos
\usepackage{color}%Controle das cores
\usepackage{graphicx}%Inclusão de gráficos
\usepackage{microtype}%Para melhorias de justificação
\usepackage{lipsum}%Para geração de dummy text
\usepackage[abnt-emphasize=bf,abnt-and-type=e,alf]{abntex2cite}%Citações ABNT
\usepackage{mathptmx}
%\usepackage[bottom=2cm,top=3cm,left=3cm,right=2cm]{geometry}

% Configuracoes do documento
\graphicspath{{./Figuras/}}%Images na pasta "Figuras"
\setsecheadstyle{\bfseries \normalsize \uppercase}
\setsubsecheadstyle{\normalsize \uppercase}
\setsubsubsecheadstyle{\bfseries \normalsize}
\setlrmarginsandblock{3cm}{2cm}{*}%Margens esquerda-direita
\setulmarginsandblock{3cm}{2cm}{*}%Margens cima-baixo
\checkandfixthelayout
\setlength{\parindent}{1.25cm}%paragrafo
\OnehalfSpacing%espacamento de 1,5
\setlength{\ABNTEXcitacaorecuo}{4cm}%recuo citacao direta +3

\begin{document}
\selectlanguage{brazil} % Seleciona o idioma do documento
\frenchspacing % Retira espaço extra obsoleto entre as frases.
"""

title_start = ~S"""
\begin{center}
%TITULO
  \uppercase{
    \bfseries{
"""

title_end = ~S"""
    }
  }
	\vspace{12pt}
\end{center}
"""

autor_start = ~S"""
\begin{flushright}
"""

autors = ~S"""
%AUTOR - Pode-se contar com infinitos autores   :)
	Andrey Gonçalves\footnote{IFRN, andreygo20@gmail.com}
	\\
	Vinicius Molina\footnote{IFRN, vinicius_molina99@hotmail.com}
	\\
	Rafael dos Santos Borges\footnote{IFRN, rafael@fatecriopreto.edu.br}
	\vspace{12pt}
"""

autor_end = ~S"""
\end{flushright}
"""

# TODO: adicionar autores 

resumo = ~S"""
A organização de documentos é uma forma primordial de facilitar a disseminação de conhecimento, 
	atualmente são utilizadas diversas tecnologias para esta finalidade, principalmente aquelas que permitem o design visual. 
	Segundo GROZA (2007), uma ferramenta para edição de texto de alta qualidade é o LaTeX, muito popular entre cientistas 
	e pesquisadores principalmente. Porém, tamanha eficiência vem acompanhada de um empecilho, seu uso requer um previo 
	conhecimento de suas funcionalidades, que por sua vez, é um pouco complexa e em certas ocasiões desmotiva um usuário a 
	utilizar a mesma. Para tal, este trabalho visa fazer a utilização do design lógico do LaTeX com uma interface e uso mais 
	intuitivos, como resolução deste problema.
"""

resumo_start = ~S"""
\begin{footnotesize}
\SingleSpacing
\noindent
\small{\textbf{Resumo:}}
\noindent
\small
"""
# TODO: add abstract
    
keywords = ~S"""
Ambiente Gráfico, Praticidade e Aprimoramento de UX.
"""

keywords_start = ~S"""
\noindent
\textbf{Palavras-chave}: 
"""

keywords_end = ~S"""
\end{footnotesize}
"""

introduction = ~S"""
Desde que a humanidade começou a compartilhar e armazenar conhecimento em formas textuais, 
	sempre foi necessário que ele estivesse organizado de forma adequada parafácil compreensão. 
	Na atualidade são utilizadas ferramentas para facilitar este trabalho, principalmente as conhecidas 
	como what you see is what you get (WYSIWYG), que fornecem um design visual para a organização dos textos.

O LaTeX é uma ferramenta que fornece um design lógico, ótimo para documentos complexos (como trabalhos científicos) 
	(LAMPORT, 1994). Porém, esta eficiência é acompanhada por um obstáculo, que em certas ocasiões, desmotiva o uso
	 da ferramenta, este empecilho nada mais é que a sua usabilidade que, por sua vez, requer do usuário 
	 um previo conhecimento de suas funcionalidades.

Diante deste cenário, o presente projeto busca permitir o uso do LaTeX para edição de texto de forma eficiente, 
e voltada para usuários leigos.
"""

introduction_start = ~S"""
\textual
\pagestyle{simple}
\aliaspagestyle{chapter}{simple}

\section{Introdução}
\label{secIntroducao}
\normalsize
"""

justification = ~S"""
  Levando em conta que segundo Davis e Walters (2011) a presença de indivíduos que desenvolvem documentos científicos 
	vem sofrendo um grande aumento, a existência de uma plataforma para a edição de documentos complexos de forma 
	eficiente pode trazer grandes benefícios para a comunidade como um todo. O LaTeX permite a escrita de tais documentos 
	com uma formatação facilmente padronizável e distribuível por documentos de configuração, porém necessita de estudo 
	prévio por parte do usuário para uma utilização efetiva.
"""

justification_start = ~S"""
\section{Justificativa}
"""

objective = ~S"""
O objetivo deste projeto é desenvolver um editor LaTeX para a Fatec, que possua uma interface de usuário que seja simples, 
	de fácil aprendizado e que mantenha a eficácia do LaTeX para organização de documentos.

Como um possível adendo a este trabalho, é cogitado disponibilizar e integrar o sistema em duas plataformas diferentes: 
	web e mobile, tendo ênfase, a web.
"""

objective_start = ~S"""
\section{Objetivo}
"""

fundamentation = ~S"""
TeX é um programa de tipografia e fórmulas matemáticas criado por Donal E. Knuth (DONALD, 1989). 
	E conhecido por ser extremamente estável e multiplataforma (OETIKER et al., 2011).
LaTeX é um pacote macro do TeX que permite a profissionais utilizarem layouts pré-definidos. 
	Ele foi originalmente escrito por Leslie Lamport (LAMPORT, 1994) e atualmente é mantido por Frank Mittelbach.

Elm é uma linguagem funcional que compila pra Java Script. Compete com projetos como o React, 
	por também ser uma ferramenta para criação de websites e web apps. Possui uma grande ênfase na simplicidade, 
	fácil usabilidade e funcionalidade (CZAPLICKI, 2019).

Flutter é um conjunto de ferramentas, criado pela Google para o desenvolvimento de interfaces gráficas. 
	Permite o desenvolvimento de programas nativos para dispositivos móveis, web e desktop sem a necessidade 
	de reescrever o código exclusivamente para cada plataforma (FLUTTER. . ., 2019).
"""

fundamentation_start = ~S"""
\section{Fundamentação Teórica}
"""

other_works = ~S"""
Considerado por muitos o melhor editor LaTeX existente, o TeXMarker se encontra disponível para Windows, 
	MAC e Linux (onde mais é utilizado). Possuindo diversas funcionalidades (BRACHET, 2003).

TeXstudio é um competidor “sucessor” e sucessor direto do TeXMarker, desenvolvido para ser um editor com 
	um processo de desenvolvimento transparente opondo- se a seu antecessor. Está presente em todas as principais 
	plataformas e é tão funcional e completo quanto TeXMaker (ZANDER, 2019).

Segundo a Google Play (2019) uma companhia que trouxe seu editor LaTeX, agora nomeado VerbTex para as 
	plataformas mobile e obteve grande sucesso é a VERBOSUS conquistando mais de 100 mil downloads e nota 
	média de 4,4 pontos de um total de 5 na loja de aplicativos do Android, a Google Play.

Outro editor LaTeX que faz sucesso é o neutriNote, que por sua vez possui mais de 10 mil downloads e 
	nota média de 4,4 pontos na Google Play.

Mais dois editores que ainda estão em crescimento na loja são o LawTex que vem como sucessor do 
	TEXPortal prometendo melhorias e novas funcionalidades, e o TeX Writer – LaTeX On the Go que é único dos 
	aqui mencionados que possui apenas a versão paga, ambos possuem mais de 1000 downloads e notas médias de 3,5 e 3,7 
	respectivamente na Google Play.
"""

other_works_start = ~S"""
\section{Trabalhos Similares}
"""

metodology = ~S"""
Este trabalho será realizado de forma exploratória, sendo primeiramente planejado e desenvolvido um produto 
	viável mínimo (MVP), utilizando os princípios do Scrum que visa trazer valor para o produto ao expô-lo de forma 
	periódica ao público alvo (SUTHERLAND, 2016). O público alvo será inicialmente composto por pessoas inseridas no 
	meio acadêmico, para tal, disponibilizaremos o MVP online e realizaremos pesquisas de campo na 
	FATEC de São José do Rio Preto. O valor do produto será medido pelo tempo transcorrido em um intervalo de tempo 
	que o público alvo passará utilizando a solução em comparação com outras soluções do estilo WYSIWYG. 
	A coleta de dados será realizada através de formulários presenciais e online.

Para a realização deste projeto será utilizado como infraestrutura o Linux, com servidores distribuídos construídos 
	com Elixir e as interfaces de usuário desenvolvidas com Flutter. Para realizar o armazenamento de dados de usuários 
	será utilizado PostgreSQL ou Cassandra.
"""

metodology_start = ~S"""
\section{Metodologia}
"""

plane = ~S"""
Atividade 1: levantamento bibliográfico: Identificação de livros e artigos que descrevem os assuntos tratados neste trabalho.

Atividade 2: coleta de dados: Identificação das tags utilizadas no LaTeX, verificando casos isolados e regras 
	de aninhamento das tags, para assim especificar as regras básicas de comportamento dos containers.

Atividade 3: definindo o UX: A UX será planejada através de um protótipo e discutindo melhorias ao longo do projeto 
	com os colegas e professores.

Atividade 4: implementação da plataforma base: será desenvolvida com Elm.

Atividade 5: integração com banco de dados: Será utilizado como banco de dados o PostgreSQL, para possibilitar 
	o consumo dos dados do mesmo será utilizado o Phoenix Framework com Elixir.

Atividade 6: Atualização de visualização em real-time: Será implementado a atualização de visualização formatada 
	do texto através do sistema de channels do Phoenix.
"""

plane_start = ~S"""
\section{Plano de Trabalho}
"""

schedule = ~S"""
\begin{table}[h]
\centering
\caption{Cronograma}
\vspace{0.5cm}
\begin{tabular}{r|llllll}
Atividades  & Julho & Agosto & Setembro & Outubro & Novembro & Dezembro \\
\hline
Atividade 1 & X &   &   &   &   &   \\
Atividade 2 & X &   &   &   &   &   \\
Atividade 3 &   & X &   &   &   &   \\
Atividade 4 &   &   & X & X & X &   \\
Atividade 5 &   &   &   & X & X &   \\
Atividade 6 &   &   &   &   & X & X 
\end{tabular}
\end{table}
"""

schedule_start = ~S"""
\section{Cronograma}
"""

# TODO: Testes e Resultados

final_considerations = ~S"""
Considera\c c\~oes finais considera\c c\~oes finais considera\c c\~oes finais considera\c c\~oes finais considera\c c\~oes finais considera\c c\~oes finais.
"""

final_considerations_start = ~S"""
\section{Considerações Finais}
"""

final_considerations_end = ~S"""
\renewcommand{\bibsection}{\section*{REFERÊNCIAS BIBLIOGRÁFICAS}}
\bibliographystyle{abntex2-alf}
\bibliography{Referencias}
\end{document}
"""

alias Fatex.Repo
alias Fatex.LatexConfigs.{Model, Step, Section}
alias Fatex.Accounts.User

# Em tabelas root o nome é ignorado caso latex_name_start ou latex_name_end não for contiverem algo, em tabelas filhas o nome é usado com o begin{NAME} caso não houver os dados acima

# TODO: adicionar no meno possibilidade de imagens
#%Section{
#  name: "Image",
#  content: "",
#  type: "template"
#}

Repo.insert!(%User{
  name: "vinicius",
  email: "vinicius_molina@hotmail.com",
  password_hash: Argon2.add_hash("test")[:password_hash],
  models: [
    %Model{
      name: "default",
      steps: [
        %Step{
          name: "Informações",
          sections: [
            %Section{
              name: "Titulo",
              content: "Insira aqui os autores Autores",
              type: "root",
              latex_name_start: configuration <> title_start,
              latex_name_end: title_end
            },
            %Section{
              name: "Autores",
              content: autors, 
              type: "root"
            },
          ]
        },

        %Step{
          name: "Resumo",
          sections: [
            %Section{
              name: "Resumo",
              content: resumo,
              type: "root",
              latex_start: resumo_start
            },
            %Section{
              name: "Abstract",
              content: "",
              type: "root"
            }
          ]
        },

        %Step{
          name: "Introdução",
          sections: [
            %Section{
              name: "Introdução",
              content: introduction,
              latex_start: introduction_start,
              type: "root"
            },
            %Section{
              name: "Justificativa",
              content: justification,
              latex_start: justification_start,
              type: "root"
            },
            %Section{
              name: "Objetivo",
              content: objective,
              latex_start: objective_start,
              type: "root"
            },
            %Section{
              name: "Fundamentação Teorica",
              content: fundamentation,
              latex_start: fundamentation_start,
              type: "root"
            },
            %Section{
              name: "Trabalhos Similares",
              content: other_works,
              latex_start: other_works_start,
              type: "root"
            }
          ]
        },

        %Step{
          name: "Desenvolvimento",
          sections: [
            %Section{
              name: "Metodologia",
              content: metodology,
              latex_start: metodology_start,
              type: "root"
            },
            %Section{
              name: "Plano de Trabalho",
              content: plane,
              latex_start: plane_start,
              type: "root"
            },
            %Section{
              name: "Cronograma",
              content: schedule,
              latex_start: schedule_start,
              type: "root"
            }
          ]
        },

        %Step{
          name: "Testes e Resultados",
          sections: [
            %Section{
              name: "Testes",
              content: "",
              type: "root"
            },
            %Section{
              name: "Resultados",
              content: "",
              type: "root"
            }
          ]
        },

        %Step{
          name: "Discussão e Conclusão",
          sections: [
            %Section{
              name: "Conciderações Finais",
              content: final_considerations,
              latex_start: final_considerations_start,
              latex_end: final_considerations_end,
              type: "root"
            }
          ]
        },
      ]
    }
  ]
})
