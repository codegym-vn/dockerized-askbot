# dockerized-askbot

## how to up

```bash
$ ./build.bash
$ ./up.bash
```

It take a few minutes for first time installing (generate needed tables) and a fews seconds for collecting static files.

and 

## access containers

use _core_, _web_, _db_ as $CONTAINER

```bash
$ ./ssh.bash $CONTAINER
```

## how to init

### create .env file

```bash
$ mv .env.example .env
```
Then edit .env with your configurations

That all you need!