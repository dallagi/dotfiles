;; Enable installation of packages from MELPA.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; configure packages

(use-package general
  :ensure t
  :config
  (load "general/keymap.el")
  (general-set-base-keymap)
  )

(use-package evil
  :ensure t ;; install package if not installed
  :init
  (setq evil-want-keybinding nil) ;; necessary to use evil-collection
  :config ;; tweak package after loading it
  (evil-mode)
  (require 'general)
)

(use-package evil-collection
  :ensure t
  :config
  (evil-collection-init) ;; TODO: only enable for some modes?
  )

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
)

(use-package ivy
  :ensure t
  :config
  (ivy-mode)
  (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)
  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "C-u") 'ivy-scroll-down-command)
  (define-key ivy-minibuffer-map (kbd "C-d") 'ivy-scroll-up-command)
  (define-key ivy-minibuffer-map (kbd "C-g") 'ivy-beginning-of-buffer)
  (define-key ivy-minibuffer-map (kbd "C-S-G") 'ivy-end-of-buffer)
  )

(use-package counsel
  :ensure t
  :config
  (counsel-mode))

(use-package ace-window
  :ensure t
  :commands ace-window ;; defer loading until called
  )

(use-package which-key
  :ensure t
  :config
  (load "which-key/config.el")
  (which-key-configure-groups-description)
  (which-key-mode)
  )

(use-package helpful
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "K") #'helpful-at-point)
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variable-function #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  )

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-vibrant t)
  (doom-themes-org-config))

(use-package ranger
  :ensure t)

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-emacs-theme)
  )

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-items '((recents  . 5)
			  (projects . 5)
			  (agenda . 5)
			  (registers . 5)))
  (dashboard-setup-startup-hook))

(use-package magit
  :ensure t
  :commands magit-status
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package git-gutter
  :ensure t
  :config
  (git-gutter-mode)
  ;; Update git-gutter on focus (in case I was using git externally)
  (add-hook 'focus-in-hook #'git-gutter:update-all-windows)
  ;; update git-gutter when using magit commands
  (advice-add #'magit-stage-file   :after #'+vc-gutter-update-h)
  (advice-add #'magit-unstage-file :after #'+vc-gutter-update-h)
  )

(use-package fringe-helper ;; necessary for git-gutter-fringe
  :ensure t)

(use-package git-gutter-fringe ;; place git gutters in fringe
  :ensure t
  :config
  ;; standardize default fringe width
  (if (fboundp 'fringe-mode) (fringe-mode '4))
  ;; thin fringe bitmaps
  (define-fringe-bitmap 'git-gutter-fr:added [224]
    nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224]
    nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240]
    nil nil 'bottom)
  )
