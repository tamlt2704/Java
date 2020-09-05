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
# JUnit version 4.8
# .
# Time: 0.005
#
# OK (1 test)


# Using maven build
# add pom.xml
# delete .lib folder
# move App.java, User.java to src/main/java
# move UserTest.java to src/test/java
# :r !tree .
#
# .
# ├── Makefile
# ├── pom.xml
# ├── src
# │   ├── main
# │   │   └── java
# │   │       ├── App.java
# │   │       └── User.java
# │   └── test
# │       └── java
# │           └── UserTest.java
# └── target
v1.3:
	# clean target folder
	mvn clean

	# test
	mvn test

	# generate jar file
	mvn package

	# show jar content
	# jar tf target/spweb-1.0-SNAPSHOT.jar

	# run App
	java -cp target/spweb-1.0-SNAPSHOT.jar App


v1.4:
	# remove old pom.xml, otherwise maven create project will fail
	rm -f pom.xml
	rm -fr spweb
	# create project
	mvn archetype:generate -DgroupId=io.github.app -DartifactId=spweb -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
	# copy java
	cp src/main/java/*.java spweb/src/main/java/io/github/app/
	cp src/test/java/UserTest.java spweb/src/test/java/io/github/app/
	# mvn test, package
	mvn test package -f spweb/pom.xml
	java -cp spweb/target/spweb-1.0-SNAPSHOT.jar app

# code refactor
v1.5:
	mvn test package -f spweb/pom.xml
	java -cp spweb/target/spweb-1.0-SNAPSHOT.jar io.github.app.App

# turn application to a spring boot
v1.6:
	command -v tmux && (\
		SESSION=$USER &&\
		tmux -2 new-session -d -s $SESSION &&\
		tmux new-window -t $SESSION:1 -n 'v1.6' &&\
		tmux split-window -h &&\
		tmux select-pane -t 0 &&\
		tmux send-keys "mvn spring-boot:run -f spweb/pom.xml" C-m &&\
		tmux select-pane -t 1 &&\
		tmux send-keys "watch curl -s localhost:8080/actuator/health" C-m &&\
		tmux attach -t $SESSION\
	) || (mvn spring-boot:run -f spweb/pom.xml)
