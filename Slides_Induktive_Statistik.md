---
title: "Induktive Statistik"
author: "Prof. Dr. Christoph Hanck"
date: "Sommersemester 2025"
output: 
  runidue::lectureslides:
    
    lang: "en"
#    logo: signet_ude_rgb.png
 #   logo: signet_ude_rgb.png
    
    keep_tex: true
#exercise_box_color: yellow
#beispiel_box_color: black
editor_options: 
  chunk_output_type: console
classoption: aspectratio=169
params:
  #kahoot: kahootlogo2.png
---




# Einleitung

## Motivation

- Ziel der \hil{deskriptiven} (beschreibenden) \hil{Statistik}: das Datenmaterial mit Hilfe tabellarischer und grafischer Repräsentationen sowie geeigneter Kenngrößen übersichtlich aufbereiten.
- Ziel der \hil{induktiven} (schließenden) \hil{Statistik}: Verifikation theoretischer Modelle anhand von Daten und Testen von Hypothesen über unbekannte Parameter auf Basis von Wahrscheinlichkeitsmodellen.




## Motivation
\framesubtitle{Beispiel: Lernerfolg}
 

\footnotesize
\begin{center}\includegraphics{Resources/Plots/unnamed-chunk-2-1} \end{center}
\normalsize




## Motivation

Übergang von der deskriptiven zur induktiven Statistik:

- \hil{Induktives Schließen}, statistische Inferenz, Repräsentationsschluss: Schluss von einer Teilgesamtheit auf die Grundgesamtheit
- \hil{Induktive Statistik}: Methoden, die es erlauben von den Beobachtungen einer
Teilgesamtheit \linebreak (= *Stichprobe*) auf bestimmte Charakteristika
der dazugehörenden *Grundgesamtheit* zu
schließen.

## Motivation

- Beim Glücksspiel meinen Sie, dass die \glqq{}Gegenseite\grqq{} mit manipulierten Würfeln spielt, d.h. die Zahl 6 fällt häufiger als andere Zahlen. Wie können Sie Ihre Vermutung überprüfen?
- Vor der Bundestagswahl prognostiziert ein Wahlforschungsinstitut, dass 30% der Stimmen auf die CDU/CSU entfallen. Wie kann eine solche Prognose verlässlich durchgeführt werden?

Ziel: Schlussfolgerungen von einer Stichprobe auf die Grundgesamtheit


## Motivation
\framesubtitle{QuizAcademy}

\QuizAcademy{Schokoladenwürfel}\endQuizAcademy


## Motivation

\framesubtitle{GeneralQuiz}

\Quiz{new section}\endQuiz

\framesubtitle{General Quiz}

\Quiz{new section}\endQuiz



## Motivation

