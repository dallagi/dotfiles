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
;; Double font size on Linux
(let* ((base-font-size 20)
       (my-font-size (if IS-LINUX (* base-font-size 2) base-font-size))) ;; double font-size on linux
  (setq doom-font (font-spec :family "Fira Code" :size my-font-size :weight 'semi-light)
        doom-variable-pitch-font (font-spec :family "Fira Sans" :size my-font-size)))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-tomorrow-night)


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'visual) ;; relative to screen lines - ie. ignoring folds


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

;; Make modeline smaller.
;; Note that height is given in units of 1/10th of point, so 150 -> 15pt
(setq +modeline-height 18)

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

;; LSP
(setq lsp-auto-execute-action nil)

;; Projectile
(setq projectile-auto-discover t)
(setq projectile-project-search-path '("~/Workspace"))

;; Customize Ranger
(setq ranger-show-hidden t)
(setq ranger-max-preview-size 1) ;; MB - Lower max size for preview in Ranger
(setq ranger-preview-delay 0.5) ;; seconds

;; Custom keymaps
(map! :nv "SPC e e" #'ranger) ;; ranger with SPC e e
(define-key evil-window-map (kbd "w") 'ace-window) ;; ace-window with SPC w w
(define-key evil-normal-state-map (kbd "C-/") 'evilnc-comment-or-uncomment-lines) ;; comment with C-/

;; unmap C-RET and C-S-RET, as they overlap with useful ORG mode commands
;; and I never used them anyway
(map! :gi "C-RET"      nil
      :gn [C-return]   nil
      :gi "C-S-RET"    nil
      :gn [C-S-return] nil)

;; NOTE: for elixir-ls to work, the directory containing the
;;       `language-server.sh' script must be in $PATH.

;; org mode

(setq org-directory "~/org/")

(after! org
  (setq org-log-done 'time) ;; set timestamp when closing TODO item
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WIP(p)" "BLOCKED(w)" "|" "KILLED(k)" "DONE(d)" "POSTPONED(p)")))
  )

;; anki
(use-package anki-editor
  :config
  (setq anki-editor-create-decks 't))



;; Treesitter related stuff
;; TODO: Add rust and elixir to tree-edit
;;       see https://github.com/ethan-leba/tree-edit/blob/docs/doc/using-tree-edit.org#adding-new-languages-to-tree-edit
;; (add-hook 'elixir-mode-hook #'evil-tree-edit-mode)
;; (add-hook 'rust-mode-hook #'evil-tree-edit-mode)
;; (add-hook 'evil-tree-edit-after-change-hook #'+format/buffer) ;; format after tree edit

;; Open dashboard as initial buffer by default
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; Start maximized in linux
(if IS-LINUX (add-to-list 'default-frame-alist '(fullscreen . maximized)))

;; Keep n rows above/below cursor
(setq scroll-margin 5)


;; FUNCTIONS

;; TODO: allow setting deps for dev/test only

(use-package! request)

;; HEX-SEARCH

(with-output-to-temp-buffer "*Mix xxx*"
  (princ "`excontainers' - Throwaway containers for your tests\n")
  (princ "\tPublisher: `dallagi'\n")
  (princ "\tOwners:    `dallagi'\n\n")

  (princ "License:      `GPL-3.0-or-later'\n")
  (princ "Last version: `0.3.0' (Apr 03, 2021)\n\n")

  (princ "Downloads:\n")
  (princ "\tThis version: 1\n")
  (princ "\tYesterday:    1\n")
  (princ "\tLast 7 days:  1\n")
  (princ "\tAll time:     1\n\n")

  (princ "Dependencies: `gestalt' ~> 1.0, `hackney' ~> 1.16.0, `jason' ~> 1.0.0, `tesla' ~> 1.4.0\n\n")

  (princ "Links:\n")
  (princ "\tHex.pm: `https://hex.pm/packages/excontainers'\n")
  (princ "\tGithub: `https://github.com/dallagi/excontainers'\n\n")

  (princ "Versions:\n")
  (princ "`0.3.0' (Apr 03, 2021)\n")
  (princ "`0.2.1' (Apr 03, 2021)\n")
  (princ "`0.2.0' (Apr 03, 2021)\n")
  )

;; MIX-ADD

(defun package-info (package-data)
  (let* (
         (name (cdr (assoc 'name package-data)))
         (meta (cdr (assoc 'meta package-data)))
         (description (cdr (assoc 'description meta)))
         (configs (cdr (assoc 'configs package-data)))
         (mix (cdr (assoc 'mix.exs configs)))
         )
    `((name . ,name) (description . ,description) (mix . ,mix))))


(defun do-mix-add (name)
  (request "https://hex.pm/api/packages"
    :params `(("search" . ,name) ("sort" . "recent_downloads"))
    :parser 'json-read
    :success (cl-function
              (lambda (&key data &allow-other-keys)
                (let ((packages (cl-map 'vector 'package-info data)))
                  (add-mix-package-among packages)))
              )))

(defun mix-add (name)
  "Search and insert hex package in format for mix.exs."
  (interactive "sSearch package:") (do-mix-add name))


(defun completions-for (packages)
  (seq-into
   (cl-map 'vector
           (lambda (package-info)
             (let* (
                    (package-name (cdr (assoc 'name package-info)))
                    (package-description (cdr (assoc 'description package-info))))
               `(,package-name . ,package-info))) packages)
   'list))

(defun choose-package (packages)
  (let* (
         (completions (completions-for packages))
         (annotation-function (apply-partially #'annotate-choices completions (annotations-padding completions)))
         (completion-extra-properties `(:annotation-function ,annotation-function))
         (package-name (completing-read "Choose: " completions nil t))
         (package-info (cdr (assoc package-name completions)))
         )
    (do-add-mix-package package-info)))

(defun annotations-padding (completions)
  "Determines the max length of a candidate name, to be used as padding to align annotations"
  (seq-max (mapcar (lambda (candidate) (length (car candidate))) completions)))

(defun annotate-choices (completions padding candidate)
  (let* ((candidate-info (cdr (assoc candidate completions)))
         (candidate-description (cdr (assoc 'description candidate-info)))
         (normalized-description (replace-regexp-in-string (regexp-quote "\n") " " candidate-description nil 'literal))
         (margin (make-string (- padding (length candidate)) ? )))
    (concat " " margin normalized-description)))

(defun add-mix-package-among (packages)
  (cond
   ((= 0 (length packages)) (message "No such package found!"))
   ((= 1 (length packages)) (do-add-mix-package (aref packages 0)))
   (t (choose-package packages))
   ))

(defun do-add-mix-package (package)
  (let ((mix (cdr (assoc 'mix package))))
    (end-of-line)
    (newline-and-indent)
    (insert mix)
    (insert ",")))
