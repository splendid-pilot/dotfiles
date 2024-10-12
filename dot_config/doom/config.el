;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Theodore Chen"
      user-mail-address "S2817582765@gmail.com")
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(setq doom-theme 'doom-tokyo-night)

(setq display-line-numbers-type 'relative)
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 18 :weight 'SemiBold))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


(setq org-directory "~/Projects/notes")
(setq org-roam-directory "~/Projects/notes/roam")
(setq org-hide-emphasis-markers t)

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package! rime
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'posframe)
  :bind
  (:map rime-mode-map
        ("C-`" . 'rime-send-keybinding))
  )

(use-package! chezmoi)
