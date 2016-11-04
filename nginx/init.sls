
nginx:
    pkg:
        - installed
    service.running:
        - require:
            - pkg: nginx
        - reload: True
        - enable: True
        - watch:
            - pkg: nginx
            - file: /etc/nginx/sites-enabled/000-drop-invalid-hosts.conf

/etc/nginx/sites-enabled/default:
    file.absent:
        - require:
            - pkg: nginx

/etc/nginx/sites-available/000-drop-invalid-hosts.conf:
    file.managed:
        - template: jinja
        - source: salt://nginx/files/000-drop-invalid-hosts.conf.jinja
        - user: root
        - group: root
        - mode: 644

/etc/nginx/sites-enabled/000-drop-invalid-hosts.conf:
    file.symlink:
        - target: /etc/nginx/sites-available/000-drop-invalid-hosts.conf
