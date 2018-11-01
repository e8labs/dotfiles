;;; packages.el --- Spacemacs Layer Packages File
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst ericbaranowski-swift-packages
  '(
    company
    flycheck-swiftlint
    ggtags
    helm-gtags
    swift-playground-mode
   ))

(defun ericbaranowski-swift/init-flycheck-swiftlint ()
  (use-package flycheck-swiftlint :ensure t :defer t))

(defun ericbaranowski-swift/init-swift-playground-mode ()
  (use-package swift-playground-mode :defer t :init
    (autoload 'swift-playground-toggle-if-needed "swift-playground-mode" nil t)
    (add-hook 'swift-mode-hook #'swift-playground-toggle-if-needed)))

(defun ericbaranowski-swift/post-flycheck-swiftlint ()
  (with-eval-after-load 'flycheck (flycheck-swiftlint-setup)))

(defun ericbaranowski-swift/post-init-company ()
  (spacemacs|add-company-hook swift-mode))

(defun ericbaranowski-swift/post-init-ggtags ()
  (add-hook 'swift-mode-local-vars-hook #'spacemacs/ggtags-mode-enable))

(defun ericbaranowski-swift/post-init-helm-gtags ()
  (spacemacs/helm-gtags-define-keys-for-mode #'swift-mode))
