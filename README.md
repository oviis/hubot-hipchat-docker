# hubot-hipchat

Hubot Hipchat bot running out of docker. By default this images sets up a stock,
or close to stock hubot which can be connected to Hipchat.

You can install apps from the Scripts Catalog ( http://hubot-script-catalog.herokuapp.com/ )
By passing in the HUBOT_SCRIPTS_URL environment variable. The URL should point to a valid hubot-scripts.json file.

##  environment variables
# to do changes to the environemnt variable you should change them directly in the Dockerfile and then build a docker image
ENV   HUBOT_HIPCHAT_JID=<hipchat_xamberID>@chat.hipchat.com
ENV   HUBOT_HIPCHAT_PASSWORD=<hipchatPW>
ENV   HUBOT_SCRIPTS_URL=
ENV   HUBOT_PACKAGE_URL=
ENV   GITHUB_REPO=""
ENV   HUBOT_JENKINS_URL="<jenkinsURL>"
ENV   HUBOT_JENKINS_AUTH="user:password"

## Run a basic hubot

```Shell
docker build -t hubot-hipchat .
docker run --name hubot-hipchat hubot-hipchat
```