\begin{center}
\includegraphics[height=0.6\textheight, keepaspectratio]{Resources/Grafiken/Schaetzen.jpg}
\end{center}
\source{\href{https://blog.ritter-sport.de/2014/08/05/schatzt-euch-bunt/}{https://blog.ritter-sport.de/2014/08/05/schatzt-euch-bunt/}}



## Motivation

Man beachte: Wahrscheinlichkeitsrechnung

- ist __mehr__ als Grundlage der schließenden Statistik
- hat enorme eigenständige ökonomische Bedeutung z.B. in der
  - Mikroökonomik
  - Investition und Finanzierung
  - Portfoliotheorie




## Gliederung

1. Einleitung
2. Grundlagen
3. Eindimensionale Zufallsvariablen
4. Ausgewählte theoretische Verteilungen
5. Grundzüge der Stichprobentheorie
6. Statistische Schätzverfahren
7. Statistische Testverfahren
8. Zweidimensionale Zufallsvariablen



# Grundlagen


## Grundlegende Begriffe
\framesubtitle{Zufallsvorgang}


Zufallsvorgänge (bzw. stochastische Vorgänge) sind durch zwei wesentliche Eigenschaften gekennzeichnet:

1. Sie besitzen verschiedene, sich gegenseitig ausschließende Ausgänge, die bereits vor Beginn des Vorgangs bekannt sind;
2. es ist nicht vorhersehbar, welcher Ausgang tatsächlich eintreten wird.

\hil{Beispiele} für Zufallsvorgänge:

- Der Ausgang eines Fußballspiels, der Kurs einer Aktie am nächsten Tag oder die realisierte Augenzahl eines Würfelwurfes.


## Grundlegende Begriffe
\framesubtitle{Zufallsvorgang, Zufallsexperiment}
 
 
- Ist ein Zufallsvorgang unverändert beliebig oft wiederholbar, liegt ein \hil{Zufallsexperiment} vor. Die unveränderte Wiederholbarkeit beschreibt man auch als unter gleichen (Rand-)Bedingungen wiederholbar.
- D.h., dass die Randbedingungen wie bei naturwissenschaftlichen Experimenten kontrolliert werden können. Dies stellt sicher, dass die Bedingungen, unter denen das Experiment stattgefunden hat, auch bei weiteren Durchführungen hätten eingehalten werden können.
- Damit gehören alle Zufallsvorgänge, die fiktiv unter gleichen Bedingungen wiederholbar sind, zu den Zufallsexperimenten. Dies erlaubt es, auch Zufallsvorgänge als Zufallsexperimente aufzufassen, deren praktische Wiederholung unter gleichen Bedingungen schwierig wäre.
 


## Grundlegende Begriffe
\framesubtitle{Zufallsvorgang, Zufallsexperiment, Stichprobenraum}

- Alle Ausgänge $\omega_i$ eines Zufallsvorganges bzw. -experimentes fasst man zu einem \hil{Stichprobenraum} (Ergebnis- bzw. Ereignisraum) $\Omega$ zusammen. Der Stichprobenraum ist eine Menge, deren Elemente die Ausgänge sind.
- $\Omega$ kann endlich oder unendlich viele Ausgänge enthalten. Lassen sich die unendlich vielen Ausgänge mit den natürlichen Zahlen $\mathbb{N}$ abzählen, bezeichnet man $\Omega$ als \hil{abzählbar unendlich}. Gelingt dies nicht, heißt $\Omega$ \hil{überabzählbar unendlich}.

\[\Omega=\{\omega_1,\ldots,\omega_m,\ldots\}.\]


## Grundlegende Begriffe
\framesubtitle{Zufallsvorgang, Zufallsexperiment, Stichprobenraum}
\xmpl[Würfelwurf]
Der Zufallsvorgang *Werfen eines Würfels* hat sechs mögliche Ausgänge.

$\Omega$ ist endlich und lässt sich schreiben als:
   \[ \Omega=\{\omega_1,\omega_2,\ldots,\omega_6\}=\{\omega_i,i=1,\ldots,6\} =\{1,2,3,4,5,6\}. \]
\endxmpl



## Grundlegende Begriffe
\framesubtitle{Zufallsvorgang, Zufallsexperiment, Stichprobenraum}
\xmpl[Münzwurf]
Wirft man eine Münze mit Seiten *Zahl* $(Z)$ und *Kopf* $(K)$ bis zum ersten Mal $Z$ erscheint, lauten die möglichen Ausgänge:
\begin{alignat*}{2}
\omega_1&=Z&\qquad &\text{(zum ersten Mal \textit{Zahl} im ersten Wurf),}\\
\omega_2&=KZ&\qquad &\text{(zum ersten Mal \textit{Zahl} im zweiten Wurf),}\\
\vdots&&\qquad&\\
\omega_m&=\underset{m-1}{\underbrace{K\ldots K}}Z&\qquad &\text{(zum ersten Mal \textit{Zahl} im $m$--ten Wurf),}\\
\vdots&&\qquad&
\end{alignat*}
Der Stichprobenraum ist hier abzählbar unendlich:
\vspace{-0.75em}
\[\Omega=\{\omega_1,\ldots\omega_m,\ldots\}\,.\]
\endxmpl





## Grundlegende Begriffe
\framesubtitle{Zufallsvorgang, Zufallsexperiment, Stichprobenraum}
\xmpl[Zugverspätung]
Die Verspätung eines Zuges in Minuten sei ein Zufallsvorgang mit Ausgängen im Intervall $[0; 10]$. Bei unendlicher Messgenauigkeit sind überabzählbar viele Verspätungen möglich, da das Intervall $[0; 10]$ Teilmenge der reellen Zahlen $\mathbb{R}$ ist.


Die reellen Zahlen sind, wie auch jede ihrer Teilmengen, mächtiger als $\mathbb{N}$ und daher überabzählbar unendlich.
\endxmpl



## Grundlegende Begriffe
\framesubtitle{Ereignisse}

- Jede Teilmenge von $\Omega$ heißt \hil{(Zufalls--)Ereignis}.
- Da eine Menge auch Teilmenge von sich selbst und die leere Menge $\emptyset$ Teilmenge jeder Menge ist, sind $\Omega$ und $\emptyset$ selbst Ereignisse von $\Omega$.
- Ein Ereignis $A \subset \Omega$ tritt ein, wenn der Ausgang $\omega_i$ des Zufallsvorgangs Element von $A$ ist: $\omega_i\in A$.
- Da ein Zufallsvorgang immer in einem Ausgang $\omega_i\in\Omega$ mündet, ist $\Omega$ auch das \hil{sichere Ereignis}.
- Analog hierzu heißt die leere Menge $\emptyset$ das \hil{unmögliche Ereignis}, weil kein $\omega_i\in\Omega$ existiert, das Element der leeren Menge $\emptyset$ ist: $\omega_i\notin \emptyset, i=1,\ldots,m$.




## Grundlegende Begriffe
\framesubtitle{Ereignisse}

- Teilmengen $\{\omega_i\}$, deren einziges Element ein Ausgang $\omega_i\in\Omega$ ist, heißen \hil{Elementarereignisse}.
- Umfassen Teilmengen mehrere Ausgänge, nennt man sie \hil{zusammengesetzte Ereignisse}.
- Z.\nbs B. ist beim *\blue{Wurf eines Würfels}* der Ausgang: *\blue{Augenzahl 3 liegt oben}* ein Elementarereignis und wird geschrieben als $\{3\}$; das Ereignis $A$: *\blue{gerade Augenzahl liegt oben}* ist ein zusammengesetztes Ereignis, als Menge geschrieben: $\{2,4,6\}$.
- $A$ tritt ein, wenn der Würfelwurf die Augenzahl 2, 4 oder 6 ergibt.




## Grundlegende Begriffe
\framesubtitle{Ereignisse}

- Die insgesamt möglichen Ereignisse eines Zufallsvorgangs findet man, indem alle Teilmengen für $\Omega$ gebildet werden.
- Die Zusammenfassung dieser Teilmengen führt bei endlichem oder abzählbar unendlichem Stichprobenraum $\Omega$ zur \hil{Potenzmenge} $PM(\Omega)$.
- Die Anzahl der Ereignisse der Potenzmenge ist $2^m$, wobei m der Anzahl der Elemente von $\Omega$ entspricht.
- Siehe Buch, S.\nbs 11.




## Grundlegende Begriffe
\framesubtitle{Ereignisse}
\xmpl[Potenzmenge]\label{xmpl:potenz}
Ein Zufallsvorgang hat den Stichprobenraum $\Omega=\{1,2,3\}$; wegen $m=3$ beträgt die Anzahl der möglichen Ereignisse \[2^3=8.\] Diese Ereignisse lauten $A_1=\emptyset$, $A_2=\{1\}$,
$A_3=\{2\}$, $A_4=\{3\}$, $A_5=\{1,2\}$, $A_6=\{1,3\}$,
$A_7=\{2,3\}$, $A_8=\{1,2,3\}=\Omega$. Die Potenzmenge ist \[PM(\Omega)=\{A_1,\ldots,A_8\}.\]
\endxmpl


## Grundlegende Begriffe
\framesubtitle{Vereinigungsereignis}

- Zwischen den Ereignissen können bestimmte Beziehungen vorliegen. 
- \blue{Beispiel:} Das Ereignis $A_5 =\{1,2\}$ tritt dann ein, wenn entweder $A_2=\{1\}$ oder $A_3=\{2\}$ eintritt. $A_5$ heißt daher \hil{Vereinigungsereignis}, geschrieben als $A_5 = A_2\cup A_3$.
- Verallgemeinert erhält man Vereinigungsereignisse $V$ als $V=\bigcup^n_{j=1}A_j$.
- Für $n=2$ ist $V$ als rote Fläche im \hil{Venn--Diagramm} wiedergegeben, wobei das Rechteck den Stichprobenraum $\Omega$ festlegt.

\vspace{-0.5cm}


\footnotesize
\begin{center}\includegraphics{Resources/Plots/Vereinigung-1} \end{center}
\normalsize


## Grundlegende Begriffe
\framesubtitle{Durchschnittsereignis}

- Ist der Schnitt zweier Ereignisse $A_i$ und $A_j$ nicht leer, gilt $A_i\cap A_j=D\neq\emptyset$, so treten mit $D$ auch die Ereignisse $A_i$ und $A_j$ ein.
- $D$ heißt daher \hil{Durchschnittsereignis}, das allgemein definiert ist als $D=\bigcap_{j=1}^n A_j$. $D$ tritt ein, wenn alle $A_j$ eintreten.

\vspace{-0.5cm}


\footnotesize
\begin{center}\includegraphics{Resources/Plots/Durchschnitt-1} \end{center}
\normalsize



## Grundlegende Begriffe
\framesubtitle{Komplementärereignis}

- Tritt $A_i$ genau dann ein, wenn $A_j$ nicht eintritt, so sind die beiden Ereignisse zueinander komplementär.
- $A_i$ heißt \hil{Komplementärereignis} oder kurz Komplement und lässt sich schreiben als $A_i=\bar{A}_j$. Natürlich ist auch $A_j$ Komplementärereignis zu $A_i$: $A_j = \bar{A}_i$.
- Im Beispiel \ref{xmpl:potenz} ist das Ereignis $A_2=\{1\}$ das Komplement zu $A_7 =\{2,3\}:A_2=\bar{A}_7.$ Umgekehrt gilt auch $A_7=\bar{A}_2$.
- Für $A$ und sein Komplement $\bar{A}$ gelten $A \cup \bar{A} = \Omega$ und $A \cap \bar{A} = \emptyset$.

<!-- \vspace{-0.5cm} -->


\footnotesize
\begin{center}\includegraphics{Resources/Plots/Komplementaerereignis-1} \end{center}
\normalsize



## Grundlegende Begriffe
\framesubtitle{Teilereignisse und disjunkte Ereignisse}

- $A_i$ und $A_j$ heißen \hil{disjunkt}, wenn ihr Schnitt leer ist: $A_i\cap A_j =\emptyset$.
- Komplementäre Ereignisse sind daher immer auch disjunkt, die Umkehrung gilt aber nicht.
- So sind im Beispiel \ref{xmpl:potenz} $A_2=\{1\}$ und $A_3 = \{2\}$ zwar disjunkt, aber nicht komplementär. Denn wenn $A_3$ nicht eintritt, folgt nicht notwendigerweise das Eintreten von $A_2$; es könnte auch $A_4=\{3\}$ eintreten.


\footnotesize
\begin{center}\includegraphics{Resources/Plots/Disjunkt-1} \end{center}
\normalsize



## Grundlegende Begriffe
\framesubtitle{Teilereignisse und disjunkte Ereignisse}

- $A_i$ ist ein \hil{Teilereignis} von $A_j$, wenn jeder Ausgang eines Zufallsvorgangs, der zu $A_i$ gehört, auch in $A_j$ liegt, $A_j$ aber mindestens einen Ausgang $\omega_j$ enthält, der nicht auch in $A_i$ enthalten ist.
- $A_i$ ist eine \hil{echte Teilmenge} von $A_j:$ $A_i\subset A_j$.
- In der Abbildung repräsentieren die Kreise die Ereignisse $A_2$, $A_3$ und $A_6$ des Beispiels \ref{xmpl:potenz}.




## Grundlegende Begriffe
\framesubtitle{Differenzereignis}

- Das \hil{Differenzereignis} $A_i\setminus A_j$ tritt dann ein, wenn der Ausgang des Zufallsvorgangs in $A_i$, aber nicht in $A_j$ liegt.
- Man nennt $A_i\setminus A_j$ auch das \hil{relative Komplement} zu $A_j$ bezüglich $A_i$. Alternativ kann man schreiben $A_i\setminus A_j=A_i\cap\bar{A}_j$. Im Beispiel \ref{xmpl:potenz} folgt für $A_6 = \{1,3\}$ und $A_5 = \{1,2\}$ das Differenzereignis $A_6\setminus A_5$ als
    \[A_6\setminus A_5 = A_6\cap\bar{A}_5 = \{1,3\}\cap\{3\}=\{3\}.\]
    Nur $\omega_3=3$ führt dazu, dass $A_6\setminus A_5$ eintritt. Das Beispiel zeigt, dass im Allgemeinen $A_i\setminus A_j \neq A_j\setminus A_i$.

\vspace{-0.75em}

\footnotesize
\begin{center}\includegraphics{Resources/Plots/Differenzmenge-1} \end{center}
\normalsize




## Grundlegende Begriffe
\framesubtitle{Ereignisse - QuizAcademy}

\QuizAcademy{Würfelwurf 1}\endQuizAcademy


## Grundlegende Begriffe
\framesubtitle{Mengen in R}


\footnotesize


``` r
x <- c(1,3,5)
y <- c(2,3,6)

union(x,y)
```

```
## [1] 1 3 5 2 6
```


``` r
intersect(x,y)
```

```
## [1] 3
```


``` r
setdiff(x,y)
```

```
## [1] 1 5
```


``` r
setdiff(y,x)
```

```
## [1] 2 6
```


``` r
setdiff(union(x,y),y) # Komplement von y, wenn Omega = union(x,y)
```

```
## [1] 1 5
```
\normalsize

## Grundlegende Begriffe
\framesubtitle{Mengen in R}


\scriptsize


``` r
rje::powerSet(x)
```

```
## [[1]]
## numeric(0)
## 
## [[2]]
## [1] 1
## 
## [[3]]
## [1] 3
## 
## [[4]]
## [1] 1 3
## 
## [[5]]
## [1] 5
## 
## [[6]]
## [1] 1 5
## 
## [[7]]
## [1] 3 5
## 
## [[8]]
## [1] 1 3 5
```
\normalsize



## Grundlegende Begriffe
\framesubtitle{Ereignisse}

\exe[]
Ein Würfel wird einmal gewürfelt. Es sind folgende Ereignisse definiert:
\begin{gather*}
A_1=\{1,2\},\; A_2=\{3,4\},\; A_3=\{2,4\},\; A_4=\{1,2,3,4\},\\ A_5=\{4\}, A_6=\{3,4,5,6\}, A_7=\{5,6\},\; A_8=\{1,2,4,5\},\\ A_9=\{2,3,6\},\; A_{10}=\{1,4,5\}.
\end{gather*}

Bestimmen Sie folgende Ereignisse und stellen Sie diese jeweils in einem Venn-Diagramm grafisch dar!

\begin{center}
\begin{tabular}{lll}
\blue{(a)} $A_1\cup A_2$ & \blue{(b)} $A_2\cap A_3$ & \blue{(c)} $\bar{A}_1$\\
\blue{(d)} $A_1\cap A_2$ & \blue{(e)} $A_8\cap\bar{A}_9=A_8\setminus A_9$ & \blue{(f)} $A_5\subset A_4$
\end{tabular}
\end{center}

\endexe





## Grundlegende Begriffe
\framesubtitle{Ereignisse}

- Jedes zusammengesetzte Ereignis $A$ kann in disjunkte Teilereignisse $A_j\neq\emptyset$ so zerlegt werden, dass gilt: $A=\bigcup^n_{j=1} A_j$. $A$ ergibt sich jetzt als disjunkte Vereinigung.
- In Beispiel \ref{xmpl:potenz} lässt sich $A_8$ in $A_2=\{1\}$ und $A_7=\{2,3\}$, aber auch in $A_2=\{1\}$, $A_3=\{2\}$ und $A_4=\{3\}$ zerlegen. Beim zweiten Fall wurde $A_8$ in Elementarereignisse zerlegt.
- Die Zerlegung von $A$ in Elementarereignisse heißt \hil{kanonische Darstellung}: Jedes Ereignis ergibt sich eindeutig als Vereinigungsereignis von Elementarereignissen: 

\[A=\bigcup^n_{j=1}\{\omega_j\}.\]



## Grundlegende Begriffe
\framesubtitle{Vollständiges Ereignissystem}


- Da auch $\Omega$ zu den zusammengesetzten Ereignissen gehört, kann es auch in (Teil-)Ereignisse $A_j$ zerlegt werden.
- Die Menge $\{A_1,\ldots,A_n\}$ bildet ein \hil{vollständiges
System von Ereignissen}, wenn für diese Zerlegung gilt:

\begin{align*}
(1) \qquad & \Omega=A_1\cup\ldots\cup A_n=\bigcup^n_{j=1}A_j,\\
(2) \qquad & A_i\cap A_j=\emptyset\quad\text{für  $i\neq j$},\\
(3) \qquad & A_j\neq\emptyset\quad\text{für $j=1,\ldots,n$},
\end{align*}

- Ein vollständiges System wird auch \hil{vollständiges Ereignissystem} bzw. \hil{vollständige Zerlegung} genannt.




## Grundlegende Begriffe
\framesubtitle{Vollständiges Ereignissystem}


\footnotesize
\begin{center}\includegraphics{Resources/Plots/unnamed-chunk-3-1} \end{center}
\normalsize



## Grundlegende Begriffe
\framesubtitle{Vollständiges Ereignissystem}


\exe
Ein Würfel wird einmal gewürfelt. Es sind folgende Ereignisse
definiert:
\begin{gather*}
A_1=\{2,4,6\},\; A_2=\{1,3,5\},\; A_3=\{2\},\\
A_4=\{4,6\},\;A_5=\{1,3\}, A_6=\{5,6\}.
\end{gather*}
Welche der folgenden Mengen bildet ein vollständiges Ereignissystem?

(a) $F_1=\{A_1, A_2\}$
(b) $F_2=\{A_1, A_5, A_6\}$
(c) $F_3=\{A_3, A_4, A_5\}$
(d) $F_4=\{A_2, A_3, A_4\}$

\endexe



## Der Wahrscheinlichkeitsbegriff

- Zufallsvorgänge zeichnen sich dadurch aus, dass ungewiss ist, welches ihrer möglichen Ereignisse eintritt.
- Wahrscheinlichkeiten quantifizieren die Chance des Eintretens eines bestimmten Ereignisses und werden mit $P$ symbolisiert.
- Für ein Ereignis $A\subset\Omega$ gibt $P(A)$ jetzt die \hil{Wahrscheinlichkeit} für das Eintreten von $A$ an.
- $P$ ist also eine Funktion, die Ereignissen reelle Zahlen zuordnet, welche wir als Wahrscheinlichkeit bezeichnen.



## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Wahrscheinlichkeitfunktion und Kolmogoroff-Axiome}

- Die axiomatische Grundlage für Wahrscheinlichkeiten wurde von \hil{Kolmogoroff} entwickelt.
- Auf der Basis dieser Axiomatik lässt sich die Wahrscheinlichkeitsfunktion wie folgt definieren:


\block{Kolmogoroff-Axiome}
\begin{itemize}\tightlist
\leftskip=12pt
\item[(K1)] $P(A)\geq 0$ für alle $A$,
\item[(K2)] $P(\Omega)=1$,
\item[(K3)] $P\left(\bigcup^\infty_{j=1} A_j\right) = P(A_1)+P(A_2)  +\ldots=\sum^\infty_{j=1} P(A_j)$ 
  \begin{itemize}\tightlist
  \leftskip=12pt
    \item[] für alle $A_i$ und $A_j$, die paarweise disjunkt sind: $A_i\cap A_j=\emptyset,$ $i\neq j$.
  \end{itemize}
\end{itemize}
    
\endblock



## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Wahrscheinlichkeitfunktion und Kolmogoroff-Axiome}

\block{Kolmogoroff-Axiome}
\begin{itemize}\tightlist
\leftskip=8pt
\item[(K1)] \hil{Nichtnegativität}: Die Wahrscheinlichkeit $P$ eines Ereignisses $A$ ist stets nichtnegativ.
\item[(K2)] \hil{Normierung} der Wahrscheinlichkeit.
\item[(K3)] \hil{Volladdidivität}: Die Wahrscheinlichkeit für die Vereinigung paarweise disjunkter Ereignisse gleicht der Summe der Einzelwahrscheinlichkeiten.
\end{itemize}
\endblock

Jedes Ereignis $A\subset\Omega$ wird somit durch $P$ in das geschlossene Intervall $[0,1]\subset\mathbb{R}$ abgebildet.
 



## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Rechenregeln}

Aus diesen Axiomen lassen sich folgende Rechenregeln ableiten:

\block{Rechenregeln}
 \begin{itemize}\tightlist\leftskip=12pt
\item[(R1)] $P(A)+P(\bar{A})=1,$
\item[(R2)] $P(A)\leq P(B)$ für $A\subset B$,
\item[(R3)] $P(A_1\cup A_2\cup\ldots\cup A_n)=\sum^n_{j=1}\limits P(A_j)$ (für paarweise disjunkte Ereignisse),
\item[(R4)] $P(A\cup B)=P(A)+P(B)-P(A\cap B)$ (für paarweise nicht disjunkte Ereignisse).
 \end{itemize}
\endblock
Ihre Herleitung findet sich im Buch auf S.\ 23.




## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Rechenregeln - Additionssatz}



\[P(A\cup B)=P(A)+P(B)-\textcolor[RGB]{205,79,57}{P(A\cap B)}\]
 

\footnotesize
\begin{center}\includegraphics{Resources/Plots/unnamed-chunk-4-1} \end{center}
\normalsize
 
- $A$ und $B$ sind nicht disjunkt, da $A\cap B \not=\emptyset$. $A\cap B$ entspricht der roten Fläche.
- $(A\cup B)$ würde mit $P(A)+P(B)$ die Wahrscheinlichkeit für $A\cap B$ doppelt erfassen; folglich muss $P(A\cap B)$ subtrahiert werden.


## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Rechenregeln}

- Der \hil{Additionssatz für disjunkte Ereignisse}
\[P(A_1\cup A_2\cup\ldots\cup A_n)=\sum^n_{j=1}\limits P(A_j)\]
liefert eine Vorschrift für die Wahrscheinlichkeit eines Ereignisses $A=\{\omega_1,\omega_2,\ldots,\omega_n\}$ eines abzählbar unendlichen
   Stichprobenraumes $\Omega$.
- \hil{Elementarereignisse} $\{\omega_j\},$ $j=1,\ldots,n$ sind paarweise disjunkt.





## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Rechenregeln}
\exe[]
Es sind folgende Wahrscheinlichkeiten gegeben: 
\[P(A)=0.4, P(B)=0.7, P(A\cap B)=0.25.\]
Bestimmen Sie die Wahrscheinlichkeiten
\[P(A\cup B),\;P(\bar{B}),\;P(A\cap \bar{B}),\;P(A\cup \bar{B})\]
\endexe
Wir verwenden einen Punkt anstelle eines Kommas als \hil{Dezimaltrennzeichen}, da dies der angloamerikanischen Schreibweise der Programmiersprache \R entspricht.

## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Rechenregeln}
\exe
Ein Würfel wird ein Mal gewürfelt. Wie groß ist die Wahrscheinlichkeit,

a) eine 2 oder eine 3 zu würfeln?
b) eine 2, eine 3 oder eine 4 zu würfeln?
c) eine ungerade Zahl oder eine gerade Zahl zu würfeln?
d) eine Augenzahl kleiner als 4 oder eine gerade Augenzahl zu würfeln?
e) eine Augenzahl kleiner als 4 und eine gerade Augenzahl zu würfeln?

