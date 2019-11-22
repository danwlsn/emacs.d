;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'nimbus-theme)
(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)
(require-package 'base16-theme)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(base16-atlas))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)


;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-day))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-bright))
  (reapply-themes))

(defun solar ()
  "Activate a solarized theme"
  (interactive)
  (setq custom-enabled-themes '(sanityinc-solarized-dark))
  (reapply-themes))

(defun base-eighties ()
  "Activate a eighties theme"
  (interactive)
  (load-theme 'base16-eighties t)
  (reapply-themes))

(defun base-atlas()
  "Activate a eighties theme"
  (interactive)
  (load-theme 'base16-atlas t)
  (reapply-themes))

(defun eighties ()
  "Activate a eighties theme"
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-eighties))
  (reapply-themes))

(defun nimbus ()
  "Activate the nimbus theme"
  (interactive)
  (setq custom-enabled-themes '(nimbus))
  (reapply-themes))

(when (maybe-require-package 'dimmer)
  (setq-default dimmer-fraction 0.15)
  (add-hook 'after-init-hook 'dimmer-mode)
  ;; TODO: file upstream as a PR
  (after-load 'dimmer
    (advice-add 'frame-set-background-mode :after (lambda (&rest args) (dimmer-process-all)))))


(provide 'init-themes)
;;; init-themes.el ends here
