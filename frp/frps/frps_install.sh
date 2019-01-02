#!/usr/bin/env bash

  rm -rf /usr/local/bin/frps
  rm -rf /usr/local/frps
	mkdir /usr/local/frps
	rm -rf /etc/systemd/system/frps.service

	cp ./frps /usr/local/frps/frps
	cp ./frps.ini /usr/local/frps/frps.ini
  chmod +x /usr/local/frps/frps
  ln -s /usr/local/frps/frps /usr/local/bin/frps


    touch /etc/systemd/system/frps.service
	cat <<EOF > /etc/systemd/system/frps.service
[Unit]
Description=frps server
After=network.target
Wants=network.target
[Service]
Type=simple
PIDFile=/var/run/frps.pid
ExecStart=/usr/local/frps/frps -c /usr/local/frps/frps.ini
RestartPreventExitStatus=23
Restart=always
User=root
[Install]
WantedBy=multi-user.target
EOF


  systemctl daemon-reload
	systemctl enable frps >/dev/null 2>&1
	systemctl start frps
	systemctl restart frps