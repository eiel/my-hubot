# Description:
#   Utilitiy commands supporting Idobata
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot room_id - Reply chat room_id

ROOM_ID = process.env.HUBOT_IDOBATA_DEFAULT_ROOM

module.exports = (robot) ->
  robot.send_room = (msg) ->
    @send { message: { data: {room_id: ROOM_ID } } }, msg

  robot.respond /ROOM_ID/i, (msg) ->
    room_id = msg.message.data.room_id
    robot.logger.debug room_id
    msg.send room_id

  robot.router.post "/hubot/circle", (req, res) ->
    robot.send_room "finished build"