\endexe



## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Rechenregeln}
\exe
In einer Urne befinden sich 20 rote und 30 grüne Kugeln. 5 rote und 10 grüne Kugeln sind mit einer 1 beschriftet.
Wie groß ist die Wahrscheinlichkeit, dass

a) eine gezogene Kugel rot oder mit einer 1 beschriftet ist?
b) eine gezogene Kugel nicht mit einer 1 beschriftet ist?
c) eine rote Kugel gezogen wird und diese nicht mit einer 1 beschriftet ist?
d) eine Kugel gezogen wird, die rot oder nicht mit einer 1 beschriftet ist?

\endexe


## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Wahrscheinlichkeitsinterpretation}

- Mit den \hil{Axiomen von Kolmogoroff} und den Regeln \blue{(R1)} bis \blue{(R4)} sind nur die allgemeinen Eigenschaften der Wahrscheinlichkeiten festgelegt, nicht jedoch welche Werte sie bei bestimmten Ereignissen annehmen.
- Hierzu muss eine dem Zufallsvorgang adäquate \hil{Wahrscheinlichkeitsinterpretation} vorliegen.


Mit dem subjektiven und statistisch/frequentistischen Wahrscheinlichkeitsbegriff befasst sich das Buch auf S.\ 25.



## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Objektive Wahrscheinlichkeit}

