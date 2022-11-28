rm -rf student-submission
git clone --quiet $1 student-submission 

cp TestListExamples.java student-submission
cp ParseOutput.java student-submission
cd student-submission

if [[ !(-e ListExamples.java)]]
then
    echo "ListExamples.java was not found!"
    echo "Score is 0"
    exit 1
fi
echo "ListExamples.java was found"
CP="-cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"

javac $CP *.java 2>a.txt

if [[ !($? -eq 0) ]]
then
 echo "File failed to compile"
 echo "Score is 0"
 exit 1
fi

echo "File compiled"
OUTPUT=$(java $CP org.junit.runner.JUnitCore TestListExamples)

java ParseOutput $OUTPUT

echo "Score is $?"