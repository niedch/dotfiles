[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $HOME/.local/share/forgit/forgit.plugin.zsh ] && source $HOME/.local/share/forgit/forgit.plugin.zsh

PATH="$PATH:$HOME/.local/share/forgit/bin"
export FZF_DEFAULT_OPTS='--height 80% --layout reverse --border top'

#region fzf autocomplete kubectl
_fzf_complete_kubectl() {
  _fzf_complete --multi --reverse --header-lines=1 -- "$@" < <(
    eval "arr=(${@})"

    if [ ${arr: -1} = "logs" ] || [ ${arr: -1} = "exec" ]; then
      kubectl get pods
    elif [ ${arr: -1} = "-f" ]; then
      find *
    elif [ ${arr: -1} = "get" ] || [ ${arr: -1} = "describe" ]; then
      kubectl api-resources
    else
      kubectl get ${arr: -1}
      if [ $? != 0 ]; then
        echo "Nothing found!"
      fi
    fi
  )
}

_fzf_complete_kubectl_post() {
  awk '{print $1}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_kubectl -o default -o bashdefault kubectl
#endregion

#region fzf autocomplete docker
see_details() {
  ID = echo -e $1 | awk '{print $1}'
  return docker ps --format 'ID: {{.ID}}\nName: {{.Names}}\nImage: {{.Image}}\nPorts: {{.Ports}}' | grep $ID
}

_fzf_complete_docker() {
  _fzf_complete --multi --reverse --header-lines=1 -- "$@" < <(
    docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}'
  )
}

_fzf_complete_docker_post() {
  awk '{print $1}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_docker -o default -o bashdefault docker
#. ~/docker-fzf.sh
#endregion

#region Autocomplete toggle.sh
fetch_feature_toggles() {
  curl --request GET \
  --silent \
  --url http://localhost:8856/slm/webservice/v2.x/featuretoggle \
  --header 'authorization: Basic c2xtYWRtaW46dzByayRoMHA=' \
  --header 'user-agent: vscode-restclient' | jq -r '.QueryResult.Results[] | [.Name, .Description] | @tsv'
}

_fzf_complete_multi_toggle.sh() {
  _fzf_complete --multi --reverse --header-lines=1 --preview 'echo {}' -- "$@" < <(
    echo -e 'Toggle\tDescription'
    fetch_feature_toggles
  )
}

_fzf_complete_multi_toggle.sh_post() {
  awk '{print $1}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_multi_toggle -o default -o bashdefault multi_toggle.sh

_fzf_complete_toggle.sh() {
  _fzf_complete --reverse --header-lines=1 --preview 'echo {}' -- "$@" < <(
    echo -e 'Toggle\tDescription'
    fetch_feature_toggles
  )
}

_fzf_complete_toggle.sh_post() {
  awk '{print $1}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_toggle -o default -o bashdefault toggle.sh
#endregion
