all:
	cd lexical_analyzer && javac -d ../bin Code.java
	cd bin && java lexical_analyzer.Code
flex:
	jflex lexical_analyzer/code.flex
