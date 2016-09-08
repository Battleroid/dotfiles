# tack this onto whatever .profile is to fix dmenu, then remove dmenu cache
opt_dir=(/opt/*/bin/*.sh)
opt_path=$(printf "%s:" "${opt_dir[@]}")
export PATH="${opt_path}/sbin/:${PATH}"
