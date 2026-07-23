## Terminal

If you are doing some piping and output, it's a good idea to add a newline at the end or the prompt might get included e.g.
`echo MY_ENCODED_STRING | base64 --decode; echo`

`rg` - ripgrep, useful tool for searching

`eza` - new ls. Aliased to be `ll`

`fd` - find (https://github.com/sharkdp/fd?tab=readme-ov-file#installation) e.g. `fd .go`. It ignores files listed in gitignore by default.

`du -ah . | sort -rh | head -n 10` - list file sizes

`source ~/.zshrc` - reload zsh

`less` - show contents one page at a time

`<cmd> | code -` - redirect live output to code 

`open .` - open a Finder window in current location. 

`env` - show all env vars

`lsof -i :8080` - whats listening on a port

`kill -9 <PID>` - kill process

```
// Copy and paste
echo "Hello, world!" | pbcopy
pbpaste
```

`rg "some_text" | wc -l` -  count results


## AI 

`/copy` - copies last response

`/share` - exports the session to a file

`/search` - searches through conversations

`/review` - reviews changes (can be staged, unstaged or diffs from main)




## TMUX

tmux ls - see active tmux sessions
tmux attach -t <name> - log in to session

Prefix + % - split current pane vertically  
Prefix + " - split pane horizontally  
Prefix + n - next window  
Prefix + p - previous window
CTRL + h,j,k,l - move between split panes
Prefix + c - new window  
Prefix + & - kill window  
Prefix + x - kill pane

### Copy mode

Prefix + [ - enter copy mode
Space - in copy mode it starts selection, enter to copy
Prefix + ] - paste from tmux buffer
Or when in copy mode you can do vim select, yank and paste

While in copy mode, naviagte using arrows.  
Space - start selection, press enter and is copied to tmux buffer.  
Prefix + ] - paste buffer

When in copy mode, you can use VIM key bindings (e.g. b,e) to select to start of word etc.

Other option is to press v, select text and then y to yank and p to paste.



## INTELLIJ

OPT+SHIFT+left/right arrow - highlight a word.  
CMD+SHIFT+left/right arrow - highlight to start/end of current line.  

CMD+HOME - go to start of file.  
CMD+END - go to end of file. 

OPTION_CMD+F - rename variable or reformat code  

CMD+L - go to line


## VIM

$ - go to end of line (normal mode)
dd - cut current line
G - go to end of file
b - begining of word  
e - end of word  
0 - go to start of line

### NVCHAD

Space - leader key

## Containters

`docker system prune -a --volumes` - Remove all stopped containers etc. This is to be used when other options did not work

`docker rmi -f $(docker images -aq)` - Remove all docker images

`docker ps` - List all running containers

`docker stop container_name` - Stop a running container

`docker kill container_name` - Forcefully stop

`docker container ls` - List running docker containers

`kubectl get pods -n <namespace>` - get pods from namespace

`kubectl logs <pod_name> -n <namespace > ccr_log.log` - get pod logs

`kubectl exec -it <pod_name> -n <namespace> -- touch /tmp/run_get_payment_details` - create a file on a pod


## GIT


To change submodule to point at branch

    Go into the submodule folder e.g. api-specs
    ```
    git checkout <branch>
    cd ..
    git diff
    ```

    The commit it's pointing to should have changed. Commit this.

To merge main into branch

    ```
    git checkout master
    git pull
    git checkout feature-branch
    git merge master
    ```

## Windows

Output everything to file - `cmd.exe > out.txt 2>&1`

Process Explorer (Windows) - Can be used to see what arguments the running programs were invoked with.


## Mac

CMD+M - Minimise window

Option + Shift + Command + V - Onenote paste without formatting

CMD+SHIFT+. - Show hidden files in finder

CTRL+Down - shows all windows of the current app
