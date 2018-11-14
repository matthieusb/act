#!/bin/zsh

# ACTIONA
# ==============
# oh-my-zsh plugin
#
# TODO Add a github for this

# Get opts
args=$(getopt -o e: -l exe,help -- $*)
actiona_scripts_location=~/.actiona_scripts

# Prints help
act_print_usage() {
    cat <<- EOF
Usage: act [command]

Commands:
    exe    <script>    Execute an actiona script without any actiona window opening
    detail <script>    Detail script actions (If comments are mentioned)
    list               Display available scripts

    help               Show this extremely helpful text
EOF
}

act_exec_script() {
  echo "Executing $1"
  actiona --execute  --noexecutionwindow --nosplash --noconsolewindow --exitatend "$actiona_scripts_location/$1"
}

act_display_scripts() {
  echo "Scripts available in $actiona_scripts_location: "
  echo "-----"

  # Replacing all "/" of scripts paths with "\/" so that sed will understand them afterwards
  remove_from_path_for_sed=`echo $actiona_scripts_location | sed 's/\//\\\\\//g'`

  # Removing the script path from the list of available scripts
  find $actiona_scripts_location/ -type f -name "*.ascr" | sed "s/^$remove_from_path_for_sed//g" | sed "s/^\///g"
}

act_detail_script() {
  # TODO
  echo "Work in Progress"
}

get_scripts_location() {
  if [[ -v ACTIONA_SCRIPTS ]]
  then
    actiona_scripts_location=$ACTIONA_SCRIPTS
  fi
}

# Check if no arguments were given
if [[ ($? -ne 0 || $#* -eq 0) ]]
then
    act_print_usage
else
  # Check if actiona is installed
  if ! type "actiona" > /dev/null; then
    echo "Actiona was not found !"
  else
    get_scripts_location # Getting display scripts location

    # parse rest of options
    for o
    do
        case "$o"
            in
            -e|--exe|exe)
              act_exec_script $2
              break
              ;;
            -d|--detail|detail)
              act_detail_script $2
              break
              ;;
            -l|--list|list)
              act_display_scripts
              break
              ;;
            --)
              break
              ;;
        esac
    done
  fi
fi

unset args
