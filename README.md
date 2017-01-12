
# bootstrap

## how to run

```
# Download from xenial-server-cloudimg-amd64-vagrant.box  internet

$ vagrant box add --name xenial-server-cloudimg-amd64-vagrant-local /Users/piaoger/workspace/cache/vagrant/boxes/ubuntu/xenial-server-cloudimg-amd64-vagrant.box

$ vagrant init xenial-server-cloudimg-amd64-vagrant-local
$ vagrant up

$ vagrant ssh

$ vagrant halt

```

## run web server

In guest machine:

```
$ vagrant ssh
$ cd /vagrant/play-django/projects/hello
$ python manage.py runserver 0.0.0.0:8000 &
```
On host machine:
```
$ curl http://127.0.0.1:8031/hello
echo
$ curl http://127.0.0.1:8031/user?name=piaoger
{"data": {"age": 18, "name": "piaoger"}, "errcode": -1}
```


## how to cleanup vagrant box

```
$ vagrant destroy
```
