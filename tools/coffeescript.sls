coffeescript:
  pkg.installed:
    - pkgs:
      - nodejs
      - npm
  cmd.run:
    - name: sudo npm install -g coffee-script
  file.symlink:
    - name: /usr/local/bin/node
    - target: /usr/bin/nodejs
