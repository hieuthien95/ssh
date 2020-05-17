# step 1 - ssh.cloud.google.com
```
1. 
> sudo su root

2. 
> yum install nano

3. 
> nano /etc/ssh/sshd_config

Tìm 2 dòng sau. Nếu nội dung đang là No thì bạn sửa thành Yes. 
Còn nếu không có thì chèn thêm sau mục #Authenciation. 
Trường hợp dòng đó có sẵn như có dấu # ở đầu thì bạn xóa đi
> PermitRootLogin yes
> PasswordAuthentication yes
Sau đó bấm Ctrl+O và Enter sau đó bấm Ctrl+X để thoát

> systemctl enable sshd.service
> systemctl restart sshd.service
> sudo passwd
vd: Abc123456
```

# step 2: có thể login bằng ssh CMD
```
> ssh root@x.x.x.x
```
