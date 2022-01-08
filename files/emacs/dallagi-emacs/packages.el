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
  :config ;; tweak package after loading it
  (evil-mode)
  (require 'general)
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
