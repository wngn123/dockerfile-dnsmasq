# Dockerfile Dnsmasq

执行 `build-dnsmasq-conf.sh`，在当前路经下生成 Dnsmasq 的初始配置文件。

- `sh build-dnsmasq-conf.sh`

- `tree dnsmasq`

``` 
dnsmasq
├── conf.d
│   ├── dnsmasq.address.conf
│   ├── dnsmasq.custom.conf
│   └── dnsmasq.server.conf
├── dnsmasq.conf
├── dnsmasq.hosts.conf
└── dnsmasq.resolv.conf
```

将 dnsmasq 目录文件打包。

- `tar zcvf dnsmasq-conf.tar.gz dnsmasq`

使用 Docker 构建 Dnsmasq 镜像。

```
docker build -t dnsmasq:latest -f Dockerfile .
```

查看 alpine 版本

- `cat /etc/alpine-release`
- - 3.17.0

查看 dnsmasq 版本

- `dnsmasq -v`
- - 2.87

重新构建或者tag下

- `docker build -t dnsmasq:latest -t dnsmasq:3.17.0-2.87 -f Dockerfile .`
- `docker tag dnsmasq:latest dnsmasq:3.17.0-2.87`


推送到镜像仓库

- `docker push dnsmasq:latest`
- `docker push dnsmasq:3.17.0-2.87`