#!/usr/bin/env bash
# 设置grafana源
cat <<EOF > /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF

# 安装grafana
yum -y install grafana

# 方法2：直接下载安装包
#wget -c https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.3.0-1.x86_64.rpm
#yum -y install grafana-5.3.0-1.x86_64.rpm

# 启动grafana
systemctl start grafana-server
# 查看服务状态
systemctl status grafana-server
# 设置开机自启
systemctl enable grafana-server



# 访问端口3000，默认用户名：admin，密码：admin
echo "访问端口：3000，默认用户名：admin，密码：admin"
# 插件目录：/var/lib/grafana/plugins
echo "插件目录：/var/lib/grafana/plugins"

# 下载插件
# 参考：https://www.alibabacloud.com/help/zh/doc-detail/109434.htm
git clone https://github.com/aliyun/aliyun-cms-grafana.git  /var/lib/grafana/plugins
# 重启服务
systemctl restart grafana-server

