#!/usr/bin/env bash

  rm -rf /usr/local/bin/frpc
  rm -rf /usr/local/frpc
	mkdir /usr/local/frpc
	rm -rf /etc/systemd/system/frpc.service

	cp ./frpc /usr/local/frpc/frpc
	cp ./frpc.ini /usr/local/frpc/frpc.ini
  chmod +x /usr/local/frpc/frpc
  ln -s /usr/local/frpc/frpc /usr/local/bin/frpc


    touch /etc/systemd/system/frpc.service
	cat <<EOF > /etc/systemd/system/frpc.service
[Unit]
Description=frpc server
After=network.target
Wants=network.target
[Service]
Type=simple
PIDFile=/var/run/frpc.pid
ExecStart=/usr/local/frpc/frpc -c /usr/local/frpc/frpc.ini
RestartPreventExitStatus=23
Restart=always
User=root
[Install]
WantedBy=multi-user.target
EOF


  systemctl daemon-reload
	systemctl enable frpc >/dev/null 2>&1
	systemctl start frpc
	systemctl restart frpc