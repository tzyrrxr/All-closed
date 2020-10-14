;comment definition
:?:usecomment.::
	sendInput, {raw}\long\def\/*#1*/{} `%definition comment
	;sendInput, %text%
	return
;;;;;;;;;;;;;;;;;use package;;;;;;;;;;;;;;;;;;;;;;;;;;;
;beamer
:?:beamer.::
	sendinput, {raw}\documentclass{beamer}
	return
;article
:?:article.::
	sendinput, {raw}\documentclass{article}
	return
;math notation
:?:usemath.::
	sendinput, {raw}\usepackage{amssymb,amsmath,stmaryrd} `%math package
	return
;image
:?:useimage.::
	sendinput, {raw}\graphicspath{{./}} `%insert {} to multiple folders
	return

;;;;;;;use latex math $$
:?:mt.::
	sendinput, {raw}$
	send, {enter}
	sendinput, {raw}$
	send, {up}
	send, {enter}
	return
;;;;;;;;;;;;;;;;comment;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; :?:test:: question mark >> the hotstring will be triggered even when it is inside another word.
;;;;;;;;;;;;; frame ;;;;;;;;;;;;;;;;;;;;;;
:?:frame.::
	sendinput, {raw}\begin{frame}`n\end{frame}
	return
:?:frametitle.::
	sendinput, {raw}\frametitle{}
	send, {left}
	return
;;;;;;;;;;;;;; image ;;;;;;;;;;;;;;;;;;;;
:?:insertimage::
	sendinput, {raw}\/*[] > parameters, {} > image name*/`n
	sendinput, {raw}\includegraphics[]{} 
	return
;;;;;;;;;;;;; tabular ;;;;;;;;;;;;;;;;;;;;
:?:tr.::
	;comment
	sendinput, {raw}\/****table****/`n
	sendinput, {raw}\begin{tabular}{ccc}`n\end{tabular}
	return
;;;;;;;;;;;;;;notation;;;;;;;;;;;;;;;;;;;;;;;
;negative
:?:neg.::
	sendinput, {raw}\/*¬(negative)*/\neg 
	send, {space}
	return
;if..., then...
:?:ifthen.::
	sendinput, {raw}\/*→(if..., then...)*/\to 
	send, {space}
	return
;if and only if
:?:iff.::
	sendinput, {raw}\/*↔(biconditional)(if and only if)*/\leftrightarrow
	send, {space}
	return
;conjunction, disjunction
:?:conjunc.::
	sendinput, {raw}\/*∧(conjunction)(and)*/\wedge
	send, {space}
	return
:?:disjunc.::
	sendinput, {raw}\/*∨(disjunction)(or)*/\vee
	send, {space}
	return
;xor
:?:xor.::
	sendinput, {raw}\/*⊕(xor)*/\oplus
	send, {space}
	return
;logically equivaient
:?:logiequ.::
	sendinput, {raw}\/*≡(logically equivaient)*/\equiv
	send, {space}
	return
;exists and forall
:?:exists.::
	sendinput, {raw}\/*∃(exists)*/\exists
	send, {space}
	return
:?:forall.::
	sendinput, {raw}\/*∀(forall)*/\forall
	send, {space}
	return
:?:notexist.::
	sendinput, {raw}\/*¬∃(not exists)*/\nexists
	send, {space}
	return
;condition
:?:conditional..::
	sendinput, {raw}\/*->(conditional to)*/\rightarrow
	send, {space}
	return
;bicondition.::
:?:biconditional.::
	sendinput, {raw}\/*↔(biconditional)*/\leftrightarrow
	send, {space}
	return
;not equal to
:?:notequ.::
	sendInput, {raw}\/*!=(not equal)*/\neq
	send, {space}
	return
;less equal, greater equal
:?:lessequ.::
	sendInput, {raw}\/*≤(less equal)*/\leq
	send, {space}
	return
:?:greatequ.::
	sendInput, {raw}\/*≥(great equal)*/\geq
	send, {space}
	return
;suset
:?:subsetequof.::
	sendInput, {raw}\/*⊆(is a subset of)*/\subseteq
	send, {space}
	return
:?:notsubsetequ.::
	sendInput, {raw}\/*!⊆(is not a subset of)*/\nsubseteq
	send, {space}
	return
:?:subsetof.::
	sendInput, {raw}\/*⊂(is a proper subset of)*/\subset
	send, {space}
	return
;/*
:?:notsubset.::
	sendInput, {raw}\/*⊂(is not a proper subset of)*/\not\subset
	send, {space}
	return
*/


;because therefore
:?:because.::
	sendInput, {raw}\/*∵(because)*/\because
	return
:?:therefore.::
	sendInput, {raw}\/*∴(therefore)*/\therefore
	return
;line
:?:line..::
	sendInput, {raw}\/*line{cm}{pt}*/\rule{}{}
	sendInput, {raw}\\
	return
;belong / in
:?:belongto.::
	sendInput, {raw}\/*∈(belong)(is member of)*/\in
	send, {space}
	return
:?:notbelong.::
	sendInput, {raw}\/*!∈(not belong)(is not member of)*/\notin
	send, {space}
	return
	
;dots
:?:dots.::
	sendInput, {raw}\/*...(dots)*/\cdots
	send, {space}
	return
:?:vdot.::
	sendInput, {raw}\/*!...(vertical dots)*/\vdots
	send, {space}
	return
:?:dot.::
	sendInput, {raw}\/*.(dot)*/\cdot
	send, {space}
	return
;infinity
:?:infinity..::
	sendinput, {raw}\/*(infinity)*/\infty
	send, {space}
	return
;sumaation
:?:sumation.::
	sendinput, {raw}\/*(sumation)*/\sum_{}^{}
	send, {space}
	send, {left 5}
	return
;limits
:?:limits.::
	sendinput, {raw}\/*(limits)*/\lim_{}
	send, {space}
	send, {left 2}
	return
;function
:?:function..::
	sendinput, {raw}\/********** function ************/`n
	sendinput, {raw}\begin{cases}`n
	sendinput, {raw}\text{}\\`n
	sendinput, {raw}\end{cases}
	send, {up}
	send, {left}
	return
