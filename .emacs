;; Enable loading of all plugins in ~/.emacs.d
(add-to-list 'load-path "/Users/ah/.emacs.d")

;; Highlight region
(transient-mark-mode 1)

;; Icicles
(add-to-list 'load-path "/Users/ah/.emacs.d/icicles")
(require 'icicles)
(icy-mode 1)

;; Alacarte
(require 'lacarte)
(global-set-key [?\e ?\M-x] 'lacarte-execute-command)

;; Vimpulse
;;(require 'vimpulse)

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; Rinari
(add-to-list 'load-path "/Users/ah/.emacs.d/rinari")
(require 'rinari)

;; YAML-Mode
(add-to-list 'load-path "/users/ah/.emacs.d/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; CSS-Mode
;;(require 'css-mode-simple)
;;(add-to-list 'auto-mode-alist '("\\.css$" . css-mode-simple))

;; ruby-mode
;; loads ruby mode when a .rb file is opened.
(add-to-list 'load-path "/Users/ah/.emacs.d/ruby-mode")
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '(".rhtml$" . html-mode) auto-mode-alist))
;; autoindent
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))
;; irb in emacs-buffer
(require 'inf-ruby)
;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))

;; ido-mode
(setq ido-confirm-unique-completion t) 
(setq ido-default-buffer-method 'samewindow) 
(setq ido-use-filename-at-point t) 
(setq ido-enable-flex-matching t) 
(ido-mode t) 
(ido-everywhere t) 
(set-face-background 'ido-first-match "white") 
(set-face-foreground 'ido-subdir "blue3") 
(icomplete-mode 1) 

;; Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/ah/.emacs.d/ac-dict")
(ac-config-default)

;; yasnippet
(add-to-list 'load-path "/Users/ah/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "/Users/ah/.emacs.d/yasnippet-0.6.1c/snippets")

;; CEDET
(add-to-list 'load-path "/Users/ah/.emacs.d/cedet-1.0")
(load-file "/Users/ah/.emacs.d/cedet-1.0/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(require 'semantic-ia)
(semantic-load-enable-code-helpers) 
(semantic-load-enable-excessive-code-helpers)
(defun my-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'my-semantic-hook)

;; Emacs Code Browser - ECB
(add-to-list 'load-path "/Users/ah/.emacs.d/ecb-2.40")
(load-file "/Users/ah/.emacs.d/ecb-2.40/ecb.el")
(require 'ecb)
(require 'ecb-autoloads)

;; exuberant ctags with speedbar
(setq speedbar-use-imenu-flag t)
(setq speedbar-fetch-etags-command "/opt/local/bin/ctags")
(setq speedbar-fetch-etags-arguments '("-e" "-f" "-"))
;; Speedbar in same frame
(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)

;; ESS
(add-to-list 'load-path "/Users/ah/.emacs.d/ess-5.13")
(add-to-list 'load-path "/Users/ah/.emacs.d/ess-5.13/lisp")
(require 'ess-site)