\begin{center}
\begin{tikzpicture}
\node[box] (a) {Objektive\\Wahrscheinlichkeitsinterpretation};
\node[box ,below of=a, xshift=-2cm, yshift=-1cm] (b) {a priori};
\node[box, below of=a, xshift=2cm, yshift=-0.5cm] (c) {statistisch\\frequentistisch};
\node[box, below of=b, xshift=-1.5cm, yshift=-0.25cm] (d) {klassisch\\(Laplace)};
\node[box, below of=b, xshift=1.5cm] (e) {geometrisch};
\draw[arrow] (a) to (b);
\draw[arrow] (a) to (c);
\draw[arrow] (b) to (d);
\draw[arrow] (b) to (e);
\end{tikzpicture}
\end{center}



## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Objektive Wahrscheinlichkeit}

\exe
Student Paul kommt jeden Morgen zwischen 8.00 und 8.30 Uhr an einer Bushaltestelle an, an der zwei Buslinien halten:
\begin{gather*}
\text{Linie A:}\quad 8.04, 8.14, 8.24 \\ 
\text{Linie B:}\quad 8.10, 8.20, 8.30.
\end{gather*}
Wie groß ist die Wahrscheinlichkeit, dass er Linie A nimmt?
\endexe



## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Objektive Wahrscheinlichkeit}

