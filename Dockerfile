##########################################################################
# Dockerfile to build a hubot hipchat within Docker
##########################################################################

###########################################################################################
# Usage:
# Build: docker build -t hubot-hipchat .
# Run: docker run hubot-hipchat
###########################################################################################

FROM tfhartmann/hubot-hipchat

# File Author / Maintainer
## please feel free to ask questions, bring improvements
MAINTAINER Ovi Isai <ovidiu.isai@sixt.com>

ENV   HUBOT_HIPCHAT_JID=<hipchat_xamberID>@chat.hipchat.com
ENV   HUBOT_HIPCHAT_PASSWORD=<hipchatPW>
ENV   HUBOT_SCRIPTS_URL=https://raw.githubusercontent.com/oviis/hubot-scripts/master/scripts/goorange-scripts.json
ENV   HUBOT_PACKAGE_URL=https://raw.githubusercontent.com/oviis/hubot-scripts/master/packages/goorange-packages.json
ENV   GITHUB_REPO="https://github.com/oviis"
ENV   HUBOT_JENKINS_URL="<jenkinsURL>"
#ENV   HUBOT_JENKINS_AUTH="user:password"

#adding helping dirs
RUN mkdir /opt/hubot/help-files
RUN mkdir /opt/hubot/shellcmd

#
COPY scripts/bash/create_jenkins_jobs.sh /opt/hubot/shellcmd/create_jenkins_jobs.sh
RUN chmod +x /opt/hubot/shellcmd/create_jenkins_jobs.sh

#
COPY scripts/bash/template_config.xml /opt/hubot/help-files/template_config.xml
COPY scripts/applause.coffee  /opt/hubot/scripts/applause.coffee
COPY scripts/translate.coffee /opt/hubot/scripts/translate.coffee
COPY scripts/shelljenkinscommand.coffee /opt/hubot/scripts/shelljenkinscommand.coffee

##shellcmd env
#ENV HUBOT_SHELLCMD="/opt/hubot/shellcmd"