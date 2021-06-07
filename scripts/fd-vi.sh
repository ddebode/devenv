
#!/bin/bash
nvim $(fd $1 | fzf)
