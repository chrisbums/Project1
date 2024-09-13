#!/bin/bash
yum -y install httpd
systemctl start httpd
systemctl enable httpd
instance_id=$(ec2-metadata -i | cut -d ' ' -f 2)
private_ip=$(ec2-metadata -o | cut -d ' ' -f 2)
az_name=$(ec2-metadata -z | cut -d ' ' -f 2)
cat <<EOF > /var/www/html/index.html
<h1>서울 웹 서버에 오신것을 환영합니다.</h1>
<h3>인스턴스 ID: ${instance.id}</h3>
<h3>사설 IP : ${private_ip}</h3>
<h3>가용영역 : ${az_name}</h3>
<img src="https://banner2.cleanpng.com/20180817/eqe/5f57f9bfeb7fb5ccee9564fa00b5935f.webp" width=200>
EOF
