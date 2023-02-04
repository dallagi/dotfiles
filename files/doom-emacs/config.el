;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Marco Dallagiacoma"
      user-mail-address "marco.dallagiacoma@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(let* ((font-size 30))
  (setq doom-font (font-spec :family "Fira Code" :size font-size :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size font-size)))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'visual)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq auto-save-default t ;; Enable auto-save
      make-backup-files t) ;; Enable backup files

;; Customize dirvish
(after! dirvish
  (setq dirvish-hide-details t
        dirvish-attributes 'all-the-icons
        dired-omit-files "\\`[.]?#\\|\\`[.][.]?\\'"))

;; (use-package! dashboard
;;    :init
;;    (setq dashboard-items '((agenda  . 5) (projects . 5))
;;          dashboard-startup-banner 2
;;    (dashboard-setup-startup-hook)))

;; LSP
(with-eval-after-load 'lsp-mode
  (setq lsp-auto-execute-action nil
        lsp-file-watch-threshold 2000
        lsp-rust-analyzer-server-display-inlay-hints t
        lsp-rust-analyzer-import-prefix "by_crate"
        lsp-rust-analyzer-max-inlay-hint-length 20
        lsp-rust-analyzer-display-reborrow-hints "never"
        lsp-rust-analyzer-server-display-inlay-hints nil)
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\target\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\target-docker\\'"))

;; Which key
(setq which-key-use-C-h-commands t)

;; Projectile
(setq projectile-auto-discover t
      projectile-project-search-path '("~/Workspace")
      projectile-enable-caching nil)

;; Custom keymaps
(map! :leader :nv :desc "Run dirvish" "e e" #'dirvish) ;; dirvish with SPC e e
(map! :leader :desc "Explain error at point" "c X" #'flycheck-explain-error-at-point)
(map! :desc "Comment or uncomment lines" "C-/" #'evilnc-comment-or-uncomment-lines)

;; Explicitly use flycheck to move between errors
;; The standard way doesn't seem to work reliably
(define-key evil-motion-state-map (kbd "] e") #'flycheck-next-error)
(define-key evil-motion-state-map (kbd "[ e") #'flycheck-previous-error)

;; unmap C-RET and C-S-RET, as they overlap with useful ORG mode commands
;; and I never used them anyway
(map! :gi "C-RET"      nil
      :gn [C-return]   nil
      :gi "C-S-RET"    nil
      :gn [C-S-return] nil)

;; org-mode
(after! org
  (setq org-log-done 'time ;; set timestamp when closing TODO item
        org-todo-keywords
            '((sequence "TODO(t)" "WIP(w)" "BLOCKED(b)" "|" "DONE(d)" "KILLED(k)" "POSTPONED(p)"))))

(setq company-global-modes '(not org-mode)) ;; disable company-mode for org-mode

;; docker
(after! docker (setq docker-compose-command "docker compose"))

;; Open dashboard as initial buffer by default
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; Start maximized in linux
(if IS-LINUX (add-to-list 'default-frame-alist '(fullscreen . maximized)))

;; Keep n rows above/below cursor
(setq scroll-margin 5)

;; Remove doom-specific title
(setq frame-title-format "%b – Emacs")

;; Python
;; Override 'poetry-tracking-mode to prevent doom from enabling it
(advice-add 'poetry-tracking-mode :override (lambda () ()))

;; Live preview in project search
(map! :leader "/" #'+vertico/project-search :desc "Search project")
