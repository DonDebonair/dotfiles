echo "Installing packages and PPAs..."
distro=$(lsb_release -s -c)
update

package 'software-properties-common'
package 'apt-transport-https'

key 'https://deb.nodesource.com/gpgkey/nodesource.gpg.key'
repository "deb https://deb.nodesource.com/node_14.x $distro main"
repository "deb-src https://deb.nodesource.com/node_14.x $distro main"
key 'https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public'
repository "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb $distro main"
ppa 'deadsnakes/ppa'

package 'build-essential'
package 'python3'
package 'python3-dev'
package 'python3-pip'
package 'python3-venv'
package 'jq'
package 'autojump'
package 'nodejs'
package 'fzf'
package 'adoptopenjdk-16-hotspot'

# Install pyenv
if ! command -v pyenv &> /dev/null; then
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
fi

# # Install direnv
if ! command -v direnv &> /dev/null; then
    curl -s https://api.github.com/repos/direnv/direnv/releases/latest \
    | jq -r ".assets[] | select(.name | contains(\"linux-amd64\")) | .browser_download_url" \
    | wget -O ~/bin/direnv -q -i - 1>/dev/null 2>&1 && chmod +x ~/bin/direnv
fi

PIP_REQUIRE_VIRTUALENV=false pip3 show pipx 1>/dev/null 2>&1
[[ $? -eq 0 ]] || PIP_REQUIRE_VIRTUALENV=false pip3 install pipx

sudo npm install --global yarn