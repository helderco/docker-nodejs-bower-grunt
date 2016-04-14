# Node.js w/ Bower

## Testing javascript

You can use Node.js to test some javascript (in interactive mode):

    $ docker run -it --rm helder/node
    > [0, 1, 2, 3].slice(0, 2);
    [ 0, 1 ]

## Bower

Add this alias to your profile:

    alias bower='docker run -it --rm -v "$PWD:/data" helder/node gosu node bower'

Now you can just use bower from the current directory:

    bower install jquery

## UID mapping

By default, the `node` user's uid and gid will be set to the owner of the current working directory. If you wish to disable this feature, set the environment variable `UNMAP_NODE_UID`.

    $ # run command as node user
    $ docker run -it --rm helder/node gosu node id
    uid=999(node) gid=999(node) groups=999(node)

    $ # see that it is mapping
    $ docker run -it --rm -v $PWD:/data helder/node gosu node id
    uid=1000(node) gid=1000(node) groups=1000(node)

    $ # disable mapping
    $ docker run -it --rm -v $PWD:/data -e UNMAP_NODE_UID= helder/node gosu node id
    uid=999(node) gid=999(node) groups=999(node)

With this mapping, assuming the current working directory is a host volume, now any files generated inside the container (e.g., with gulp or bower), should have the same uid and gid as your host's user.