;emptyset
:?:emptyset..::
	sendinput, {raw}\/*(empty set)*/\emptyset
	send, {space}
	return
;overset
:?:overset..::
	sendinput, {raw}\/*first bracket overset second one(overset)*/\overset{}{}
	return
;====================================================
;====================================================
;====================== set =========================
;===========exampel to union=========================
;====================================================
;====================================================
;power set
:?:PowerSet.::
	sendInput, {raw}\/*P()(power set)*/\mathcal{P}()
	send, {space}
	return
;set intersection
:?:SetIntersection.::
	sendInput, {raw}\/*∩(set intersection)*/\cap
	send, {space}
	return
;set union
:?:SetUnion.::
	sendInput, {raw}\/*∪(set union)*/\cup
	send, {space}
	return

;the Boolean powers
:?:BooleanPower.::
	sendInput, {raw}\/*⊙(boolean power)*/\odot
	send, {space}
	return
;epsilon
:?:Epsilon.::
	sendInput, {raw}\/*(Epsilon)*/\epsilon
	send, {space}
	return
;composition of
:?:CompositionOf.::
	sendInput, {raw}\/*◦(composition of)*/\circ
	send, {space}
	return
;matrix
:?:matrix..::
	sendinput, {raw}\/********** matrix *************/`n
	sendinput, {raw}\begin{bmatrix}`n
	sendinput, \/*for instance: 1 & 2 \\*/`n
	sendinput, {raw}\end{bmatrix}
	send, {up}
	return

;determinant
:?:determin..::
	sendinput, {raw}\/********** determinant *************/`n
	sendinput, {raw}\begin{vmatrix}`n
	sendinput, \/*for instance: 1 & 2 \\*/`n
	sendinput, {raw}\end{vmatrix}
	send, {up}
	return
;division
:?:division..::
	sendinput, {raw}\/*a|b(a divides b)*/\mid
	send, {space}
	return
:?:notdiv.::
	sendinput, {raw}\/*a !| b(a does not divide b)*/\nmid
	send, {space}
	return
;====================================================
;====================================================
;=================== example ========================
;====================================================
;====================================================
:?:contraposition;.::
	sendinput, {raw}\/*example*/`n
	sendinput, {raw}\/*  !q -> !p  */
	return
:?:converse;.::
	sendinput, {raw}\/*example*/`n
	sendinput, {raw}\/*  q -> p  */
	return
:?:inverse;.::
	sendinput, {raw}\/*example*/`n
	sendinput, {raw}\/*  !p -> !q  */
	return

