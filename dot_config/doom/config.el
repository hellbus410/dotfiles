;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-vibrant
      display-line-numbers-type 'relative
      scroll-margin 8
      hscroll-margin 8
      evil-split-window-below t
      evil-vsplit-window-right t
      org-directory "~/notes/")

(when (or (executable-find "cc") (executable-find "gcc"))
  (setq treesit-auto-install-grammar 'always))

(after! magit
  (setq magit-diff-refine-hunk 'all))

(after! ediff
  (setq ediff-diff-options ""))

(after! diff-hl
  (setq diff-hl-show-hunk-function #'diff-hl-show-hunk-inline)
  (unless (display-graphic-p)
    (diff-hl-margin-mode +1))
  (add-hook! 'after-make-frame-functions
    (defun +vc-gutter-enable-margin-in-tty-h (frame)
      (unless (display-graphic-p frame)
        (diff-hl-margin-mode +1)))))

(after! diff-hl-margin
  (setq diff-hl-margin-symbols-alist
        '((insert . "│")
          (delete . "▁")
          (change . "│")
          (unknown . "?")
          (ignored . "i"))))

(map! :leader
      (:prefix "g"
       :desc "Preview hunk diff" "d" #'diff-hl-show-hunk)
      (:prefix "p"
       (:prefix ("v" . "direnv")
        :desc "Allow .envrc"     "a" #'envrc-allow
        :desc "Deny .envrc"      "d" #'envrc-deny
        :desc "Reload .envrc"    "r" #'envrc-reload
        :desc "Show envrc log"   "l" #'envrc-show-log)))

(after! nix-mode
  (set-eglot-client! '(nix-mode nix-ts-mode) '("nixd")))

(add-to-list 'auto-mode-alist '("\\.tofuvars\\'" . terraform-mode))
(after! terraform-mode
  (setq +terraform-runner "tofu"))

(after! dockerfile-ts-mode
  (add-hook 'dockerfile-ts-mode-local-vars-hook #'lsp! 'append))

(use-package! conf-mode
  :defer t
  :init
  (when (modulep! :tools tree-sitter)
    (set-tree-sitter! 'conf-toml-mode 'toml-ts-mode 'toml))
  :config
  (add-hook 'conf-toml-mode-local-vars-hook #'lsp! 'append)
  (set-eglot-client! '(conf-toml-mode toml-ts-mode) '("taplo" "lsp" "stdio")))

(after! toml-ts-mode
  (add-hook 'toml-ts-mode-local-vars-hook #'lsp! 'append))

(define-derived-mode ansible-yaml-mode yaml-mode "Ansible[YAML]")
(define-derived-mode ansible-yaml-ts-mode yaml-ts-mode "Ansible[YAML]"
  (setq-local indent-line-function #'yaml-indent-line))

(define-derived-mode docker-compose-yaml-mode yaml-mode "Compose[YAML]")
(define-derived-mode docker-compose-yaml-ts-mode yaml-ts-mode "Compose[YAML]"
  (setq-local indent-line-function #'yaml-indent-line))

(when (modulep! :tools tree-sitter)
  (set-tree-sitter! 'ansible-yaml-mode 'ansible-yaml-ts-mode 'yaml)
  (set-tree-sitter! 'docker-compose-yaml-mode 'docker-compose-yaml-ts-mode 'yaml))

(dolist (entry '(("/roles/.*/\\(?:tasks\\|handlers\\|defaults\\|vars\\|meta\\)/.*\\.ya?ml\\'" . ansible-yaml-mode)
                 ("/playbooks/.*\\.ya?ml\\'" . ansible-yaml-mode)
                 ("/\\(?:host_vars\\|group_vars\\|inventory\\)/.*\\.ya?ml\\'" . ansible-yaml-mode)
                 ("/\\(?:docker-\\)?compose\\(?:\\..*\\)?\\.ya?ml\\'" . docker-compose-yaml-mode)))
  (add-to-list 'auto-mode-alist entry))

(dolist (hook '(ansible-yaml-mode-local-vars-hook ansible-yaml-ts-mode-local-vars-hook))
  (add-hook hook #'ansible-mode)
  (add-hook hook #'ansible-doc-mode)
  (add-hook hook #'lsp! 'append))

(dolist (hook '(docker-compose-yaml-mode-local-vars-hook docker-compose-yaml-ts-mode-local-vars-hook))
  (add-hook hook #'lsp! 'append))

(set-eglot-client! '((ansible-yaml-mode :language-id "ansible")
                     (ansible-yaml-ts-mode :language-id "ansible"))
                   '("ansible-language-server" "--stdio"))

(set-eglot-client! '((docker-compose-yaml-mode :language-id "dockercompose")
                     (docker-compose-yaml-ts-mode :language-id "dockercompose"))
                   '("docker-compose-langserver" "--stdio"))

(setq-default
 eglot-workspace-configuration
 `(:yaml (:schemas (:kubernetes ["/*.k8s.yaml"
                                 "/*.k8s.yml"
                                 "/k8s/**/*.yaml"
                                 "/k8s/**/*.yml"
                                 "/manifests/**/*.yaml"
                                 "/manifests/**/*.yml"
                                 "/clusters/**/*.yaml"
                                 "/clusters/**/*.yml"]))
   ,@(when (file-directory-p "/run/current-system/sw/share/hypr/stubs")
       '(:Lua (:workspace (:library ["/run/current-system/sw/share/hypr/stubs"]))))))
