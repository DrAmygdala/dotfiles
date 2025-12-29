{ pkgs }:
{
  enable = true;
  clock24 = true;
  keyMode = "vi";
  newSession = true;
  prefix = "C-a";
  extraConfig = ''
    #################
    # Design
    #################

    # status line
    set -g status-utf8 on
    set -g status-justify left
    set -g status-bg default
    set -g status-fg colour12
    set -g status-interval 2


    # messaging
    set -g message-fg black
    set -g message-bg yellow
    set -g message-command-fg blue
    set -g message-command-bg black


    #window mode
    setw -g mode-bg colour6
    setw -g mode-fg colour0


    # window status
    setw -g window-status-format "#[fg=magenta]#[bg=black] #I #[bg=cyan]#[fg=colour8] #W "
    setw -g window-status-current-format "#[bg=brightmagenta]#[fg=colour8] #I #[fg=colour8]#[bg=colour14] #W "
    setw -g window-status-current-bg colour0
    setw -g window-status-current-fg colour11
    setw -g window-status-current-attr dim
    setw -g window-status-bg green
    setw -g window-status-fg black
    setw -g window-status-attr reverse


    # loud or quiet?
    set-option -g visual-activity off
    set-option -g visual-bell off
    set-option -g visual-silence off
    set-window-option -g monitor-activity off
    set-option -g bell-action none


    # tmux clock
    set -g clock-mode-colour blue

    # The modes {

    setw -g clock-mode-colour colour135
    setw -g mode-attr bold
    setw -g mode-fg colour196
    setw -g mode-bg colour238

    # }
    # The panes {

    set -g pane-border-bg colour235
    set -g pane-border-fg colour238
    set -g pane-active-border-bg colour236
    set -g pane-active-border-fg colour51

    # }
    # The statusbar {

    set -g status-position bottom
    set -g status-bg colour234
    set -g status-fg colour137
    set -g status-attr dim
    set -g status-left '[#S] '
    set -g status-right '#[fg=colour233,bg=colour241,bold] %Y/%m/%d #[fg=colour233,bg=colour245,bold] %H:%M '
    set -g status-right-length 50
    set -g status-left-length 20

    setw -g window-status-current-fg colour81
    setw -g window-status-current-bg colour238
    setw -g window-status-current-attr bold
    setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '

    setw -g window-status-fg colour138
    setw -g window-status-bg colour235
    setw -g window-status-attr none
    setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '

    setw -g window-status-bell-attr bold
    setw -g window-status-bell-fg colour255
    setw -g window-status-bell-bg colour1

    # }
    # The messages {

    set -g message-attr bold
    set -g message-fg colour232
    set -g message-bg colour166

    # }

    ############
    # Settings #
    ############
    set -g default-terminal "screen-256color" # colors!
    setw -g xterm-keys on
    set -s escape-time 0                      # fastest command sequences
    set -sg repeat-time 600                   # increase repeat timeout
    set -s focus-events on

    set -q -g status-utf8 on                  # expect UTF-8 (tmux < 2.2)
    setw -q -g utf8 on

    # Update status frequently.
    set-option -g status-interval 2

    # Increase history size
    set -g history-limit 50000

    # Mouse mode settings
    set -g mouse on

    # Don't rename windows automatically
    set-option -g allow-rename off

    ############
    # Mappings #
    ############
    # edit configuration
    unbind e
    bind e new-window -n '.tmux.conf' "sh -c '\${"EDITOR:-vim"} ~/.tmux.conf && tmux source ~/.tmux.conf && tmux display \"~/.tmux.conf sourced\"'"

    # If vim window, (vim-tmux-navigator)
    # Smart pane switching with awareness of Vim splits.
    # See: https://github.com/christoomey/vim-tmux-navigator
    is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
    bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
    bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
    bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
    bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
    bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
    bind-key -T copy-mode-vi C-h select-pane -L
    bind-key -T copy-mode-vi C-j select-pane -D
    bind-key -T copy-mode-vi C-k select-pane -U
    bind-key -T copy-mode-vi C-l select-pane -R
    bind-key -T copy-mode-vi C-\ select-pane -l
    setw -g mode-keys vi
    set-option -s set-clipboard off
    bind P paste-buffer
    bind-key -T copy-mode-vi v send-keys -X begin-selection
    bind-key -T copy-mode-vi y send-keys -X rectangle-toggle
    unbind -T copy-mode-vi Enter
    bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel 'wl-clip -se c -i'
    bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel 'wl-clip -se c -i'


    # Shift-Left/Right/Up/Down             Resize the current split by 1
    bind-key -n S-Up display-panes \; resize-pane -U
    bind-key -n S-Down display-panes \; resize-pane -D
    bind-key -n S-Left display-panes \; resize-pane -L
    bind-key -n S-Right display-panes \; resize-pane -R

    # Ctrl-Shift-Left/Right/Up/Down        Resize the current split by 10
    bind-key -n C-S-Up display-panes \; resize-pane -U 10
    bind-key -n C-S-Down display-panes \; resize-pane -D 10
    bind-key -n C-S-Left display-panes \; resize-pane -L 10
    bind-key -n C-S-Right display-panes \; resize-pane -R 10

    # Alt-,/.                              Move focus among windows
    bind-key -n M-, previous-window
    bind-key -n M-. next-window

    # Alt-[/]                              Move focus among sessions
    bind-key -n M-[ switch-client -p
    bind-key -n M-] switch-client -n

    # Alt-Shift-Left/Right/Up/Down         Create a new split in the given direction
    bind-key -n M-S-Left split-window -h -c "#{pane_current_path}" \; swap-pane -s :. -t :.- \; select-pane -t :.- \; display-panes
    bind-key -n M-S-Up split-window -v -c "#{pane_current_path}" \; swap-pane -s :. -t :.- \; select-pane -t :.- \; display-panes
    bind-key -n M-S-Right display-panes \; split-window -h -c "#{pane_current_path}"
    bind-key -n M-S-Down display-panes \; split-window -v -c "#{pane_current_path}"

    # Ctrl-Shift-Left/Right                Swap the current split with another
    bind-key -n C-S-Left display-panes \; swap-pane -s :. -t :.- \; select-pane -t :.-
    bind-key -n C-S-Right display-panes \; swap-pane -s :. -t :.+ \; select-pane -t :.+

    # Ctrl-Shift-Up                        Balance panes horizontally
    # bind-key -n C-S-Up display-panes \; select-layout even-horizontal

    # Ctrl-Alt-Space                       Cycle through pane layouts
    bind-key -n C-M-Space display-panes \; next-layout

    # Ctrl-Shift-Delete                    Kill current focused split
    bind-key -n C-S-DC kill-pane

  '';

  plugins = with pkgs; [
    {
      plugin = tmuxPlugins.resurrect;
      extraConfig = "set -g @resurrect-strategy-nvim 'session'";
    }
    {
      plugin = tmuxPlugins.continuum;
      extraConfig = ''
        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '5' # minutes
      '';
    }
    {
      plugin = tmuxPlugins.pain-control;
    }
    {
      plugin = tmuxPlugins.vim-tmux-navigator;
    }
  ];
}
