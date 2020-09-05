# Hello world
v1.0:
	javac App.java
	java App

# Hello world with target and classpath
v1.1:
	javac -d target App.java
	java -cp "target:." App
