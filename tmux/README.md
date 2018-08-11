# Tmux

Related resources:
- https://github.com/tmux/tmux
- https://github.com/tmux/tmux/wiki

The `tmux` is an open-source terminal multiplexer that allows users to manage multiple terminal sessions within a single window, and crucially, to keep those sessions running after disconnecting from the server.

## Basic Usage

Start new session:

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

## Manage Session, Window and Pane in Tmux

Shortcuts starts with prefix key which default is `CTRL + b`.

Command prompt is shown up by `CTRL + b, :`.

Manage Pane:
- Split pane vertically: `CTRL + b, %`
- Split pane horizontally: `CTRL + b, "`
- Show pane number: `CTRL + b, q`
- Switch panes: `CTRL + b, o`, `CTRL + b, ARROW_KEY`
- Toggle maximizing pane: `CTRL + b, z`
- Swap with previous/next pane: `CTRL + b, {` / `CTRL + b, }`
- Break the pane out of the window: `CTRL + !`
- Kill current pane: `CTRL + b, x`
- Kill specific pane: `:kill-pane -t {pane_number}`

Manage Window:
- List windows: `CTRL + b, w`
- Create new window: `CTRL + b, c`
- Switch windows: `CTRL + b, p` (previous), `CTRL + b, n` (next), `CTRL + b, NUMBER`
- Rename current window: `CTRL + b, ,`
- Kill current window: `CTRL + b, &`
- Kill specific window: `:kill-window -t {window_number}`

Manage Session:
- List sessions: `CTRL + b, s`
- Switch session: `CTRL + b, (` (previous), `CTRL + b, )` (next)
- Rename session name: `CTRL + b, $`
