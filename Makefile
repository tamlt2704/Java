# Hello world
v1.0:
	javac App.java
	java App

# Hello world with target and classpath
v1.1:
	javac -d target App.java
	java -cp "target:." App

# Add user and test
# cd lib && curl -O https://repo1.maven.org/maven2/junit/junit/4.8/junit-4.8.jar
# :r !tree . # use this command to generate tree below (in vim)
# .
# ├── App.java
# ├── lib
# │   └── junit-4.8.jar
# ├── Makefile
# ├── target
# │   ├── App.class
# │   ├── User.class
# │   └── UserTest.class
# ├── User.java
# └── UserTest.java

v1.2:
	javac -cp ".:lib/*" -d target *.java
	java -cp ".:lib/*:target" org.junit.runner.JUnitCore UserTest

# expected output
# JUnit version 4.8                                                           |~                                                                                                   
# .                                                                           |~                                                                                                   
# Time: 0.005                                                                 |~                                                                                                   
#                                                                             |~                                                                                                   
# OK (1 test)
