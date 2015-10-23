#!/bin/bash

jobName=$1
jenkinsServer=$HUBOT_JENKINS_URL
pwRaw=$HUBOT_JENKINS_AUTH

#proof if GITHUB_REPO is set
if [ "$GITHUB_REPO" == "" || -z "$GITHUB_REPO" ]; then
  GITHUB_REPO=https://github.com/oviis
fi

#proof if HUBOT_JENKINS_AUTH is set and rewrite the URL with the credentials
if [ "$pwRaw" == "" || -z "$pwRaw"  ]; then
  jenkinsHost=$(echo $jenkinsServer | sed 's/^.\{7\}//g')
  jenkinsServer="http://${pwRaw}@${jenkinsHost}"
fi
#proof if the run command have 2 parameter
if [[ $# -lt 1 ]] ; then
  echo -e "\n=== please provide a jenkins Job Name as a 1 parameter, and a jenkinsServer(with portnumber) as a DNS or IP=== \n"
  exit 22
else
  sed -i "s&@@@jobName@@@&${jobName}&g;s&@@@githubRepo@@@&${GITHUB_REPO}&g" /opt/hubot/help-files/template_config.xml
  cat /opt/hubot/help-files/template_config.xml > /opt/hubot/help-files/template_config.xml_sended
  curl -d @/opt/hubot/help-files/template_config.xml --silent --show-error -H 'Content-Type: text/xml' "${jenkinsServer}/createItem?name=${jobName}"
  sed -i "s&$jobName&@@@jobName@@@&g;s&${GITHUB_REPO}&@@@githubRepo@@@g" /opt/hubot/help-files/template_config.xml
fi
exit 0