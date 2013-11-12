cleanup:
  pkg.purged:
    - pkgs:
      - apport
      - apport-gtk
      - evolution-data-server
      - gnome-bluetooth
      - gwibber
      - gwibber-service
      - indicator-messages
      - mdadm
      - python-apport
      - telepathy-indicator
      - unity-scope-musicstores
      - update-notifier
      - whoopsie
  file.managed:
    - name: /usr/local/sbin/fixubuntu.sh
    - source: salt://packages/fixubuntu.sh
    - mode: 555
