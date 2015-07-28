# Node.js w/ Bower &amp; Grunt Dockerfile

## Bower

Add this alias to your profile:

    alias bower='docker run -it --rm -u node -v "$PWD:/data" helder/node bower'

Now you can just use bower from the current directory:

    bower install jquery
