build:
	docker build -t samba .
start:
	docker run -dt \
	  -v $PWD/smb.conf:/etc/samba/smb.conf \
	  -v $PWD/dozer:/dozer \
	  -v $PWD/share:/share \
	  -p 445:445 \
	  --name samba \
	  --restart=always \
	  samba

add_user:
	docker exec -it samba adduser -s /sbin/nologin -h samba -H -D carol && docker exec -it samba smbpasswd -a carol
