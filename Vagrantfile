# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vbguest.auto_update = false
  config.vbguest.no_remote   = true

  base_script = <<EOT
    USER="root" \
    LANG="C" \
    LANGUAGE="C" \
    LC_ALL="C"
    echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock \
      && echo 'UTC=false' >> /etc/sysconfig/clock \
      && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
EOT

  script = <<EOT
    yum -y install \
      git \
      tar \
      make \
      patch \
      gcc-4.8.5 \
      gcc-c++-4.8.5 \
      openssl-1.0.1e \
      openssl-devel-1.0.1e \
      libcurl-devel \
      httpd \
      mariadb-devel-5.5.44 \
      mariadb-server-5.5.44 \
      java-1.8.0-openjdk \
    && yum clean all
    systemctl start mariadb.service
    systemctl enable mariadb.service
    systemctl start httpd.service
    systemctl enable httpd.service
    chmod +x -R /vagrant/bin
    chmod 777 -R /var/log/httpd
EOT

  config.vm.box = "bento/centos-7.1"
  config.vm.network "forwarded_port", guest: 5601, host: 5601
  config.vm.network "forwarded_port", guest: 9200, host: 9200
  config.vm.network "forwarded_port", guest: 8091, host: 8091
  config.vm.provision "shell", inline: base_script + script
end