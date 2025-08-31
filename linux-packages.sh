echo "Installing packages and PPAs..."

distro=$(lsb_release -s -c)
update

package 'jq'
package 'autojump'
package 'fzf'
package 'starship'
