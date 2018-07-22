#!/bin/bash
set -e

readonly name=builder

# Match the uid and gid of the workdir, unless that is root.
readonly host_uid=$(stat -c %u .)
readonly host_gid=$(stat -c %g .)
if [ "${host_uid}" -ne 0 ]; then
    uid_arg="--uid=${host_uid}"
    gid_arg="--gid=${host_gid}"
else
    uid_arg=""
    gid_arg=""
fi

# Create the builder user.
groupadd -fo "${gid_arg}" "${name}"
useradd -mo "${uid_arg}" "${gid_arg}" \
    --home="/home/${name}" --shell="/bin/bash" "${name}"

ln -s "/mnt" "/home/${name}/host"
exec su --login "${name}"
