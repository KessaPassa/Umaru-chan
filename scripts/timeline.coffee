# 自分のslackのURL
slack_url = "https://miraikeitai2017.slack.com"

module.exports = (robot) ->
  # どんな文字列があっても拾う
  robot.hear /.+/, (msg) ->
    room = msg.envelope.room
    # idにドットがあるとURLを展開してくれないので取り除く
    id = msg.message.id.replace(".","")

    if room.match(/^times_timeline/)

    # ユーザ名_channelの部屋だけウォッチ対象
    else if room.match(/^times_.+/)
      # 展開可能なURLを作成し、タイムライン表示用の部屋に投稿する
      # roomの指定で、 投稿するchannelを指定
      # 第二引数でslackのパーマネントURLを構築
      robot.send {room: "#times_timeline"}, "#{slack_url}/archives/#{room}/p#{id}"