(setq vc-follow-symlinks t) ;; necessary as emacs config is symlinked
(org-babel-load-file (locate-user-emacs-file "configuration.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-rust-analyzer-cargo-run-build-scripts t nil nil "Customized with use-package lsp-mode")
 '(package-selected-packages
   '(yaml-mode mistty multi-vterm yasnippet-snippets which-key vertico treesit-auto super-save string-inflection rg ranger rainbow-delimiters quelpa-use-package protobuf-mode poetry php-mode origami org-modern orderless no-littering mood-line modus-themes marginalia lsp-ui lsp-pyright just-mode jinja2-mode hl-todo helpful gptel git-timemachine git-link general gcmh forge flycheck-credo exunit exercism exec-path-from-shell evil-visualstar evil-surround evil-org evil-numbers evil-nerd-commenter evil-multiedit evil-collection embark-consult elm-mode elixir-ts-mode eat docker direnv diff-hl dashboard dap-mode consult-lsp company-box better-jumper bash-completion apheleia all-the-icons-completion))
 '(package-vc-selected-packages
   '((whisper :url "https://github.com/natrys/whisper.el" :branch "master"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
