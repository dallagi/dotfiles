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
;; Double font size on Linux (currently disabled)
(let* ((font-size 25))
  (setq doom-font (font-spec :family "Fira Code" :size font-size :weight 'semi-light)
        doom-variable-pitch-font (font-spec :family "Fira Sans" :size font-size)))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)

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

;; Make modeline smaller.
;; Note that height is given in units of 1/10th of point, so 150 -> 15pt
(setq +modeline-height 18)

;; Packages
(use-package! ace-window :commands ace-window)

(use-package! ranger :commands ranger)

(use-package! dashboard
  :init
  (setq dashboard-items '((agenda  . 5)
                          (projects . 5)))
  (setq dashboard-startup-banner 2)

  :config
  (dashboard-setup-startup-hook))

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; LSP
(with-eval-after-load 'lsp-mode
  (setq lsp-auto-execute-action nil)
  (setq lsp-file-watch-threshold 2000)
  (setq lsp-rust-analyzer-server-display-inlay-hints t)
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\target\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\target-docker\\'")
  )


;; Which key
(setq which-key-use-C-h-commands t)

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

(after! org
  (setq org-log-done 'time) ;; set timestamp when closing TODO item
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WIP(w)" "BLOCKED(b)" "|" "DONE(d)" "KILLED(k)" "POSTPONED(p)")))
  )

(setq company-global-modes '(not org-mode)) ;; disable company-mode for org-mode

;; anki
(use-package! anki-editor
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

;; Remove doom-specific title
(setq frame-title-format "%b – Emacs")

;; Mail
;; recommended by doom emacs documentation
(after! mu4e
  (setq sendmail-program (executable-find "msmtp")
        send-mail-function #'smtpmail-send-it
        message-sendmail-f-is-evil t
        message-sendmail-extra-arguments '("--read-envelope-from")
        message-send-mail-function #'message-send-mail-with-sendmail))


;; FUNCTIONS

;; TODO: allow setting deps for dev/test only

(use-package! request)

;; HEX-SEARCH

(defun hex-search (package-name) "Search PACKAGE-NAME on Hex and show info." (interactive "sSearch package: ")
       (mix-search
        package-name
        (lambda (packages)
          (apply-to-mix-package-among
           packages
           (lambda (package) (do-hex-info (cdr (assoc 'name package)))))
          )))

(defun hex-info (package-name) "Show info about Hex package PACKAGE-NAME." (interactive "sPackage name: ")
       (do-hex-info package-name))

(defun get-hex-info (name success-callback)
  (request (concat "https://hex.pm/api/packages/" name)
    :parser 'json-read
    :status-code '((404 . (lambda (&rest _) (message "Package not found."))))
    :success (cl-function
              (lambda (&key data &allow-other-keys) (funcall success-callback data)))
    ))

(defun do-hex-info (package-name) "Show info of Hex package PACKAGE-NAME."
  (get-hex-info
   package-name
   (lambda (package-data)
     (let ((buffer-name (concat "*hex-info-" package-name "*")))
     (with-output-to-temp-buffer buffer-name
       (princ (string-quote (cdr (assoc 'name package-data))))
       (princ (concat " - " (cdr (assoc 'description (cdr (assoc 'meta package-data))))))
       (princ "\n\nInfo:")

       (princ "\n\tLicenses:       ")
       (princ (mapconcat
               (lambda (license) (string-quote license))
               (cdr (assoc 'licenses (cdr (assoc 'meta package-data))))
               ", "))

       (princ "\n\tLatest version: ")
       (princ (string-quote (cdr (assoc 'latest_stable_version package-data))))

       (princ "\n\tOwners:         ")
       (princ (mapconcat
               (lambda (owner-data) (string-quote (cdr (assoc 'username owner-data))))
               (cdr (assoc 'owners package-data))
               ", "))


       (princ (concat "\n\nConfig:"))
       (princ (concat "\n\t"))
       (princ (mapconcat
               (lambda (config) (concat (symbol-name (car config)) ": " (string-quote (cdr config))))
               (cdr (assoc 'configs package-data))
               "\n\t"))


       ;; TODO align values
       (princ "\n\nLinks:")
       (let* ((package-custom-links (cdr (assoc 'links (cdr (assoc 'meta package-data)))))
              (links (append
                      `((Hex . ,(cdr (assoc 'html_url package-data)))
                        (Docs . ,(cdr (assoc 'docs_html_url package-data))))
                      package-custom-links)))
         (princ "\n\t")
         (princ (mapconcat (lambda (link) (concat (symbol-name (car link)) ": " (string-quote (cdr link)))) links "\n\t"))
         )

       (princ "\n\nDownloads:")
       (princ "\n\tAll:    ")
       (princ (cdr (assoc 'all (cdr (assoc 'downloads package-data)))))
       (princ "\n\tRecent: ")
       (princ (cdr (assoc 'recent (cdr (assoc 'downloads package-data)))))

       (princ "\n\nReleases:")
       (princ "\n\t")
       (princ (mapconcat (lambda (release) (concat
                                            (string-quote (cdr (assoc 'version release)))
                                            " ("
                                            (format-time-string "%F" (encode-time (iso8601-parse (cdr (assoc 'inserted_at release)))))
                                            ") - "
                                            (string-quote (cdr (assoc 'url release)))
                                            ))
                         (cdr (assoc 'releases package-data))
                         "\n\t"))
       )))))


(defun string-quote (text) (concat "`" text "'"))

;; MIX-ADD

(defun search-result-package-info (package-data)
  (let* (
         (name (cdr (assoc 'name package-data)))
         (meta (cdr (assoc 'meta package-data)))
         (description (cdr (assoc 'description meta)))
         (configs (cdr (assoc 'configs package-data)))
         (mix (cdr (assoc 'mix.exs configs)))
         )
    `((name . ,name) (description . ,description) (mix . ,mix))))

(defun mix-search (name success-callback)
  (request "https://hex.pm/api/packages"
    :params `(("search" . ,name) ("sort" . "recent_downloads"))
    :parser 'json-read
    :success (cl-function
              (lambda (&key data &allow-other-keys)
                (let ((packages (cl-map 'vector 'search-result-package-info data)))
                  (funcall success-callback packages)
                  ))
              )))

(defun do-mix-add (name)
  (mix-search name (lambda (found-packages) (add-mix-package-among found-packages))))

(defun mix-add (name)
  "Search hex package NAME and insert it in format for mix.exs."
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
    package-info))

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
  (apply-to-mix-package-among packages 'do-add-mix-package)
  )

(defun apply-to-mix-package-among (packages callback)
  "Apply a function over the given mix package. If multiple packages are supplied, asks user for selection of a single one."
  (cond
   ((= 0 (length packages)) (message "No such package found!"))
   ((= 1 (length packages)) (funcall callback (aref packages 0)))
   (t (funcall callback (choose-package packages)))
   ))

(defun do-add-mix-package (package)
  (let ((mix (cdr (assoc 'mix package))))
    (end-of-line)
    (newline-and-indent)
    (insert mix)
    (insert ",")))


;;;;;;;;;;;;;;;;;;;
;; PRODIGY STUFF ;;
;;;;;;;;;;;;;;;;;;;

(prodigy-define-service
  :name "Lira"
  :command "docker"
  :args '("compose" "run" "--rm" "--service-ports" "web" "sh -c \"cargo make db-reset && cargo make run\"")
  :cwd "~/Workspace/Prima/lira"
  :tags '(work)
  :ready-message "Starting [0-9]+ workers"
  :url "http://localhost:3102/"
  :stop-signal 'sigterm
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "PG Frontend"
  :command "docker"
  :args '("compose" "up")
  :cwd "~/Workspace/Prima/platform-global-fe"
  :tags '(work)
  :ready-message "Project is running at"
  :stop-signal 'sigterm
  :kill-process-buffer-on-stop t)

(prodigy-define-service
  :name "PG Backend"
  :command "docker"
  :args '("compose" "run" "--rm" "--service-ports" "web" "sh -c \"cargo make run\"")
  :cwd "~/Workspace/Prima/platform-global"
  :tags '(work)
  :stop-signal 'sigterm
  :kill-process-buffer-on-stop t)
