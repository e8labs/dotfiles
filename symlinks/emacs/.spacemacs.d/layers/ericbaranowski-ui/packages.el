;;; packages.el --- Spacemacs Layer Packages File
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst ericbaranowski-ui-packages
  '(
    all-the-icons
    editorconfig
    helm
    nov
    nyan-mode
    writeroom-mode
    yasnippet-snippets
   ))

(defun ericbaranowski-ui/init-all-the-icons ()
  (use-package all-the-icons :ensure t :defer t))

(defun ericbaranowski-ui/init-editorconfig ()
  (use-package editorconfig :ensure t :defer t))

(defun ericbaranowski-ui/init-nov ()
  (use-package nov :ensure t :defer t :config
    (setq nov-text-width 80)))

(defun ericbaranowski-ui/init-nyan-mode ()
  (use-package nyan-mode :ensure t :defer t))

(defun ericbaranowski-ui/init-writeroom-mode ()
  (use-package writeroom-mode
    :ensure t
    :defer t
    :init (spacemacs/set-leader-keys "aW" #'writeroom-mode)
  ))

(defun ericbaranowski-ui/init-yasnippet-snippets ()
  (use-package yasnippet-snippets :ensure t :defer t :init
    (autoload 'yasnippet-snippets-initialize "yasnippet-snippets" nil t)
    (eval-after-load 'yasnippet #'yasnippet-snippets-initialize)))

(defun ericbaranowski-ui/post-init-helm ()
  (with-eval-after-load 'helm
    (ido-mode 1)
    (helm-mode 1)
    (add-to-list 'helm-completing-read-handlers-alist
                 '(find-file-read-only . ido))
    (setq helm-mini-default-sources '(helm-source-buffers-list
                                      helm-source-recentf))))
