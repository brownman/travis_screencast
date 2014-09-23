travis_screencast
=================

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Video.js Sandbox</title>
   <script src="http://vjs.zencdn.net/4.8.1/video.js"></script>
   <link href="http://vjs.zencdn.net/4.8/video-js.css" rel="stylesheet">
</head>
<body>
  <p style="background-color:#eee; border: 1px solid #777; padding: 10px; font-size: .8em; line-height: 1.5em; font-family: Verdana, sans-serif;">You can use /sandbox/ for writing and testing your own code. Nothing in /sandbox/ will get checked into the repo, except files that end in .example, so please don't edit or add those files. To get started make a copy of index.html.example and rename it to index.html.</p>

  <video id="vid1" class="video-js vjs-default-skin" controls preload="auto" width="1024" height="1280"
      poster="https://raw.githubusercontent.com/brownman/travis_screencast/gh-pages//build/369/media/session.png"
      data-setup='{}'>
      <source src="https://raw.githubusercontent.com/brownman/travis_screencast/gh-pages//build/369/media/session.ogv" type='video/ogg'>
  </video>

  <script>
    vid = document.getElementById("vid1");
  </script>

</body>
</html>
