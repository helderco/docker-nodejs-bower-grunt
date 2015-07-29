# Node.js w/ Bower &amp; Grunt Dockerfile

## Testing javascript

You can use Node.js to test some javascript (in interactive mode):

    $ docker run -it --rm helder/node
    > [0, 1, 2, 3].slice(0, 2);
    [ 0, 1 ]

## Bower

Add this alias to your profile:

    alias bower='docker run -it --rm -u node -v "$PWD:/data" helder/node bower'

Now you can just use bower from the current directory:

    bower install jquery