- \hil{a-priori}:
  - \hil{Laplace- (bzw. klassische) Wahrscheinlichkeit}: Anwendung bei Zufallsvorgängen mit endlichem $\Omega$ und deren Elementarereignisse die gleiche Eintrittswahrscheinlichkeit besitzen (\hil{Laplace-Experimente}).
 
  - Laplace-Experimente können als die zufällige Entnahme aus einer endlichen Menge von Objekten charakterisiert werden. Wird mehrfach gezogen, muss zwischen *Ziehen mit Zurücklegen* oder *Ziehen ohne Zurücklegen* unterschieden werden.




## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Laplace-Wahrscheinlichkeit}

\block{Laplace-Wahrscheinlichkeit}
  Die Wahrscheinlichkeit für ein Elementarereignis $\{\omega_i\},$ $i=1,\ldots,m$ beträgt dann $P(\{\omega_i\})=\frac{1}{m}$.\mps

$P(A)$ erhält man als
  \[
  P(A)=\dfrac{\text{Anzahl der für $A$ günstigen Ausgänge}}{\text{Anzahl der möglichen Ausgänge}}.
  \]
  Die Anzahl der Elemente einer Menge $M$ heißt \hil{Mächtigkeit} $|M|$. Die Laplace-Wahrscheinlichkeit ist dann
  \[P(A)=\frac{|A|}{|\Omega|}.\]
