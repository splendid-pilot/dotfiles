;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory') - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(after! recentf
  (run-at-time 100 (* 5 60) 'recentf-save-list)
  )

(use-package! rime
  :custom
  ;; (
  ;; default-input-method "rime")
  (setq rime-show-candidate 'posframe)
  )

(defun rime-evil-escape-advice (orig-fun key)
  "advice for `rime-input-method' to make it work together with `evil-escape'.
        Mainly modified from `evil-escape-pre-command-hook'"
  (if rime--preedit-overlay
      ;; if `rime--preedit-overlay' is non-nil, then we are editing something, do not abort
      (apply orig-fun (list key))
    (when (featurep 'evil-escape)
      (let (
            (fkey (elt evil-escape-key-sequence 0))
            (skey (elt evil-escape-key-sequence 1))
            )
        (if (or (char-equal key fkey)
                (and evil-escape-unordered-key-sequence
                     (char-equal key skey)))
            (let ((evt (read-event nil nil evil-escape-delay)))
              (cond
               ((and (characterp evt)
                     (or (and (char-equal key fkey) (char-equal evt skey))
                         (and evil-escape-unordered-key-sequence
                              (char-equal key skey) (char-equal evt fkey))))
                (evil-repeat-stop)
                (evil-normal-state))
               ((null evt) (apply orig-fun (list key)))
               (t
                (apply orig-fun (list key))
                (if (numberp evt)
                    (apply orig-fun (list evt))
                  (setq unread-command-events (append unread-command-events (list evt))))))
              )
          (apply orig-fun (list key)))))))

(advice-add 'rime-input-method :around #'rime-evil-escape-advice)
(require 'saveplace-pdf-view)
(save-place-mode 1)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(use-package! consult-gh
  :custom
  (consult-gh-repo-maxnum 30) ;;set max number of repos to 30
  (consult-gh-issues-maxnum 100) ;;set max number of issues to 100
  (consult-gh-show-preview t) ;;show previews
  (consult-gh-preview-key "M-o") ;;show previews on demand by hitting "M-o"
  (consult-gh-preview-buffer-mode 'org-mode) ;;show previews in org-mode
  (consult-gh-repo-action #'consult-gh--repo-browse-files-action) ;;open file tree of repo on selection
  (consult-gh-issue-action #'consult-gh--issue-view-action) ;;open issues in an emacs buffer
  (consult-gh-pr-action #'consult-gh--pr-view-action) ;;open pull requests in an emacs buffer
  (consult-gh-code-action #'consult-gh--code-view-action) ;;open files that contain code snippet in an emacs buffer
  (consult-gh-file-action #'consult-gh--files-view-action) ;;open files in an emacs buffer
  (setq! consult-gh-default-clone-directory "~/Files/02_Repo")
  :config
  (add-to-list 'consult-gh-default-orgs-list "splendid-pilot") ;;add your GitHub user
  )
(after! projectile-mode
  add-to-list 'savehist-additional-variables 'consult-gh--known-orgs-list) ;;keep record of searched orgs

(after! projectile-mode
  add-to-list 'savehist-additional-variables 'consult-gh--known-repos-list)
