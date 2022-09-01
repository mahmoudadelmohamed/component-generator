
echo "Enter Your Componant or Screen Name"
read folder_name;
echo "Enter Your Directory"
read directory;
cd $directory
mkdir $folder_name;

file_names=("index.tsx" "styles.ts" "types.ts");
index_content=$(cat <<EOF
import React from 'react';
import {
  useStyles,
} from '';
import {
  styles,
} from './styles';
import {
  ${folder_name}Props,
} from './types';

export const ${folder_name}: React.FC<${folder_name}Props> = (props: ${folder_name}Props) => {
  const {
    selectStyle,
  } = useStyles(styles);
  
  return null;
};
EOF
)

style_content=$(cat <<EOF
import {
  Theme,
} from '';
import {
  ${folder_name}Styles,
} from './types';

export const styles = (theme: Theme): ${folder_name}Styles => ({
});
EOF
)

types_content=$(cat <<EOF
export interface ${folder_name}Styles  {
}

export interface ${folder_name}Props {
}
EOF
)


file_contents=("${index_content}" "${style_content}" "${types_content}")
endl=$'\n'

getFiles() {
 length=${#file_names[@]}
 for (( i=0; i<$length; i++ )); 
 do 
  touch $1/${file_names[$i]}
  echo "${file_contents[$i]}${endl}" > $1/${file_names[$i]}
 done
}
getFiles $folder_name