\endblock




## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Laplace-Wahrscheinlichkeit - QuizAcademy}

\QuizAcademy{Würfelwurf 2}\endQuizAcademy



## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Laplace-Wahrscheinlichkeit}
\exe[Laplace-Experimente]

(a) In einer Urne befinden sich 20 Kugeln, von denen 8 rot sind. Berechnen Sie die Wahrscheinlichkeit eine rote Kugel bei einer zufälligen Entnahme zu erhalten.
(b) Wie groß ist die Wahrscheinlichkeit, nach Ziehen einer roten Kugel ohne Zurücklegen im zweiten Zug erneut eine rote Kugel zu ziehen?
(c) Ein \hil{Laplace-Würfel} (idealer Würfel) wird geworfen. Berechnen Sie die Wahrscheinlichkeit, dass eine Augenzahl größer als 2 oben liegt.
 
\endexe



## Der Wahrscheinlichkeitsbegriff
\framesubtitle{Laplace-Wahrscheinlichkeit}
\exe[]
Ein Laplace-Würfel wird einmal geworfen. Wie groß ist die Wahrscheinlichkeit, dass eine Augenzahl kleiner 3 fällt?
\endexe
\exe[]
Eine Laplace-Münze und ein Laplace-Würfel werden gemeinsam geworfen. Wie groß ist die Wahrscheinlichkeit, dass Kopf und eine Augenzahl größer als 4 fällt?
\endexe




