require 'cgi'
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['goya_give_for']

  "<html>
    <body>
      <p>自家消費ではないgoyaの情報は下記になります</p>
        文字列：#{get}
    </body>
  </html>"
}
