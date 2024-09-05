How to configure container proxy

1. get host ip

```shell
ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'
```

On my mac, the host ip is `192.168.0.105`.

2. update environment variable

```shell
sudo vim /etc/environment
```

add following content:

```
no_proxy=localhost,127.0.0.1
http_proxy=http://192.168.0.105:7890
https_proxy=http://192.168.0.105:7890
all_proxy=socks5://192.168.0.105:7890

NO_PROXY=localhost,127.0.0.1
HTTP_PROXY=http://192.168.0.105:7890
HTTPS_PROXY=http://192.168.0.105:7890
ALL_PROXY=socks5://192.168.0.105:7890
```

3. update apt proxy

```shell
sudo vim /etc/apt/apt.conf.d/proxy.conf
```

add following content:

```conf
Acquire::http::Proxy "http://192.168.0.105:7890";
Acquire::https::Proxy "http://192.168.0.105:7890";
```

4. apply change

```shell
sudo systemctl restart systemd-networkd
source /etc/environment
sudo apt update
```

5 config DNS

```shell
sudo vim /etc/resolv.conf
```

add following content:

```
nameserver 1.1.1.1
nameserver 8.8.8.8
```

6. test

```shell
ping 8.8.8.8
```
