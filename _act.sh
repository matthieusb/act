#compdef act

zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion::complete:act:*:commands' group-name commands
zstyle ':completion::complete:act:*:actiona_scripts' group-name actiona_scripts
zstyle ':completion::complete:act::' list-grouped

zmodload zsh/mapfile

actiona_scripts_location=~/.actiona_scripts

function get_scripts_location() {
  if [[ -v ACTIONA_SCRIPTS ]]
  then
    actiona_scripts_location=$ACTIONA_SCRIPTS
  fi
}

function _act() {
  local ret=1

  local -a commands
  local -a actiona_scripts

  commands=(
    'exe: Execute an actiona script'
    'list: List available actiona scripts'
  )

  get_scripts_location
  # Replacing all "/" of scripts paths with "\/" so that sed will understand them afterwards
  remove_from_path_for_sed=`echo $actiona_scripts_location | sed 's/\//\\\\\//g'`
  
  actiona_scripts=(`find $actiona_scripts_location/ -type f -name "*.ascr" | sed "s/^$remove_from_path_for_sed//g" | sed "s/^\///g"`)

  local target=$words[2]
  _arguments -C \
    '1: :->first_arg' \
    '2: :->second_arg' && ret=0

    case $state in
      first_arg)
        _describe -t commands "Commands" commands && ret=0
        ;;
      second_arg)
        case $target in
          exe)
            _describe -t actiona_scripts "Actiona scripts" actiona_scripts && ret=0
            ;;
          *)
            ;;
        esac
        ;;
    esac

    return $ret
}

get_scripts_location
_act "$@"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
