# Assign roles to people you're chatting with
#
# <user> is a badass guitarist - assign a role to a user
# <user> is not a badass guitarist - remove a role from a user
# who is <user> - see what roles a user has
# show users - display the users that hubot knows about
# show storage - display the data that's persisted to redis

# hubot holman is an ego surfer
# hubot holman is not an ego surfer
#

Sys = require "sys"

module.exports = (robot) ->
  robot.respond /who is ([\w.-]+)\?*$/i, (msg) ->
    name = msg.match[1]

    if name == "you"
      msg.send "Who ain't I?"
    else if name == robot.name
      msg.send "The best."
    else if user = robot.userForName name
      user.roles = user.roles or [ ]
      if user.roles.length > 0
        msg.send "#{name} is #{user.roles.join(", ")}."
      else
        msg.send "#{name} is nothing to me."
    else
      msg.send "#{name}? Never heard of 'em"

  robot.respond /show storage$/i, (msg) ->
    output = Sys.inspect(robot.brain.data, false, 4)
    msg.send output

  robot.respond /show users$/i, (msg) ->
    response = ""

    for own key, user of robot.brain.data.users
      response += "#{user.id} #{user.name}"
      response += " <#{user.email_address}>" if user.email_address
      response += "\n"

    msg.send response

  robot.respond /([\w.-]+) is (["'\w: ]+)[.!]*$/i, (msg) ->
    name    = msg.match[1]
    newRole = msg.match[2].trim()

    unless name in ['who', 'what', 'where', 'when', 'why']
      unless newRole.match(/^not\s+/i)
        if user = robot.userForName name
          user.roles = user.roles or [ ]

          if newRole in user.roles
            msg.send "I know"
          else
            user.roles.push(newRole)
            if name.toLowerCase() == robot.name
              msg.send "Ok, I am #{newRole}."
            else
              msg.send "Ok, #{name} is #{newRole}."
        else
          msg.send "I don't know anything about #{name}."

  robot.respond /([\w.-]+) is not (["'\w: ]+)[.!]*$/i, (msg) ->
    name    = msg.match[1]
    newRole = msg.match[2].trim()

    unless name in ['who', 'what', 'where', 'when', 'why']
      if user = robot.userForName name
        user.roles = user.roles or [ ]

        if newRole not in user.roles
          msg.send "I know."
        else
          user.roles = (role for role in user.roles when role != newRole)
          msg.send "Ok, #{name} is no longer #{newRole}."

      else
        msg.send "I don't know anything about #{name}."