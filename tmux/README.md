# Tmux

Related resources:
- https://github.com/tmux/tmux
- https://github.com/tmux/tmux/wiki

The `tmux` is an open-source terminal multiplexer that allows users to manage multiple terminal sessions within a single window, and crucially, to keep those sessions running after disconnecting from the server.

## Basic Usage

Start, resume, and kill session:

```bash
# Start new session
tmux new -s {session_name}

# List sessions
tmux ls
tmux list-sessions

# Re-attach session
tmux attach -t {session_name or session_id}

# Kill session
tmux kill-session -t {session_name or session_id}

# Kill all sessions
tmux kill-session -a
```

Layout hierarchy: Session - Window - Pane

Default prefix key: `CTRL + b`

Detach from current session: `CTRL + b, d`

List key bindings: `CTRL + B, ?` or `:list-keys` (search using `/{keyword}`, exit using `q`)

List commands: `:list-commands`

## Manage Session, Window and Pane in Tmux

Shortcuts starts with prefix key which default is `CTRL + b`.

Command prompt is shown up by `CTRL + b, :`.

Manage Pane:
- Split pane vertically: `CTRL + b, %`
- Split pane horizontally: `CTRL + b, "`
- Show pane number: `CTRL + b, q`
- Switch panes: `CTRL + b, o`, `CTRL + b, ARROW_KEY`
- Select pane layout: `:select-layout {layout}`
    - layout: `even-horizontal`, `even-vertical`, `main-horizontal`, `main-vertical`, `tiled`, etc
- Toggle minimizing/maximizing(collapse/expand) pane: `CTRL + b, z`
- Swap with previous/next pane: `CTRL + b, {` / `CTRL + b, }`
- Break the pane out of the window: `CTRL + !`
- Kill current pane: `CTRL + b, x`
- Kill specific pane: `:kill-pane -t {pane_number}`
- Capture and save the entire scrollback texts of current pane:
    - Copy to buffer: open command prompt by `CTRL + b, :`, then run `capture-pane -S -[line_number_you_want_to_dump]`
        - `[line_number_you_want_to_dump]`: `-10000` means 10000 lines, use only `-` for all lines
    - Safe buffer to file: open command prompt by `CTRL + b, :`, then run `save-buffer filename.txt`
        - It will save file to `~/filename.txt`

Manage Window:
- List windows: `CTRL + b, w`
    - This shows combined list of all sessions and windows
- Create new window: `CTRL + b, c`
- Switch windows: `CTRL + b, p` (previous), `CTRL + b, n` (next), `CTRL + b, NUMBER`
- Rename current window: `CTRL + b, ,`
- Kill current window: `CTRL + b, &`
- Kill specific window: `:kill-window -t {window_number}`

Manage Session:
- List sessions: `CTRL + b, s` (tmux command: `choose-tree -Zs`)
    - Navigate: Use the `UP` and `DOWN` arrow keys (or `j` / `k`)
    - Preview: Use the `RIGHT` arrow key to expand and preview a session's windows, the `LEFT` arrow to collapse the windows view
    - Select: Press Enter to switch to the highlighted session
    - Exit: Use the `q` to exit the list menu without switching sessions
- Switch session: `CTRL + b, (` (previous), `CTRL + b, )` (next)
- Rename session name: `CTRL + b, $`
