;; add my own functions to load path
(add-to-list
 'load-path
 (expand-file-name "dallagi-emacs" user-emacs-directory))

;; configure packages
(load "packages.el")

;; tweak appearance
(set-frame-font "FiraCode Nerd Font 18" nil t)

;; TODO find out how to move these to another file
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(counsel ace-window general which-key ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
