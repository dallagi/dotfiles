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
  (ivy-mode))

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
