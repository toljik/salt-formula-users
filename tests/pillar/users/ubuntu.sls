canonical:
  user.present:
    - fullname: canonical
    - shell: /bin/bash
    - home: /home/canonical
    - uid: 3637
    - gid: 3637
    - groups:
       - wheel
       - storage
       - games

  ssh_auth.present:
    - user: canonical
    - source: salt://salt-formula-users/test/ubuntu.pem
    - config: /home/canonical/.ssh/authorized_keys

redhat:
  user.absent
