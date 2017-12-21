#!/bin/sh

if test -z "$JENKINS_URL"; then
  echo "JENKINS_URL environment variable is required"
  echo "  Example: -e JENKINS_URL=https://jenkins.nesteggs.ca/computer/meteor-ubuntu/slave-agent.jnlp"
  exit 1
else

if test -z "$JENKINS_SECRET"; then
  echo "JENKINS_URL environment variable is required"
  echo "  Example: -e JENKINS_SECRET=3a0004de392a96e0172a592b8b227c3046ae9ae049648227ffe9f5b74907cb12"
  exit 1
else

java -jar /usr/share/jenkins/agent.jar \
  -jnlpUrl $JENKINS_URL \
  -secret $JENKINS_SECRET \
  -workDir "/work/kenkins"
