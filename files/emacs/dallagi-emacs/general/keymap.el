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
    "cc" 'comment-line
    "wh" 'windmove-left
    "wj" 'windmove-down
    "wk" 'windmove-up
    "wl" 'windmove-right
    "wq" 'delete-window
    "ws" 'split-window-below
    "wv" 'split-window-right
    ) 
  (my-leader-def
    :keymaps 'visual
    "cc" 'comment-region)
  )
