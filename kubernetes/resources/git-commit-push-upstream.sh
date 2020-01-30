set -eo pipefail

mkdir -p ~/.ssh
chmod 700 ~/.ssh
cat >~/.ssh/config <<EOF
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile    /dev/null
  IdentityFile          /root/id_rsa
EOF

git config --global user.email "${EMAIL}"
git config --global user.name "${FULL_NAME}"
git checkout -b $HEAD_BRANCH_NAME
git add $FILES_TO_ADD
git commit -m "${COMMIT_MESSAGE}"
git push --set-upstream origin $HEAD_BRANCH_NAME