## Bedingte Wahrscheinlichkeit
\framesubtitle{Änderung des Stichprobenraums}
\vspace{0.5cm}

- Die Berechnung von Wahrscheinlichkeiten erfolgt bislang unter Bezug auf den ganzen Stichprobenraum $\Omega$.
- Es lassen sich aber auch dann Wahrscheinlichkeiten für $A$ berechnen, wenn nicht ganz $\Omega$, sondern nur noch ein Teil $B$ davon relevant ist. Die Abbildung verdeutlicht die Veränderung des Bezugssystems.
 
\vspace{-.5cm}


\footnotesize
\begin{center}\includegraphics{Resources/Plots/BedingteWkeit-1} \end{center}
\normalsize




## Bedingte Wahrscheinlichkeit
\framesubtitle{Änderung des Stichprobenraums}

- Der Kreis entspricht $A$, das untere Rechteck $B$ und das rote Kreissegment $A\cap B$.
- $P(A)$, $P(B)$ und $P(A\cap B)$ sind die Wahrscheinlichkeiten für $A$, $B$ und $A\cap B$, wenn $\Omega$ zugrunde liegt.
- Es kann aber auch die Wahrscheinlichkeit für $A$ unter der Bedingung berechnet werden, dass nur noch die Ausgänge in $B$ relevant sind.
- Diese \hil{bedingte Wahrscheinlichkeit} wird mit $P(A|B)$ bezeichnet.
- In der Abbildung ist $P(A)$ das Verhältnis der Kreisfläche zur Fläche des Rechtecks $\Omega$; die bedingte Wahrscheinlichkeit $P(A|B)$ jedoch das Verhältnis der roten Fläche zur Fläche des Rechtecks $B$.




