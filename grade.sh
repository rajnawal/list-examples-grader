# Create your grading script here

# set -e

rm -rf student-submission
git clone --quiet $1 student-submission 

cp TestListExamples.java student-submission
cp ParseOutput.java student-submission
cd student-submission

if [[ !(-e ListExamples.java)]]
then
    echo "ListExamples.java was not found!"
    exit 1
fi

CP="-cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"

javac $CP *.java

if [[ !($? -eq 0) ]]
then
 echo "File failed to compile"
 exit 1
fi

OUTPUT=$(java $CP org.junit.runner.JUnitCore TestListExamples)

java ParseOutput $OUTPUT

echo "Score was $?"