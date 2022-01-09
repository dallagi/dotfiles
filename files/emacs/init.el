;; add my own functions to load path
(add-to-list
 'load-path
 (expand-file-name "dallagi-emacs" user-emacs-directory))

;; configure packages
(load "packages.el")

;; TWEAK APPEARANCE

;; relative line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; font
(set-face-attribute 'default nil
                    :family "FiraCode"
                    :height 160
                    :weight 'semi-light)

;; disable bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; TODO find out how to move these to another file
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(diff-hl git-gutter-fringe fringe-helper git-gutter magit dashboard spaceline ranger doom-themes atom-one-dark-theme helpful evil-collection projectile counsel ace-window general which-key ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
