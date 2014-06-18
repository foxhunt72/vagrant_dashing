#!/bin/bash

apt-get update
apt-get -y upgrade
apt-get -y install ruby1.9.1-dev ruby-bundler nodejs screen
apt-get install ruby1.9.1-full -y
apt-get install build-essential -y
apt-get install nodejs -y

update-alternatives --set ruby /usr/bin/ruby1.9.1
update-alternatives --set gem /usr/bin/gem1.9.1


gem install bundler --no-rdoc --no-ri
gem install dashing --no-rdoc --no-ri

cd /home/vagrant
mkdir dashing
chown vagrant dashing
cd /home/vagrant/dashing
su vagrant -c "dashing new test"
cd /home/vagrant/dashing/test
su vagrant -c "bundle install"

echo starting dashing
echo ""
pwd


cat >/home/vagrant/start.sh <<EOF
#!/bin/bash

# r.devos Amsio 2014

while true
do
	cd /home/vagrant/dashing/test
	killall thin
	dashing start
	sleep 10s
done
EOF

chmod a+x /home/vagrant/start.sh

su - vagrant -c "screen -S dashing -d -m /home/vagrant/start.sh" &

