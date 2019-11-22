;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt"
      fill-column 80)

(require-package 'pip-requirements)
;; elpy
(require-package 'elpy)
(elpy-enable)

;; sets elpy to use pytest-runner
(setq elpy-test-runner 'elpy-test-pytest-runner)


;; remap M-. after elpy
(define-key evil-normal-state-map "\M-." 'elpy-goto-definition)
(define-key evil-normal-state-map "\M->" 'elpy-goto-definition-other-window)

(setenv "WORKON_HOME" "/home/wilson/.local/share/virtualenvs")

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (after-load 'python
        (push 'company-anaconda company-backends)))))


(provide 'init-python)
;;; init-python.el ends here
