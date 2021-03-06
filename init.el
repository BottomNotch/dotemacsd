;;activate all the packages (in particular autoloads)
(package-initialize)

; list wanted packages
(setq package-list '(evil-nerd-commenter
                     avk-emacs-themes
                     tabbar
                     sublimity
                     workgroups2
                     ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (avk-darkblue-white)))
 '(custom-safe-themes
   (quote
    ("e5c6caa4860b1ba51dc5ad335c0c2734ea650a6098dd9652a1ab3d9aa702e185" default)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (workgroups2
     sublimity tabbar
     avk-emacs-themes
     evil-nerd-commenter
     auto-overlayscomplete
     dash
     ))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;fetch the list of packages available
(package-refresh-contents)

;;install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'sublimity)
(require 'sublimity-scroll)
(require 'sublimity-map)
;;(require 'sublimity-attractive)
(sublimity-mode 1)

;;don't use tab characters, they're evil and will murder your dog
(setq-default indent-tabs-mode nil)

;;my prefered indent length
(setq c-basic-offset 4)

;;show line numbers
(global-linum-mode 1)

(tabbar-mode 1)
;;my prefered coding style
(setq c-default-style '((java-mode . "bsd")
                        (other . "bsd")))

;; show column n
;;don't use tab characters, they're evil and will murder your dog
(setq-default indent-tabs-mode nil)

;;my prefered indent length
(setq c-basic-offset 4)

;;show line numbers
(global-linum-mode 1)

;;my prefered coding style
(setq c-default-style '((java-mode . "bsd")
                        (other . "bsd")))

;; show column number
(setq column-number-mode t)

;;crap, I can't even remember what this does, I'll just leave it I guess...
(defun my-make-CR-do-indent ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-make-CR-do-indent)

;;better commenting
(evilnc-default-hotkeys)

;; use "//" instead of "/**/"
(add-hook 'c-mode-common-hook
  (lambda ()
    ;; Preferred comment style
    (setq comment-start "// "
          comment-end "")))

;;make it obvious when there's more than 80 character on one line.
;;if you exceed 80 characters and don't fix it, you're an evil person.
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;;set font
(set-face-attribute 'default t :font "monospace-10")
(set-frame-font "monospace-8" nil t)

;;remove tool bar
(tool-bar-mode -1)
