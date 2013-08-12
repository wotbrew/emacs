(package-initialize)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))


(defvar my-packages '(starter-kit
		      starter-kit-lisp
		      starter-kit-bindings
		      starter-kit-eshell
		      clojure-mode
		      clojure-test-mode
		      nrepl
                      auto-complete
                      ac-nrepl
                      color-theme-solarized
                      rust-mode))

(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))


(provide 'clojure)
(dolist (p my-packages)

(when (not (package-installed-p p))
  (package-install p)))

(require 'ac-nrepl)
(load-theme 'solarized-dark t)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
   
(defun set-auto-complete-as-completion-at-point-function ()
	(setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook
          'set-auto-complete-as-completion-at-point-function)

(add-hook 'nrepl-mode-hook
          'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode-hook
          'set-auto-complete-as-completion-at-point-function)
   
(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

(global-auto-complete-mode 1)

