echo "Installing packages and PPAs..."

distro=$(lsb_release -s -c)
update

package 'jq'
package 'autojump'
package 'fzf'
package 'starship'

# # Install direnv
if ! command -v direnv &> /dev/null; then
    curl -s https://api.github.com/repos/direnv/direnv/releases/latest \
    | jq -r ".assets[] | select(.name | contains(\"linux-amd64\")) | .browser_download_url" \
    | wget -O ~/bin/direnv -q -i - 1>/dev/null 2>&1 && chmod +x ~/bin/direnv
fi
