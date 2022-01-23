;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Marco Dallagiacoma"
      user-mail-address "marco.dallagiacoma@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Fira Code" :size 20 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 20))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-vibrant)
(setq doom-theme 'doom-solarized-dark)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Make modeline smaller and using a variable-width font.
;; Note that height is given in units of 1/10th of point, so 150 -> 15pt
(setq +modeline-height 20)

;; Packages
(use-package! ace-window :commands ace-window)

(use-package! ranger :commands ranger)

(use-package! dashboard
  :init
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (bookmarks . 3)
                          (agenda . 3)))
  (setq dashboard-startup-banner 2)
  :config
  (dashboard-setup-startup-hook))

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; Custom keymaps
(map! :nv "SPC e e" #'ranger)
(define-key evil-window-map (kbd "w") 'ace-window)

;; unmap C-RET and C-S-RET, as they overlap with useful ORG mode commands
;; and I never used them anyway
(map! :gi "C-RET"      nil
      :gn [C-return]   nil
      :gi "C-S-RET"    nil
      :gn [C-S-return] nil)

;; NOTE: for elixir-ls to work, the directory containing the
;;       `language-server.sh' script must be in $PATH.

;; ORG MODE
(setq org-log-done 'time) ;; set timestamp when closing TODO item

;; Treesitter related stuff
;; TODO: Add rust and elixir to tree-edit
;;       see https://github.com/ethan-leba/tree-edit/blob/docs/doc/using-tree-edit.org#adding-new-languages-to-tree-edit
;; (add-hook 'elixir-mode-hook #'evil-tree-edit-mode)
;; (add-hook 'rust-mode-hook #'evil-tree-edit-mode)
;; (add-hook 'evil-tree-edit-after-change-hook #'+format/buffer) ;; format after tree edit

;; Open dashboard as initial buffer by default
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
