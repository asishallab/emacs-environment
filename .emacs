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
(add-to-list 'ac-dictionary-directories "/Users/ah/.emacs.d//ac-dict")
(ac-config-default)

;; Replace $RSENSE_HOME with the directory where RSense was installed in full path
;; Example for UNIX-like systems
;; (setq rsense-home "/home/tomo/opt/rsense-0.2")
;; or
;; (setq rsense-home (expand-file-name "~/opt/rsense-0.2"))
;; Example for Windows
;; (setq rsense-home "C:\\rsense-0.2")
(setq rsense-home "/Users/ah/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
;; Complete by C-c .
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "TAB") 'ac-complete-rsense)))
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;; yasnippet
(add-to-list 'load-path "/Users/ah/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "/Users/ah/.emacs.d/yasnippet-0.6.1c/snippets")