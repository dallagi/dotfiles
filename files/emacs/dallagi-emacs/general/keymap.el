(defun general-set-base-keymap ()
  ;; set global leader key
  (general-create-definer my-leader-def
    :prefix "SPC")
  ;; set local leader key
  (general-create-definer my-local-leader-def
    :prefix "SPC m") 

  ;; prefix-based keybinds
  (my-leader-def
    :keymaps 'normal
    "SPC" 'projectile-find-file
    ":" 'counsel-M-x
    "cc" 'comment-or-uncomment-line
    "bd" 'kill-current-buffer
    "bp" 'previous-buffer
    "bn" 'next-buffer
    "gg" 'magit-status
    "of" 'ranger
    "pa" 'projectile-add-known-project
    "pd" 'projectile-remove-known-project
    "pp" 'projectile-switch-project
    "wh" 'windmove-left
    "wj" 'windmove-down
    "wk" 'windmove-up
    "wl" 'windmove-right
    "wd" 'delete-window
    "ws" 'split-window-below
    "wv" 'split-window-right
    "ww" 'ace-window
    ) 
  (my-leader-def
    :keymaps 'visual
    "cc" 'comment-or-uncomment-region)
  )
