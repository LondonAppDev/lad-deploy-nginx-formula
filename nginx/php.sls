php5-fpm:
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
