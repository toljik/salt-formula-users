redhat:
  user.present:
    - fullname: red hat
    - shell: /bin/bash
    - home: /home/redhat
    - uid: 3637
    - gid: 3637
    - groups:
       - users
       - root
    - sudo: True
 
  ssh_auth.present:
    - user: redhat
    - source: salt://salt-formula-users/test/ubuntu.pem
    - config: /home/redhat/.ssh/authorized_keys    

canonical:
  user.absent
