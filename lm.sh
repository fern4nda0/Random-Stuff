lm() {
    local file
    local show_hidden=""
 
     if [[ "$1" == "-h" ]]; then
        show_hidden="--hidden"
    fi

    while true; do
        file=$(echo ".." && fd  $show_hidden --color=always --max-depth 1 --type d --type f --follow ) 
        file=$(echo "$file" | fzf --ansi --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window=right:70% )
        
        # If no file selected, exit the function
        if [[ -z "$file" ]]; then
          # echo ":q"  
          break
        fi
        
        
        if [[ "$file" == ".." ]]; then
        # echo "cd .."
          cd ..
        elif [[ -d "$file" ]]; then
            cd "$file"
            # echo "cd -> $file"
        else
          # echo "nvim -> $file"
            nvim "$file"
            break
        fi
    done
}
