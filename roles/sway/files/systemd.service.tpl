[Unit]
Description=Sway compositor
After=plymouth-quit.service

[Service]
ExecStartPre=/usr/bin/chvt %I
ExecStart=/usr/bin/dbus-launch --exit-with-session /usr/bin/sway
TTYPath=/dev/tty%I
TTYReset=yes
TTYVHangup=yes
TTYVTDisallocate=yes
PAMName=login
User={{ local_user }}
WorkingDirectory=/home/{{ local_user }}
Environment=XDG_RUNTIME_DIR=/run/user/1000
Environment=QT_WAYLAND_FORCE_DPI=100
Environment=QT_PLUGIN_PATH=/usr/lib/kde4/plugins/
Environment=QT_QPA_PLATFORM=wayland
Environment=QT_AUTO_SCREEN_SCALE_FACTOR=0
Environment=QT_QPA_PLATFORMTHEME=gtk3
Environment=QT_WAYLAND_DISABLE_WINDOWDECORATION=1
Environment=GDK_BACKEND=wayland
Environment=GTK_THEME=Adwaita:dark
Restart=always
RestartSec=2
StandardInput=tty
StandardError=journal
StandardOutput=journal
Nice=-5

[Install]
WantedBy=graphical.target
Alias=display-manager.service
