all:
	cd lexical_analyzer && javac -d ../bin tarea1.java
	cd bin && java lexical_analyzer.tarea1
flex:
	jflex lexical_analyzer/tarea1.flex
