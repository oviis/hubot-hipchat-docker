# Description:
#  Execute a shell script for creating the jenkins job.
#  This particular example only execute the given shell script with parameter
#
# Dependencies:
#  None
#
# Configuration:
#   HUBOT_JENKINS_URL
#   HUBOT_JENKINS_AUTH
#
#   Auth should be in the "user:password" format.
#
#
# Configuration
#  Change the script if you want to exeute a different command
#
# Commands:
#  hubot jenkins create <jobname>
#
# Author:
# Ovi Isai
#

module.exports = (robot) ->
 robot.respond /jenkins create (.*)$/i, (msg) ->
    jobname = msg.match[1]
    @exec = require('child_process').exec
    url = process.env.HUBOT_JENKINS_URL
    command = "/opt/hubot/shellcmd/create_jenkins_jobs.sh #{jobname}"

    msg.send "will create jenkins job #{jobname} on jenkinsServer: #{url}..."
    msg.send "This is the shell command #{command}"

    @exec command, (error, stdout, stderr) ->
      msg.send error
      msg.send stdout
      msg.send stderr