## Bedingte Wahrscheinlichkeit
\framesubtitle{Formel}

\begin{block}{Bedingte Wahrscheinlichkeit}
 Es seien $A$, $B\subset\Omega$ Ereignisse
 und %$(\Omega, A, P)$ der Wahrscheinlichkeitsraum,
 $P(B) > 0$. Für die \hil{bedingte Wahrscheinlichkeit} $P(A|B)$ gilt \[ P(A|B) = \frac{P(A\cap B)}{P(B)}. \]
\end{block}





## Bedingte Wahrscheinlichkeit
\framesubtitle{Beispiele}

\xmpl[Idealer Würfel]
Ein idealer Würfel wird geworfen. Also sind $\Omega =\{1,2,\ldots,6\}$ und $P(\{\omega_i\}) = 1/6$ für $i=1,\ldots,6$.
\medskip

$A$ ist das Ereignis, eine *1* zu würfeln; $B$ das Ereignis einer ungeraden Augenzahl. $A\cap B$ tritt bei einer *1* ein. Die Wahrscheinlichkeiten betragen $P(A) = 1/6,$ $P(B) = 1/2$ und $P(A\cap B) = 1/6$.
\medskip

Was ist nun die Wahrscheinlichkeit einer *1* unter der Bedingung, dass eine ungerade Augenzahl eintritt? Der durch die Bedingung gegebene Stichprobenraum lautet $B = \{1,3,5\}$, also gilt $P(A|B)=1/3.$
\medskip

Denselben Wert erhält man nach der eingeführten Definition:
\[ P(A|B) = \frac{P(A\cap B)}{P(B)} = \frac{\frac{1}{6}}{\frac{1}{2}}=\frac{1}{3}.\]
\endxmpl




## Bedingte Wahrscheinlichkeit
\framesubtitle{Aufgaben}
\exe
Nach der achtmaligen Durchführung des Zufallsexperiments *zweimaliges Werfen einer Münze* erhält man folgendes Resultat:
\begin{center}
\begin{tabular}{l|cccccccc}
Versuch & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8\\ \hline
1. Wurf & K & Z & Z & Z & K & Z & Z & K\\
2. Wurf & Z & Z & K & K & K & Z & K & Z
\end{tabular}
\end{center}
Ereignis $A$: K beim 1. Wurf,\quad Ereignis $B$: K beim 2. Wurf

Berechnen Sie folgende Wahrscheinlichkeiten:

\begin{center}
\begin{tabular}{lll}
\blue{(a)} $P(A)$   & \blue{(b)} $P(B)$   & \blue{(c)} $P(A\cap B)$\\
\blue{(d)} $P(A|B)$ & \blue{(e)} $P(B|A)$ & \\
\end{tabular}
\end{center}
\endexe



## Bedingte Wahrscheinlichkeit
\framesubtitle{Aufgaben}
\exe
In einem Dorf leben 1000 Personen. Es ist bekannt, dass 600 Einwohner nach Mallorca in den Urlaub fahren und dass 500 Einwohner die Bild--Zeitung lesen.
Zusätzlich weiß man, dass von den 600 Mallorca--Urlaubern 400 die Bild lesen.
Wie groß ist die Wahrscheinlichkeit, dass

(a) eine Person Mallorca--Urlauber ist,
(b) eine Person Bild--Zeitung--Leser ist,
(c) eine Person Mallorca--Urlauber und Bild--Zeitung--Leser ist,
(d) wenn ein Einwohner Bild--Zeitung liest, dieser auch ein Mallorca--Urlauber ist,
(e) wenn ein Einwohner Mallorca--Urlauber ist, dieser auch Bild--Zeitung liest?

\endexe



## Bedingte Wahrscheinlichkeit
\framesubtitle{Paarweise stochastische Unabhängigkeit}

- $P(A|B)$ lässt sich als die Wahrscheinlichkeit von $A$ unter der zusätzlichen Information interpretieren, dass $B$ bereits eingetreten ist.
- Übt diese Information keinen Einfluss auf die Wahrscheinlichkeit von $A$ aus, gilt $P(A|B)=P(A)$.
- $A$ ist dann \hil{unabhängig} von $B$.
- Dann ist aber auch $B$ unabhängig von $A$, wie folgende Umformung zeigt:
\begin{align*}
  P(B|A) & = \frac{P(A\cap B)}{P(A)}=\frac{P(A|B)P(B)}{P(A)} \\
 & = \frac{P(A)P(B)}{P(A)}=P(B)\;\;\; (\text{wegen }P(A|B)=P(A)).
\end{align*}


