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
    "cc" 'comment-line) 
  (my-leader-def
    :keymaps 'visual
    "cc" 'comment-region)
  )

