#!/bin/bash

# Directories
TEMPLATE_PATH=~/Repos/clones/code-templates/
DEST_PATH=~/Repos/temp/

# help page
function display_help() {
   echo "Usage: $0 -t <template> -n <page> -l"
   echo "Options:"
   echo "  -t <template>    Template name (include parent folder)"
   echo "  -n <name>        Name for the project"
   echo "  -l               List all templates"
}

function display_template_list() {
    find $TEMPLATE_PATH -depth -3 -type d -not -path "$TEMPLATE_PATH/.git/*"
}

#Command line format: [-t <template-name> -n <project-name> ] 
while getopts "t:n:l" opt
do
   case "$opt" in
      t ) TEMPLATE="$OPTARG" ;;
      n ) NAME="$OPTARG" ;;
      l ) display_template_list
           exit 1;;
      ? ) display_help 
           exit 1;;
   esac
done

if [ $OPTIND -eq 1 ]; then
   display_help 
   exit 1
fi 

if [ -z "$TEMPLATE" ]
then
   echo "Empty Template"
   exit 1
fi

if [ -z "$NAME" ]
then
   echo "Empty Name"
   exit 1
fi

cp -r $TEMPLATE_PATH$TEMPLATE $DEST_PATH$NAME

