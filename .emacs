;; Enable loading of all plugins in ~/.emacs.d
(add-to-list 'load-path "/Users/ah/.emacs.d")

;; Highlight region
(transient-mark-mode 1)

;; Backup-Dir
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;; Use Windows-Key as Meta-Key
(setq x-super-keysym 'meta)

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)
(ido-everywhere t) 
(setq ido-confirm-unique-completion t) 
(setq ido-default-buffer-method 'samewindow) 
(setq ido-use-filename-at-point t) 
(setq ido-enable-flex-matching t) 
(set-face-background 'ido-first-match "white") 
(set-face-foreground 'ido-subdir "blue3") 
(icomplete-mode 1) 
(add-hook 'find-file-hook
          (lambda ()
            (setq default-directory command-line-default-directory)))

;; Vimpulse
;;(require 'vimpulse)

;; Rinari
(add-to-list 'load-path "/Users/ah/.emacs.d/rinari")
(require 'rinari)

;; YAML-Mode
(add-to-list 'load-path "/Users/ah/.emacs.d/yaml-mode")
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

;; yasnippet
(add-to-list 'load-path "/Users/ah/.emacs.d/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "/Users/ah/.emacs.d/yasnippet-0.6.1c/snippets")

;; ESS
(add-to-list 'load-path "/Users/ah/.emacs.d/ess-5.13")
(add-to-list 'load-path "/Users/ah/.emacs.d/ess-5.13/lisp")
(require 'ess-site)

;; CSCOPE
(require 'xcscope)

;; Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/ah/.emacs.d/ac-dict")
(ac-config-default)
;; Autocomplete displaying tags:
(defun ac-semantic-construct-candidates (tags)
  "Construct candidates from the list inside of tags."
  (apply 'append
         (mapcar (lambda (tag)
                   (if (listp tag)
                     (let ((type (semantic-tag-type tag))
                           (class (semantic-tag-class tag))
                           (name (semantic-tag-name tag)))
                       (if (or (and (stringp type)
                                    (string= type "class"))
                               (eq class 'function)
                               (eq class 'variable))
                         (list (list name type class))))))
                 tags)))

(defvar ac-source-semantic-analysis nil)
(setq ac-source-semantic
      `((sigil . "b")
        (init . (lambda () (setq ac-source-semantic-analysis
                                 (condition-case nil
                                                 (ac-semantic-construct-candidates (semantic-fetch-tags))))))
        (candidates . (lambda ()
                        (if ac-source-semantic-analysis
                          (all-completions ac-target (mapcar 'car ac-source-semantic-analysis)))))))

(setq ac-sources (append ac-sources '(ac-source-dictionary ac-source-abbrev ac-source-css-property ac-source-eclim ac-source-features ac-source-filename ac-source-files-in-current-dir ac-source-functions ac-source-gtags ac-source-imenu ac-source-semantic ac-source-semantic-raw ac-source-symbols ac-source-variables ac-source-words-in-all-buffer)))

;; Icicles
;; clashes with IDO
; (add-to-list 'load-path "/Users/ah/.emacs.d/icicles")
; (require 'icicles)
; (icy-mode 1)
; (require 'fuzzy-match)
;; Alacarte
; (require 'lacarte)
; (global-set-key [?\\e ?\\M-x] 'lacarte-execute-command)

