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

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)
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

;; Set fonts
(setq doom-font (font-spec :family "Fira Code" :size 20 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 20))

;; Start maximized
;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Set location of elixir-ls language server
(setq lsp-clients-elixir-server-executable "~/.bin/elixir-ls/rel/language_server.sh")
(setq lsp-clients-kotlin-server-executable "~/.bin/kotlin-language-server/server/build/install/server/bin/kotlin-language-server")
(setq lsp-enable-file-watchers t)
(setq lsp-file-watch-threshold 5000)

;; Projectile config
(setq projectile-enable-caching nil)
(setq projectile-project-search-path '("~/Workspace"))

;; Make modeline smaller and using a variable-width font.
;; Note that height is given in units of 1/10th of point, so 150 -> 15pt
(after! doom-modeline
  (custom-set-faces!
    '(mode-line :family "Fira Sans" :height 150)
    '(mode-line-inactive :family "Fira Sans" :height 150))
  (setq doom-modeline-height 0))

;; Enable format and iex reload on save
(after! lsp
  (add-hook 'elixir-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'elixir-format nil t)
              (add-hook 'after-save-hook 'alchemist-iex-reload-module))))

;; Disable mapping for C-/ to avoid damage by pressing it mistakenly
(map! "C-/" nil)

;; Allow mixed fonts in a buffer. This is particularly useful for Org mode, so I can mix source and prose blocks in the same document.
(add-hook! 'org-mode-hook #'mixed-pitch-mode)
(setq mixed-pitch-variable-pitch-cursor nil)

;; Set indent to 4 spaces on web mode
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
